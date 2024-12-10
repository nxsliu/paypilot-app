import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:paypilot/enums/invoice_status.dart';
import 'package:paypilot/models/business.dart';
import 'package:paypilot/models/invoice.dart';

class InvoiceDisplay extends StatelessWidget {
  final Invoice invoice;
  final Business business;

  const InvoiceDisplay(
      {super.key, required this.invoice, required this.business});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (invoice.status == InvoiceStatus.Draft &&
            business.logoURL != null &&
            business.logoURL!.isNotEmpty)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(4.0),
                child: CachedNetworkImage(
                  imageUrl: business.logoURL!,
                  placeholder: (context, url) =>
                      const CircularProgressIndicator(
                    color: Colors.white,
                    strokeWidth: 3,
                  ),
                  width: 120.0,
                  height: 120.0,
                ),
              )
            ],
          )
        else if (invoice.logoURL != null && invoice.logoURL!.isNotEmpty)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(4.0),
                child: CachedNetworkImage(
                  imageUrl: invoice.logoURL!,
                  placeholder: (context, url) =>
                      const CircularProgressIndicator(
                    color: Colors.white,
                    strokeWidth: 3,
                  ),
                  width: 120.0,
                  height: 120.0,
                ),
              )
            ],
          ),
        const SizedBox(height: 24),
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                    text: TextSpan(children: [
                  TextSpan(
                      text: 'Invoice ',
                      style: Theme.of(context).textTheme.bodyLarge),
                  TextSpan(
                      text: '#${invoice.invoiceNumber}',
                      style: Theme.of(context).textTheme.bodyMedium),
                ])),
                const SizedBox(width: 14),
                Text(
                    'Issue Date ${DateFormat('dd MMMM yyyy').format(invoice.invoiceDateLocal)}',
                    style: Theme.of(context).textTheme.bodyMedium),
                const SizedBox(height: 18),
                Text(
                    'To: ${invoice.customer!.businessName.isNotEmpty ? invoice.customer!.businessName : invoice.customer!.name}',
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(fontWeight: FontWeight.bold)),
                const SizedBox(width: 14),
                if (invoice.customer!.businessName.isNotEmpty)
                  Text(invoice.customer!.name,
                      style: Theme.of(context).textTheme.bodyLarge),
                const SizedBox(width: 14),
                Text(invoice.customer!.email,
                    style: Theme.of(context).textTheme.bodyLarge),
              ],
            ),
          ],
        ),
        const SizedBox(height: 24),
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                    text: TextSpan(children: [
                  TextSpan(
                      text: NumberFormat.simpleCurrency(name: 'AUD')
                          .format(invoice.totalAmount),
                      style: Theme.of(context)
                          .textTheme
                          .headlineLarge
                          ?.copyWith(color: Colors.black)),
                  TextSpan(
                      text: ' AUD',
                      style: Theme.of(context).textTheme.titleMedium),
                ])),
                const SizedBox(height: 14),
                Text(
                    'Due on ${DateFormat('dd MMMM yyyy').format(invoice.dueDateLocal)}',
                    style: Theme.of(context).textTheme.titleMedium),
              ],
            ),
          ],
        ),
        const SizedBox(height: 24),
        const Divider(color: Colors.grey),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: invoice.invoiceItems.map((invoiceItem) {
                      return Row(
                        children: [
                          Expanded(
                              child: Text(invoiceItem.name!,
                                  style:
                                      Theme.of(context).textTheme.bodyLarge)),
                          Text(
                              NumberFormat.simpleCurrency(name: 'AUD').format(
                                  invoiceItem.unitCost * invoiceItem.quantity),
                              style: Theme.of(context).textTheme.bodyLarge),
                          const SizedBox(height: 20),
                        ],
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                          child: Text('Subtotal',
                              style: Theme.of(context).textTheme.titleMedium)),
                      Text(
                          NumberFormat.simpleCurrency(name: 'AUD')
                              .format(invoice.totalNoGSTAmount),
                          style: Theme.of(context).textTheme.titleMedium)
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Expanded(
                          child: Text('10% GST',
                              style: Theme.of(context).textTheme.titleMedium)),
                      Text(
                          NumberFormat.simpleCurrency(name: 'AUD')
                              .format(invoice.totalGSTAmount),
                          style: Theme.of(context).textTheme.titleMedium)
                    ],
                  ),
                  const SizedBox(height: 24),
                  Row(
                    children: [
                      Expanded(
                          child: Text('Total',
                              style:
                                  Theme.of(context).textTheme.headlineSmall)),
                      Text(
                          NumberFormat.simpleCurrency(name: 'AUD')
                              .format(invoice.totalAmount),
                          style: Theme.of(context).textTheme.headlineSmall)
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        const Divider(color: Colors.grey),
        const SizedBox(height: 24),
        if (invoice.message != null && invoice.message!.isNotEmpty)
          Text(invoice.message!,
              style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 32),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(business.name, style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(business.owner.email,
                style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
        const SizedBox(height: 48),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Powered by', style: Theme.of(context).textTheme.bodySmall),
            Image.asset(
              'assets/images/paypilot_logo_black.png',
              height: 21.0,
              width: 64.5,
            ),
          ],
        ),
      ],
    );
  }
}

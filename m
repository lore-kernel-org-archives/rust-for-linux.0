Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24383C432BE
	for <rust-for-linux@archiver.kernel.org>; Thu,  2 Sep 2021 00:51:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E479360F91
	for <rust-for-linux@archiver.kernel.org>; Thu,  2 Sep 2021 00:51:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229909AbhIBAv6 (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Wed, 1 Sep 2021 20:51:58 -0400
Received: from mail-eopbgr110123.outbound.protection.outlook.com ([40.107.11.123]:35653
        "EHLO GBR01-CWL-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229670AbhIBAv6 (ORCPT <rfc822;rust-for-linux@vger.kernel.org>);
        Wed, 1 Sep 2021 20:51:58 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=flwF2NlfdPgkafQQD4nq2J8LJbHK2DtQ1Ip7HYB4gR9R0cyHTd4X2bz9AZe6nWvIqLRSUuypeyJYF6cEWJ+7v9fhBk2NaNTHmdhVKEcC2ajwtm9bsY7mrqPxyCqbEkHIBS/w7Tq/ZMata5S335/UKyg5PHmUaFA8jHU7Qth+fGGjHoYllXSm7/y+c3FJwPumhD0E4nx/EGOoSex9u2D0DW5VIrsmN1yoXo/65/L/7rGPbmWrONe81Lbhw184dpqjI8BhDPXuKnul8IiT520+JIKsPnZVejszhgMVyI3M/NMCkkAZ5rfwGxGKIoboS+rNIfqRHhSAAC65QKGq3uPFmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=awFTacN3fABB49wGccmhJDPDv6/TJD0kNQmN12givks=;
 b=Tqh31p9DQ4vsY2IFXj5J7uI3rZe8+yOapIvzxVUrv9yPH9kJvnhzPQulLs1aZDXtLVtMX3IX+gX+OLyYDqJXqgDvWzjPmlc1UDchJH6wq6jU4qtI6W3+Kqb/18AvDNu7GJMvRXA1KEHG0RP5tWCbqVwht6BR7wU7HEypcWucubOJ1szdFjsaqQQA4AfFb8570ZIvgaQpdM9PBtzDEDT9OwJLlRz06a0Pgoo2Lz1mlj4rz3YYsblIjvlfJhnkLjMVLPAnSnIjgkDzNzhDeS0RmXwyxJh90EXHBmq1kvrU+zDPYXe8YM5n0pdcG2il3XMvjVJvx1MWviWezmzcxIBnXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=awFTacN3fABB49wGccmhJDPDv6/TJD0kNQmN12givks=;
 b=JZ0dG70IfrqfW3Pviu6ds+UH5Fm7jm1QqFE0Q62oLNlxkGGCkQ+cHu+nZSkSveRjaTH4kuPDlGx9bT4453UGQlv3ap+F/kb27/1PutsRJKY1R8QWNCSHPhMgJVEw/uyqOrVIhxX9XBoWg26gxSlUKFcKr7hom024uJKL1MgAXRA=
Authentication-Results: dxuuu.xyz; dkim=none (message not signed)
 header.d=none;dxuuu.xyz; dmarc=none action=none header.from=garyguo.net;
Received: from LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:253::10)
 by LO0P265MB4912.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:210::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19; Thu, 2 Sep
 2021 00:50:58 +0000
Received: from LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 ([fe80::b95f:3221:31e0:7cc5]) by LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 ([fe80::b95f:3221:31e0:7cc5%5]) with mapi id 15.20.4478.019; Thu, 2 Sep 2021
 00:50:58 +0000
Date:   Thu, 2 Sep 2021 01:50:56 +0100
From:   Gary Guo <gary@garyguo.net>
To:     Daniel Xu <dxu@dxuuu.xyz>
Cc:     rust-for-linux@vger.kernel.org
Subject: Re: How are rustc -Z flags enabled during build?
Message-ID: <20210902015056.00003b3c@garyguo.net>
In-Reply-To: <20210901230715.civmnrpmt3c2u72v@kashmir.localdomain>
References: <20210901230715.civmnrpmt3c2u72v@kashmir.localdomain>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; i686-w64-mingw32)
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0063.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:153::14) To LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:253::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (2001:470:6972:501:74fd:425:9a7a:f829) by LO4P123CA0063.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:153::14) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19 via Frontend Transport; Thu, 2 Sep 2021 00:50:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 12fcc4d2-6436-4d79-1788-08d96dabba89
X-MS-TrafficTypeDiagnostic: LO0P265MB4912:
X-Microsoft-Antispam-PRVS: <LO0P265MB4912781E4E4FD3FDD1616EEAD6CE9@LO0P265MB4912.GBRP265.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JcGLt+pWmOIy1ImkXlkHUN11Oe9aItw8LWpBXClsLdTAT+ToyAk+9RXY/1gBhhbCEhH1bh/+onBZx2Txq3dhBjHPLCZnU7t8nCBvUxQP1kTSRwqq0LRu9NEAttAF+sbt1gFD+wegHg6GPr7K1tDRpoW4/BqPQDC5bsvGlpRBBxe5KA+GOsfuN5LECzH1p1XL3DfeVpKEWyXRn/iUPff021y5r9Gr/dCJW+ODLMW6fOQTWf3RXV7V+elNygvHLc/VFfX/Ki1cNaLFu5Qjt9jxBPIfvU2jDFj5P+gtkDVIeBQz3nr0grNUTiGb33YzSFZN+T2aV62IgngPzuDb8MixQsb1lPIkxA5qs6rMvLFentgmH2t6yZai+lbPOA+iPTdK307OpyhKo8fkAyd4GhwlQGInBPVrTN+G8KRrl+vIUzT2qnxPWAfOZRJewwW+8FlyJh33GF2Hw29CIm0X5Kfk+O24JAIxMUqSWICYx3SFUlp8CVgn44x9ZiDr8TNW/V/my2uUCvyXta2KTTYIGygEq2/DOvOnW+wor1wPp1aylnpY5eKBLveRl19gA7S2TPmpsnKy0ojv4MNQevqaz8LWP6Kb6Ha5BEH4STQjNrCXWE8yW7EvYfx/yjmVtEDuo+05KkKk1pFbg6lna/+Gt+dodA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(136003)(346002)(396003)(366004)(39830400003)(376002)(478600001)(38100700002)(8936002)(6496006)(36756003)(66556008)(316002)(6916009)(8676002)(52116002)(186003)(4744005)(2616005)(86362001)(4326008)(5660300002)(6486002)(1076003)(66476007)(2906002)(66946007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JmLT7NRmLX5e83f6LtR4zntpud2z7dZJdiEf6pTE4hkjBCZxB0iQVFsfAUTa?=
 =?us-ascii?Q?SUg2Fy3VEWyh2pD49RGS1Y6ZgvB+6oMDTCoBRjE7wpzrxIbFaDaOVLWCwIK2?=
 =?us-ascii?Q?eumBtFnruiRYHhwML2KOvQx10tZCtpsUKmFpx6nLNnk0A0KKmVdLLNneRl1X?=
 =?us-ascii?Q?cFmXDL/dDJaS8vcD4/3KOBp+CpyaPqOuj+tDMz8gRvQePVaKMAuNGlEMmmHA?=
 =?us-ascii?Q?6uYNeDCa828gES8eKyYFQZ8LSJ3VkYhemgKuzv8YA2FCEpcnUjUF/cTGJpcN?=
 =?us-ascii?Q?2wiali1lXeyQFt0hMbcA1V6sjzMHp+ZAFk6fC7gpo1TdxiH3xA/zkgKT22R8?=
 =?us-ascii?Q?GolpBCSrvooCBLHmJrIhCbwa5imdUBAvZYgJb0yw1LeF8I+YUsVuJjnIRSEE?=
 =?us-ascii?Q?FkYaFaw1SMw2oQ3yFnhuet5q/BuzJrmjMQRDPuGCtoqz+gBu4EaLSt36oRcs?=
 =?us-ascii?Q?wB0Lr0eE3a6mDsemo0lNRmCx7SEDgx2PCmxzpzsUDQ+mLyObXOLAyCpbsT3y?=
 =?us-ascii?Q?vblF1AJ6VkqlrgZvE7ZYessPiqQvH4mFZoXPVa1/Of//i/X8i6nw3SiiiE/D?=
 =?us-ascii?Q?7hKxP7RzJUDcVbAbTdBfmFuSbHk7mP4V9XCdlEy2+Px0bj0frdoCzvfbzX69?=
 =?us-ascii?Q?hY6uVAK6iO5X5wndrG0qMGI2/kztPn6NVqxZQVUv+3zWLXw9I29mlq2x0ulO?=
 =?us-ascii?Q?A533J5AaI76GJAL+H9SZqFap5kvRqdjDcJ1qSpz2/+R8zJM5iDJHCnTzcq/T?=
 =?us-ascii?Q?qE82/DLtJsYAjU9FDqdkFQ2YE3BJpATLMKYUxTnGX2e1/f9kt6FegH5Ac7x8?=
 =?us-ascii?Q?Tq1VTRiAItVb4l6NvAp2IinFK73HsbNqEkjP+vVTaZwKktSxpbaXlrwxYLPx?=
 =?us-ascii?Q?OtymP5ytq+h7it5Jl0n0x7qi1toZ7ZKMpam1aQ2HkFq14WW8bDTVD+9G8uXY?=
 =?us-ascii?Q?gLK2nD88LeSNZwEyD9Hv1bfm0yDs9U8EPewb15kHSWQPMMvwvO9chLv6kcVB?=
 =?us-ascii?Q?ii7YmCetwcvk6CSltC0U644Pfd+ce9Bi0dg0PFf6honPQlI+gOHkYzs/F2BI?=
 =?us-ascii?Q?7qIhLOO4VmtLy7Ghd/Jfn7/gxq8VzfYBJPn4DiXQ/euoc+011QNAZ6+jmEm7?=
 =?us-ascii?Q?g59T1sXlFZkHLg6b9tmerN007pFi4AM3fOR56qacnJZKvRYKTSBkRUFD/k0K?=
 =?us-ascii?Q?l6hFLlWbykq/MwZwJ3K/4Tu+20Xc60myZ0R7bBvqqfX4gisdbV1hpcF4zGL3?=
 =?us-ascii?Q?eqrYJxUNKsNdr9vy2gVQ8E1zItN4w3cTNFw8Hq1dN4QWWZgnoe4NYdL7QK7c?=
 =?us-ascii?Q?GNUrUHNsZDn19aLEu4jjPD/wwqN+lBbNTX/96TkyoGo3Ik6kGj8iPbsVDTEl?=
 =?us-ascii?Q?NZpljG78FnwU3yTkeSVGf5rX5pqk?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 12fcc4d2-6436-4d79-1788-08d96dabba89
X-MS-Exchange-CrossTenant-AuthSource: LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2021 00:50:58.7481
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eHhLjQLkBkGUsA4qoGnn21VoyRdelh017zjcoO93JqXLvKn0GD/aL4bg/p6Ol/jLZTwFNKDlQz3csMEvWXr0Rw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO0P265MB4912
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Wed, 1 Sep 2021 16:07:15 -0700
Daniel Xu <dxu@dxuuu.xyz> wrote:

> 
> When I try to run it outside of kbuild, I get:
> 
>     error: the option `Z` is only accepted on the nightly compiler
> 
> How does kbuild use the -Z features on a stable rustc?
> 

You can set environment variable `RUSTC_BOOTSTRAP=1`.

- Gary Guo

Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012009.outbound.protection.outlook.com [40.107.200.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E17F34EF06;
	Wed, 28 Jan 2026 12:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769603755; cv=fail; b=YIee7I5vpMqMT3y3ZL5fAc0mctH3hXXodUlsK7jEJWLvLxppDxqqe4Gwi/9d+Rpies4jjbqu6CeJ7dGvIPTOPSd8CYsu0rBWL5jsqOzKQl+aPqbyeDGXENTEAMp3l8ukiHApAdidkmTXNVu+W9U7vj/JJXgSuZ7xYkWbwlsSVWQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769603755; c=relaxed/simple;
	bh=g/+h3IGpkPH5yFvf6xFAuATyvO4qCYF9o8WxD2KEwJE=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RYoF1s4jXjlygxbCIk+7EoKMS8xSweWK+myvJAA9mEE/ChZgGTBaReRgGRpndVfy84QqQU02TEBdFkPAXchNxM2RN+HWWwrdkt+mIc3YIxRiYH/AMIiUerQyDr4SR2SZL9OfRwXYB+S0AppEwAdfSKuA8vUXdBR9Pi1wvMI4Jio=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Ac/IOhDo; arc=fail smtp.client-ip=40.107.200.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Ac/IOhDo"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FYxQVyZ+t0psmJNwn3UckPgRC6x5bA/C1TYS4McNqwdtCQlWZ0zT+gNJ7XBSpjZaijFnjRTDaGfOVZ/qpLf3xb5SfP4Sslk0akocp06o8CQ77QEwyLTmfBcUIV3RhE+LsK4CXd334UP5MM7UxXHxKs4eZbfmuB4UOiGxAZ/UUrK/r0JEEjcJvNDLfNfuMKLgK8SoOjyAND8uDXghwuogPBUDdweS0rX+J5afzsu1ntp12m9qFYD6Vok2FtAibKYDEHDiTwa6ZJwMdB1D3eeN2uo6YJJPBsUJaq4RcIoEXI2UJAS6IBAZWnXg3jD7PH4pBe5PlO7AiTsMk3wTfGfiwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BhmA6d55ZWU6+MX9xqMgvMugDWGHsjfN2s20ZF0sAA4=;
 b=RzfkUFwG7VZRC6jX+DBRs0Cur6hJHLjKw4BU8iKxWHOLLeavi9mIaj3lquw46fVHIX3rQjZ5B68fydQHv3MbBfEGSSZtj1QgdrdRb7L9TvDqJ92/4QSwYfb+3mg8krD7xse8dXBm173KXwPmOa1x3MntIqEAt/zwxTihSiiWjlfuAvZrQA7QFpaPULwrE8MTU+a8l6trGbRs94EqKXIACvSos8qzS8LyBEl9TDVayBQX6jn4MqqMwjW1sbB3YOF0aoLL3b1supmJmrQDh1y42XnTDl2rtio7E2WiOhwngN65Vsz078DvxYbF5chJpdGuf0Ul9Ix6/9v0qkTwpw9Msg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=arm.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BhmA6d55ZWU6+MX9xqMgvMugDWGHsjfN2s20ZF0sAA4=;
 b=Ac/IOhDoK4vLRL1o9UfuUSfOIFRqqGMqAAYXuSr6Po4Zc1ZAxD9YNWFAEZ2m2Hmp8BMdhc6Tj+syRZy6epNrwOUtyFSJ7WzTnrBugMuL96tvMExlY8LZICoUgn9Zodm4ekQGNPOLjHJpz/4jxTfUae1JJWRzDM0T1Pu6B94PqExIRLA8fQQB+hohhQQ1WHXD1CdR7WbA1nHOS7Ecw36EM/fq68dLZ3c5N25z1zdF8h2//MAZoIrKadgFjcV0No7ZdDdPmLJjpQXRbj2ncl5MnDg9LLF0DBJdooydlFy8MRg1bFPws90szkq5fcC78gDLY8dFPYQuVqUvVWoKk0G5Yg==
Received: from SJ0PR03CA0283.namprd03.prod.outlook.com (2603:10b6:a03:39e::18)
 by SN7PR12MB7451.namprd12.prod.outlook.com (2603:10b6:806:29b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.16; Wed, 28 Jan
 2026 12:35:50 +0000
Received: from SJ5PEPF000001E9.namprd05.prod.outlook.com
 (2603:10b6:a03:39e:cafe::b8) by SJ0PR03CA0283.outlook.office365.com
 (2603:10b6:a03:39e::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.7 via Frontend Transport; Wed,
 28 Jan 2026 12:35:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SJ5PEPF000001E9.mail.protection.outlook.com (10.167.242.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Wed, 28 Jan 2026 12:35:49 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 28 Jan
 2026 04:35:30 -0800
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 28 Jan
 2026 04:35:30 -0800
Received: from inno-thin-client (10.127.8.11) by mail.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Wed, 28 Jan 2026 04:35:24 -0800
Date: Wed, 28 Jan 2026 14:35:22 +0200
From: Zhi Wang <zhiw@nvidia.com>
To: Alexandre Courbot <acourbot@nvidia.com>
CC: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
	Daniel Almeida <daniel.almeida@collabora.com>, Miguel Ojeda
	<ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo
	<gary@garyguo.net>, =?UTF-8?B?QmrDtnJu?= Roy Baron
	<bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, "Yury
 Norov" <yury.norov@gmail.com>, John Hubbard <jhubbard@nvidia.com>, "Alistair
 Popple" <apopple@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>, "Timur
 Tabi" <ttabi@nvidia.com>, Edwin Peer <epeer@nvidia.com>, Eliot Courtney
	<ecourtney@nvidia.com>, Dirk Behme <dirk.behme@de.bosch.com>, Steven Price
	<steven.price@arm.com>, <rust-for-linux@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 6/7] sample: rust: pci: use `register!` macro
Message-ID: <20260128143522.434f75f6.zhiw@nvidia.com>
In-Reply-To: <20260128-register-v4-6-aee3a33d9649@nvidia.com>
References: <20260128-register-v4-0-aee3a33d9649@nvidia.com>
	<20260128-register-v4-6-aee3a33d9649@nvidia.com>
Organization: NVIDIA
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001E9:EE_|SN7PR12MB7451:EE_
X-MS-Office365-Filtering-Correlation-Id: 0187a4b4-e3ac-4261-e47a-08de5e69c4b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?wl/QTzBtRg9N3qmZ+23HIMihaZ77YSsauyzqDAsDcFVpTVEfNbnI9rK7EDpO?=
 =?us-ascii?Q?24ncfX/56pgNpwRetQQf2+0rZDMCfWr6JR8833t2DBu/tPrLs6NaDtcEb8XM?=
 =?us-ascii?Q?jYBp3WtqTf572mNI9S9seyKiSA3B6J2wVAts2VTtIEvt4Obh8+CWdeWGoIav?=
 =?us-ascii?Q?3dIAcjhxXqpgyK475100ckkVqx4Yrl6q896Xw7wLKqUP+w8I+8RyylTXti5B?=
 =?us-ascii?Q?t2QbzV6n76pykIgk5ueIqcI4K2EvwSFX1GfuZFwEOzZ/k8oeuVH/RY7gES87?=
 =?us-ascii?Q?4NS3XwCqGyuC5WK6FnMH/vd5sAl+yWjfDCOUrmGKXXc7fXF+fnZOl8wKBiVr?=
 =?us-ascii?Q?3ea0FeKZIC9L16wTieNOKVEfciBNbRrB9LLN9qXDr3YjwNcETsvAtWF6d3PD?=
 =?us-ascii?Q?fCTM0K0YlXtqarrHW/PUdOJogQ3uHcgq5Gn2xmpM4w7wsecLG7oAjFLk7vTy?=
 =?us-ascii?Q?0ti+XieGjRF46IK5vwyGMZCehl9GlByqci+4JR1nZDHIfSwqDlnI4kSqzXnD?=
 =?us-ascii?Q?Z9UdM7qKiryQLjGqIHOK2W84TF3h2bzZWe8q94908R7tSJAywcXRwj8tqVZh?=
 =?us-ascii?Q?VrrPLKbm559atNxf3RJipv2jLcIoGCgI17AstTG6sSoQc+aOB19XXf2xELil?=
 =?us-ascii?Q?hu3RIT4fsYOdkyKjHG7mHzERgTQ3/SJifKVOOeznq7qi9KJ0hHhyXMAmQOYm?=
 =?us-ascii?Q?Ok8haLwMj6y+pmdPYhQ9igrfCwcQyYL035ZPaG/fg704jt6GODcSZaRxQSpn?=
 =?us-ascii?Q?pC57vB08KFtS/0STTjjxN12O2uk1i2+uo7ZtlqJqXu8PjOywCxvKkNWgh9vB?=
 =?us-ascii?Q?nm7aPzMiDJ87ZQRkQLO1wmNvHbcr7s1QZSrMkESL673Su9nvzxuBC0JM7iA3?=
 =?us-ascii?Q?EHsNsJ8E5EybRLEDzHFMGnk5kWcRl2C7igk1slDxjIW+uDIqICWEnYA7cjnq?=
 =?us-ascii?Q?MTSYu37mvW/CiLz/bFp63RR3gaho24dDM139X6aJnuVtb4E4xSG/ITwwlaLF?=
 =?us-ascii?Q?te1iTppTzn+z/pEvXoMGIZ0gZtsJRRH7olDEPX/vZx82kJ5gAsTctqd42OxV?=
 =?us-ascii?Q?BwhGuu87Sc2Xoe/gZTfdKFGGqDvS4F+ja7ip9OjWOA5yjCu8LJaOUui7fHkc?=
 =?us-ascii?Q?V+Z1iqw0xWDUmPkZWOhsCkQ4w0FmE3rqVoWcBtP7CYjgwhtyWDK8LbqYDL0E?=
 =?us-ascii?Q?6W2QfbJKufb8hNLFFtiLkXcx/9T4tNhz2tXg95gnna0/ujVFVY63fLe+azy/?=
 =?us-ascii?Q?zTsd6Yp4mpniFLmYZ9SdjnE2sGmLBkxcsjKoWY7ARgreARW8BI67OHbfivKI?=
 =?us-ascii?Q?oMwwz6VjBtFWLQBAHXhU9V1FZZFf0dWZu2Ohx4I11Msh1Aq6EbgN4enP5W2c?=
 =?us-ascii?Q?LWXQJmLYC8qUlLfd579MAgcZvYCPdNaO9BmzuqcV4+NIEN2fmqWNkUDXKA71?=
 =?us-ascii?Q?r+1PXUeI02ZGrDlDk4eio1i5AcQdSW6qvCevvpt6qHaNhyQeO4ieT6rr4cuk?=
 =?us-ascii?Q?4sA0KeJEE16B9TSEgwUqVJPx5dunCkIxE4wj6lZ4nabdFMm3ssJ2YcW33iQy?=
 =?us-ascii?Q?mzYUWiwORZdpnmseLPU/76sw3ZNuxb68CBFLYrvfthXy2rqGNGtqK3y4W9xo?=
 =?us-ascii?Q?IPFR5+GyTgMQhAANxrwsRGVWYtodzVpEQ1jbDsXqAUCLxVsd2gMBo5jE5p0r?=
 =?us-ascii?Q?xvT+gw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(7416014)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 12:35:49.6670
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0187a4b4-e3ac-4261-e47a-08de5e69c4b4
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001E9.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7451

On Wed, 28 Jan 2026 11:37:32 +0900
Alexandre Courbot <acourbot@nvidia.com> wrote:

> Convert the direct IO accesses to properly defined registers.
> 

Tested-by: Zhi Wang <zhiw@nvidia.com>

I can see the correct value of the registers read by the sample driver
from the demesg. 

Additionally, Clippy was complaining about unnecssary unsafe blocks and
can be fixed by: (I haven't fully gone through the code, just applied this
for getting rid of the warnnings.)

diff --git a/rust/kernel/num/bounded.rs b/rust/kernel/num/bounded.rs
index 850827033f67..efabdd31ec37 100644
--- a/rust/kernel/num/bounded.rs
+++ b/rust/kernel/num/bounded.rs
@@ -503,9 +503,7 @@ pub fn cast<U>(self) -> Bounded<U, N>
     pub fn shr<const SHIFT: u32, const RES: u32>(self) -> Bounded<T, RES>
{ const { assert!(RES >= N - SHIFT) }

-        // SAFETY: We shift the value right by `SHIFT`, reducing the
  number of bits needed to
-        // represent the shifted value by as much, and just asserted that
  `RES == N - SHIFT`.
-        unsafe { Bounded::__new(self.0 >> SHIFT) }
+        Bounded::__new(self.0 >> SHIFT)
     }

     /// Left-shifts `self` by `SHIFT` and returns the result as a
     `Bounded<_, RES>`, where `RES >= @@ -524,9 +522,7 @@ pub fn shr<const
     SHIFT: u32, const RES: u32>(self) -> Bounded<T, RES> { pub fn
     shl<const SHIFT: u32, const RES: u32>(self) -> Bounded<T, RES> {
     const { assert!(RES >= N + SHIFT) }

-        // SAFETY: We shift the value left by `SHIFT`, augmenting the
  number of bits needed to
-        // represent the shifted value by as much, and just asserted that
  `RES == N + SHIFT`.
-        unsafe { Bounded::__new(self.0 << SHIFT) }
+        Bounded::__new(self.0 << SHIFT)
     }
 }

Z.

> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---
>  samples/rust/rust_driver_pci.rs | 23 ++++++++++++++++++-----
>  1 file changed, 18 insertions(+), 5 deletions(-)
> 
> diff --git a/samples/rust/rust_driver_pci.rs
> b/samples/rust/rust_driver_pci.rs index 4dfb8a6a4707..df2232d6b71f 100644
> --- a/samples/rust/rust_driver_pci.rs
> +++ b/samples/rust/rust_driver_pci.rs
> @@ -70,24 +70,37 @@ fn testdev(index: &TestIndex, bar: &Bar0) ->
> Result<u32> { fn config_space(pdev: &pci::Device<Bound>) {
>          let config = pdev.config_space();
>  
> -        // TODO: use the register!() macro for defining PCI
> configuration space registers once it
> -        // has been move out of nova-core.
> +        // Some PCI configuration space registers.
> +        ::kernel::register! {
> +            VENDOR_ID(u16) @ 0x0 {
> +                15:0 vendor_id;
> +            }
> +
> +            REVISION_ID(u8) @ 0x8 {
> +                7:0 revision_id;
> +            }
> +
> +            BAR(u32)[6] @ 0x10 {
> +                31:0 value;
> +            }
> +        }
> +
>          dev_info!(
>              pdev.as_ref(),
>              "pci-testdev config space read8 rev ID: {:x}\n",
> -            config.read8(0x8)
> +            REVISION_ID::read(&&config).revision_id()
>          );
>  
>          dev_info!(
>              pdev.as_ref(),
>              "pci-testdev config space read16 vendor ID: {:x}\n",
> -            config.read16(0)
> +            VENDOR_ID::read(&&config).vendor_id()
>          );
>  
>          dev_info!(
>              pdev.as_ref(),
>              "pci-testdev config space read32 BAR 0: {:x}\n",
> -            config.read32(0x10)
> +            BAR::read(&&config, 0).value()
>          );
>      }
>  }
> 


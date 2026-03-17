Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011050.outbound.protection.outlook.com [40.107.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8972D3FA5F7;
	Tue, 17 Mar 2026 22:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773788071; cv=fail; b=a8KMMy4w6ieyS4oRFNA/AaOFZQzbIuV5z8K1mrO1FwbrOOXDQUr8Sg7209n73DrG8qcPkEA2ZeBkMMtsqFf0iSOXOrxU+aN7uxn1ULdLI/C7ut+zeGlPjydhPVvbVS99aQzSaFEiDLDjtGOd+dNdsbh2PV23iM4a3bzs6Lz2Z9k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773788071; c=relaxed/simple;
	bh=UT+l2O4Q5nskWQRnfadZNUIf8Fqy48VF+XSZOk43zuc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JYFLSgGBK+bVYXJSvOxq4lg6gZVt5uOqBtPAtjISyL9e+e615KASkSDFhjaCw03ZMlAR1hOqxOXbcZfmPCS66YZ8wt1zp8Jdzh93CVTEosf/Dk0bc4FC+aE3+FighdyV0ahmUTekVriyHVaBXvEl3iyZSeeKXqOrDajaf+6yWdw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=NAu5wiZe; arc=fail smtp.client-ip=40.107.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="NAu5wiZe"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j//fvtOsJZ4weD9xYNQI1poUAHYB1JxiqnPSD7zTOXy99Us299pEgFu6pnjj1HAY+DvTWf54ePEu4ZwHzvYYAEm7C4rvxMsycY9Lz5dt6JkzH6eQld0DUvP8qJVg29FjWS6CmO81Ux9SA7TNaboP2FFr0NES7URxFLTwD40HbQSHsRaIn1aY0gR/r5fMZCvF4Rt+M6zgZ8rm/0uV8SAxLxFXkMpDNlVabxnn/WNXEcII21z5mYO8b/EXClyUYmvO0rRZtLaFGJnXwUpAAiMd5jQA5Nj3g7QOkCiNeXMkulxq4eR+TlZg5Kxo4T+Hw9I31G4N+HJrJgrj1WMTxBSh4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5rcbpF2FxePTPZU5vap7/SdGKdnppb+lRZq7qpbG6WA=;
 b=DHwp5tCmUOBUddtIDr+JuTDdDqy0G1yLNJBfQb9qnc3+W9OEcV7C9F7/egwleEnq6Agb4y1Q2KF853x5GzVA+7HwyUoTm327clPxJxgdZ2lqDrtm3MPvJRU6xOskq4CdtYYRhSidvi9nq83uMVLkmL70g7RdgzPTGgBIGVaZpk4H67lu+hrPMAMI3fIbYtHm3AUh/UY2tWFI9yazV5bP3kEvJ3VWRsjQgZF5RP7zcvOhnE/Yflw/2iky5lM3C9XQBRjsqnQ8cCIGAXusrnxPZiFV/Ei9iJqqqkmHrJoHCe+huLFgDx/K+BGcK/mnEDR1I8uSaLh0NYICgc+yT131hA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5rcbpF2FxePTPZU5vap7/SdGKdnppb+lRZq7qpbG6WA=;
 b=NAu5wiZewf2umVr4doirW59alsjdNKjyBwlW8Rra6ahmipe4DwaPdzTTG3zN2MK/Fq7os9cZYdm8bp2AjfOXVbwsyfx/V8FyvyHtfO+OBpRN9kyyrw9w+p0v29nQpG6YmMQruCxCXw1sW3EsrX7DmS0cePoz7juCVWGWp4aJTqRD/ibdN3dsWDTmqB7L1q6Krk/jovPadlNNsVJ6pr/88eFgYBq2IgKrUYlK+8vV4dUMoggy18IxRw5no8FbWbStXcURjIClx9HyuhMhz9H9yJnCte0XtPXKJkZBRhWlASamVZAJmAb6Z6fV8jOFTWxPCJdve6hApnpbYdOJQguung==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 PH7PR12MB6489.namprd12.prod.outlook.com (2603:10b6:510:1f7::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.16; Tue, 17 Mar
 2026 22:54:20 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9723.018; Tue, 17 Mar 2026
 22:54:20 +0000
From: John Hubbard <jhubbard@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>
Cc: Joel Fernandes <joelagnelf@nvidia.com>,
	Timur Tabi <ttabi@nvidia.com>,
	Alistair Popple <apopple@nvidia.com>,
	Eliot Courtney <ecourtney@nvidia.com>,
	Shashank Sharma <shashanks@nvidia.com>,
	Zhi Wang <zhiw@nvidia.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	rust-for-linux@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>,
	John Hubbard <jhubbard@nvidia.com>
Subject: [PATCH v7 16/31] rust: ptr: add const_align_up()
Date: Tue, 17 Mar 2026 15:53:40 -0700
Message-ID: <20260317225355.549853-17-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260317225355.549853-1-jhubbard@nvidia.com>
References: <20260317225355.549853-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0278.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::13) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|PH7PR12MB6489:EE_
X-MS-Office365-Filtering-Correlation-Id: caa1e073-2273-4849-9d59-08de84781f74
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|7416014|366016|18002099003|22082099003|7053199007|56012099003;
X-Microsoft-Antispam-Message-Info:
	+COORZy+f3fgsYDrQCs3zxLcC1T5MvdS8sQVfKFDjNtgBWslP518cLaYnqwZOfANWHByNOV+HNkpZYKwhTpsTFLANIlx0nMAeBvn92yhGw/dyZHjtHv22XGrJhgCccKW1hQAEXN6nbSf3pfjA0CmcEAuIVOHmMAfK1g21+zFqgJVKqkk6AiwLaWyCq9YB0BhZI+QuhpbuKypbjwNw7DxhPixqCRqPtgFSl3LSPO+m4iuuMYAbNoRJgKJYcZZXM8Op4bAo15drzswVS0eQVU0n44jvhC/RrVB2c4jKnxYWBcfyxQmjHunOyybhQ7cTAXuht4VclxvGCLeVYrmbhEksv7Zox/u3CmWKjcvwPI3n8Zo0Iw39DbjVkxo8OTaoTvEHV8cWlsRIniq1XM1GIdtKSKnN9a5SVPeN9im8hKTug8Hi+7koYfDQcqBrDIOVsGHrSUMUvRAxop9UqrTjOT/bySDRHVxEmrsxtXPz/BWOjjGwIKBbIv3TQAWB9jgvus+bszjfE3fuRxmIxGKHCI8yqKTAgbQdirmPOUPp9p/hx6x0hVyPj8aYx7vQnJ1Frgof3p24HojtuaZ6WULpwZq72VL4CvjZEKxvmY8eflOKCif3kUfmTfx+MTTpQ7huLVpKfKlGoAHPAk3B84Y8d8uhbBR5fzNgF5qesyuZfk5Vu9hzOIYyn8RfMnviyKbqe9Q09s66xKpX/iFpqCHV6URcJLrwKmDjdaMF1A6LzmWlz4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016)(18002099003)(22082099003)(7053199007)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7AKqI3jYGHPsnOOgkIJCblslWYwpCS1ygYa/LO+biKJNtFvp48LjYD8MYcNy?=
 =?us-ascii?Q?QrKtdHAaRNYJ3ItbvjOIHIABnrWRWtXuJsH+Zl31zygmnuG9JQThFD0ISP1y?=
 =?us-ascii?Q?uqCbBWoMaoJ8BGO8/7rzVo39WnfYaaMQbN7bTuwXGBl4RfniHVPc+RZ/3PK4?=
 =?us-ascii?Q?O0KlvJ2x4hrQ7wmpF9oGoRIvMBduo/RP//0eNIrBLXgd4BwtCpKM1Z3V4kJ7?=
 =?us-ascii?Q?Md6Ly2OoXmifgmoR7/GYgZqF5fNPrtQg7u4v+cpkwGKZrr4PIvADgv6Mk0Gy?=
 =?us-ascii?Q?OLycw8cTBwutYtTDAo14uxSUfVPumxEX9KxWyV2/9t7RuDA3r/GGMjjC4YhO?=
 =?us-ascii?Q?WGHM9q2lR9ID1hRa/W1VLKk3nJBspL4LI/oSyQcjahlL+qBhG2Rb2aocH+bZ?=
 =?us-ascii?Q?jgj0pmm0IT16lS/FxEoXphV7tdxAn+msY5ThSM2HfqDIKGZdOLJWoAi9l3bI?=
 =?us-ascii?Q?mWlcaT5fPEbH01UwBZAzi+c2sVyRQYjXQKtHwHxvorfqeOu+uo1XQ1X3ijBy?=
 =?us-ascii?Q?ROk5ztwktItyRSjAB0/V5m6xyoTvAsojSZ039V9YqX1wBt8+gPfOSrvFGP2q?=
 =?us-ascii?Q?cftG8YM4VOaCNzEN3uVMlXohZ18u2kEsdeG21WNBTAm77TyI9PMAuVObrZ5R?=
 =?us-ascii?Q?TIv1A0IgcEMf7qaFAuXwSaTx/wa5REczWCxra2VwyDKFxRubE4YKRzHZdIc4?=
 =?us-ascii?Q?VkXaf418nnJeAz72+xgQnaVZIUyl/8IBjtK2yl8AZQi2hYzuxd2aeT3drBbu?=
 =?us-ascii?Q?GTiAsZfydiFWJBhOyPiXrnXfTBLKKaItQ4EfRFDWpBT1ThfiMT8cOnLi2bHQ?=
 =?us-ascii?Q?8+U4bh2FH+4dYawCQvvvhR8RBVnF9LeqvX1PssWozzcrPdGflzONGuy2XQh8?=
 =?us-ascii?Q?5mCI8xKBt/cAXno3n1eRfFSDELlHFlSLkPi85OlWKhXbOpeiHiqlbkTGl9SY?=
 =?us-ascii?Q?+3esyYwOmxbvt0ZJf9MUX9puZLcLhXS3xNIYI3v4wX8qdbqy7f2egggw4LTS?=
 =?us-ascii?Q?Xt6NMuNjCunLLmCM9CdxBgxd1SKm6YWen/jF6TsdieLvMYxqg4uxJZKA2XGe?=
 =?us-ascii?Q?GoeCcNif7P9O7grnzxY4nJsf1iKBtzqpKnvoGWwCt5o7oRWKLLBIBJSSSGQA?=
 =?us-ascii?Q?UIGpgYKh51f5UtsqYq6BO3E3H4gRi8BC6sl2HeNf5aqsTD7EA4CaghhfKHtb?=
 =?us-ascii?Q?kSF6zItDMrz96OCt9HAV8yZ8uX0NbU1N0YzR08wdpA60aQA1ASIkNbRHHxBO?=
 =?us-ascii?Q?fdoHktv3XibAlvjMPY3QZUtEtjiuwekxeYA/tMnk7C12Hp5oVkWNVzYNG2+i?=
 =?us-ascii?Q?kGaK9U9a8wlQlZLP/gXry7iNDl//qI9LV6il3KbuKwOhKMBCqrAYY34LFmf/?=
 =?us-ascii?Q?uNMqc989JTCcKIV01uF0Ev1OwIz+qbzQCdEiQGFkiC2DlTonswdLwkpk5iGD?=
 =?us-ascii?Q?4rbVVsL5dJ4LSctw5GVnPZnxsQdNJA7d4hcmOCw2rtLFhcmUh/KQDdEX93tm?=
 =?us-ascii?Q?elfswQgg+0UB5CC62tZens5f27nybfo1dcw1iVs2eNGNhchb4LwDCl+8FV9D?=
 =?us-ascii?Q?pGeEtz2+6/1jXOeRUs3mKpD72pO484sFmSJCHstvrKXm4DMCPPWqvR9UEhtD?=
 =?us-ascii?Q?Jp1mtuP2W+xifDTWdgzETANGpXakGWumaDW/D0gp1kM7PUWwT8oavLI+FeTZ?=
 =?us-ascii?Q?37A+4gG0rPa7dvL8yxiJurIOk2kdcUDdYUKdoFlmMudXp6Ew7J8OSYt+HZgL?=
 =?us-ascii?Q?X5kYKoMFVw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: caa1e073-2273-4849-9d59-08de84781f74
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 22:54:19.4424
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3mdgZNYoDr5sVsTEaa6y25z3g88MzQa2AJO0O3sf8KTP4SBlHIlL8XaFih0XhyFSZQfSU95JVaNeUj67rNG57w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6489

Add const_align_up() to kernel::ptr as the const-compatible equivalent
of Alignable::align_up().

Suggested-by: Danilo Krummrich <dakr@kernel.org>
Suggested-by: Gary Guo <gary@garyguo.net>
Suggested-by: Miguel Ojeda <ojeda@kernel.org>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 rust/kernel/ptr.rs | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/rust/kernel/ptr.rs b/rust/kernel/ptr.rs
index bdc2d79ff669..7e99f129543b 100644
--- a/rust/kernel/ptr.rs
+++ b/rust/kernel/ptr.rs
@@ -253,3 +253,27 @@ fn size(p: *const Self) -> usize {
         p.len() * size_of::<T>()
     }
 }
+
+/// Aligns `value` up to `align`.
+///
+/// This is the const-compatible equivalent of [`Alignable::align_up`].
+///
+/// Returns [`None`] on overflow.
+///
+/// # Examples
+///
+/// ```
+/// use kernel::ptr::{const_align_up, Alignment};
+/// use kernel::sizes::SZ_4K;
+///
+/// assert_eq!(const_align_up(0x4f, Alignment::new::<16>()), Some(0x50));
+/// assert_eq!(const_align_up(0x40, Alignment::new::<16>()), Some(0x40));
+/// assert_eq!(const_align_up(1, Alignment::new::<SZ_4K>()), Some(SZ_4K));
+/// ```
+#[inline(always)]
+pub const fn const_align_up(value: usize, align: Alignment) -> Option<usize> {
+    match value.checked_add(align.as_usize() - 1) {
+        Some(v) => Some(v & align.mask()),
+        None => None,
+    }
+}
-- 
2.53.0


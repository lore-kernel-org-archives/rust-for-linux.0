Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013016.outbound.protection.outlook.com [40.93.201.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E060327C12;
	Sat, 21 Feb 2026 02:11:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771639866; cv=fail; b=a4I5onrbvJNEM5cz0oaL5Mnf3zyZ9BifSTh5muajWJgFCOFgAbpGeJZDH8cFz2E7VRqeBnR1ce6QbkjPSAH0fK8bxRqqeSQUWUm+BmgQYpamhy0YHZdKeCtw7Qx3eqlQCAZ+uIRqr/R3rIxJgjQ/eQSOdLnad25BY5BYXqaWcE4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771639866; c=relaxed/simple;
	bh=yJEah6tS25njXSVSRCfgjlcd8d2e7xAtmsKnUdZ20rk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=g/LpsTjLtzwmrp1D3X0+PGTdqU7fFx9XkO/PbM+NeNc9rObTofQLCkWqypLqpU63nLuYsrJBwoaUeuBt66MDEdbx5UdC02py7YoFMQYCKczv3ssjNMml1Jopsgvugsd/ZcYm4wgHMmMzYoy35LOixWvMTQA2teeKPK2bQYlzAgA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=t1MYepVN; arc=fail smtp.client-ip=40.93.201.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="t1MYepVN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VTaPY0Y+837qWo7gvrP5BO6c+g6ReixuhfoIT7ji09iOCtHu9mVKuDqKeQHQzHZc/wd0tQel0e+RszkBw6lhSqz4w122Mnwxqt5IaitHCkc/N8q98QE6fvlFJb7lj7zBY9ZDQKV2WV3l2NdYVHLb3ZreGB258iL1A4/ux19V5Y0mQL2rN4hpn3tSULlOsRBj7A8EsNZfYWF7HCx8Kna6e8eJ7ZRq4cax7YcjjvCYqCyGfrM8S04cn23nQLQ7npLgHO++R7bd77d32gWPyPfVyFo6HyC9xtjGJODMpVSrFDw/PBnssFHwp6CMYe/fEuwYkUFZOn8FGSiU/8rV1Qt7IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jyhYfjNABYx4SIxjWxr2ScbGy0P7FnISSHhvCU6HkP8=;
 b=uGCHYKRkMZO0bhWV0YeliZEaljeiaEuZxXe1lCEfypQq2IRywjG02K+kAIWSkl9h4/C6YdNmWeS2e7ee09O5ceCrbgDTktonEnrNs9pWy67xXRYBtRYjUZ4G74ojdJxnXvhx94wAVmB4a2ST+5VptT8KJWqeFqU1zXWhQjUMmeVF2QqzxnITT7Mwx0A32yOY9ndMfrMQKhzge/14UB/nASHWW7sM61uxWm3L3SEgzHFPmPgTr7fzoBzGO2OnHqOyzRkfO31GQ7jLbzs396vcWJXV3isNQZ17XUm6LQZh1lbX41CwgIHe80zddjV1GWCL0QsFLNPGYU61h3bPk1J+eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jyhYfjNABYx4SIxjWxr2ScbGy0P7FnISSHhvCU6HkP8=;
 b=t1MYepVNTAgarZzy+rAuEt24RV7bm+WI+uO3C9zytC5bhAvsWZW+ubus1nDxjjc3B2LCvjXrahetWOxOvglaE37A6Cpcxl3z00Ccw/s0OPXN1lTDPiZ5EMYnULm13sdfIVUGDUNcPT4KuqlbrhRzi0Ublc0gzTOF48NAzvQHKDCAUDCe7PeX/DdgPrTuccO0gUbY7z9pSSwPPKuRDaBDQZpK49GHgLFl0qcczsTyceEs6JP8Z9k++U579bJTAwKImowLQlB2OBWE3ENglse4NoR75kbTih0fTq0WmHKeHUVAU2ZcuIAMIs6dkNUcimg73rcrBA5fJ/bRdPy2O0sZPg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 SA1PR12MB6996.namprd12.prod.outlook.com (2603:10b6:806:24f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.14; Sat, 21 Feb
 2026 02:10:20 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9632.017; Sat, 21 Feb 2026
 02:10:20 +0000
From: John Hubbard <jhubbard@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>
Cc: Joel Fernandes <joelagnelf@nvidia.com>,
	Timur Tabi <ttabi@nvidia.com>,
	Alistair Popple <apopple@nvidia.com>,
	Eliot Courtney <ecourtney@nvidia.com>,
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
	nouveau@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>,
	John Hubbard <jhubbard@nvidia.com>
Subject: [PATCH v5 21/38] rust: ptr: add const_align_up() and enable inline_const feature
Date: Fri, 20 Feb 2026 18:09:35 -0800
Message-ID: <20260221020952.412352-22-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260221020952.412352-1-jhubbard@nvidia.com>
References: <20260221020952.412352-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR04CA0005.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::15) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|SA1PR12MB6996:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ffda54c-a331-48f1-05fb-08de70ee5d15
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?2de8dHZVdq7I0X+aVPfVAmf4YFS2svuYvgBGbgpHBUkvEhbkOoP5Ei8rNVJ8?=
 =?us-ascii?Q?hIH9p5GU5VKM78IkgKqYW7cFITEpSxDrvikvKVYWCyEcR69Rwf2h8ulHHmxd?=
 =?us-ascii?Q?3104XVDTs+/f/QisJlhdkvxDJ402QK9as6EGYK7YEno0R9mK8lQesEITZ8f5?=
 =?us-ascii?Q?QJ+Tpqf94yIIHpRR8pP2CVVUZ+raxy8CW9FSNF5dx7pbttD6LUnU02o/+YWy?=
 =?us-ascii?Q?9j0rOjJd/4VKTge/Hm4Pk8godsxEc5DCXyxx4LfdOgCjYRKBC3GTxc8mP84v?=
 =?us-ascii?Q?xafAgi67r6dznI4hF0DDuGbL6xdABYYEnEDsWeY4fdV27tDDUBMsVGW/fwpK?=
 =?us-ascii?Q?c+sm1JfHb4IG742heQqOLhlXZNaGFsgj4v50TfXpBjfAGiiSn+rv4QnDaZDx?=
 =?us-ascii?Q?w8ao1YVty9sVxNn1LKddbccjLdfAny6BgX9YCihhkGz2xdHy5SztWz2Nc3Bq?=
 =?us-ascii?Q?LpLH0hf/DXTjHBZPo13F9iUJFsyuUaNTLHfg9UBSNsPrjOUT9sgRWDtq7/Nm?=
 =?us-ascii?Q?+y3fjJOSIGp8zKhbR4EshfJjFLwyxfm9ZNG50+Sk3ZwQls+sROqSnt0aPk0+?=
 =?us-ascii?Q?a8GoIlavQLdbPwAorJfL3JwtKqbY1ZeRrM/P3eVwgRI0uxQmrvPzd7cjubOM?=
 =?us-ascii?Q?ebBPIEOWCyClX0ZoP8UkGDqa29lwMh2rMT76TMX+GCGnOHwiX3ErtwH7UF5Y?=
 =?us-ascii?Q?tu/IUJNW0X76kgK8ma65j8vmgVoP97JRHsxL0LSx6n8n51tYe0GwCWdsWQJc?=
 =?us-ascii?Q?KDZtSJfWtg4ZSDjw1Ve7ymhr9f1FRcOrCnawpvhHJQiKBjYEBfc3+KhI5J9d?=
 =?us-ascii?Q?0l2oPK8vMcH0Bpxn3RoGWQ5dZ4HMosbTklmAFVxTOgOE1xo9XmLiU9yEC4Dy?=
 =?us-ascii?Q?q2axoQnTFC4fnhiWnuF3blQ1DPejT7Jh3djK+lGY46X+7sqHhecTZ4SdG+IN?=
 =?us-ascii?Q?6kD0YziWFaINlAzXzFdMFdwL0rDyO8t3CcgLr8PUYGtl4EHQVfU/84IpaNNZ?=
 =?us-ascii?Q?25yCXdmNL8qPr6y5FU0bJ0LHKSUukn83pddZbyNsQx/gA1j4TVwrv/Os97jO?=
 =?us-ascii?Q?bZ942gL0VFTwdXYMnCe96cwUrdezPVdESTlRYpXCFCzWq31LTowqPeOs9k+2?=
 =?us-ascii?Q?K58l6Z3xcypIu+k/hsBVSxZSKp9UuEXABMvPRn5/abHL7XIl7q/OAnbE2o77?=
 =?us-ascii?Q?W6/Eyy2SX7x3b8UVLg2SAZpJ1vTz+ld5DD2MHr6cX/IXtRdphKdf3wzB4Rst?=
 =?us-ascii?Q?2bs6DNS/aondKxs6QnBu+LEqjg0kF0EpqyBF3QUWfm7SncF4RI0d8Szv7Ele?=
 =?us-ascii?Q?RAlV6c7Ajdqs/xSxgBRb1SIBN/FkkIyLZb/XMPZF0NH8QymmWVRHtq0merAE?=
 =?us-ascii?Q?8pmp996YIUqahKuVO9vghBN2O+rA/QXipeyfmyWqI6sIm7rBZ+kT14RBnHIF?=
 =?us-ascii?Q?7JRYJ8PoC+zzPnSwe5pBRihz5A3yPCzwLuiTROjM5o+J/pOCzhIYsHrq3teD?=
 =?us-ascii?Q?g/Ziv6qd46ceBMsHqIzcpOJIBLMqlpw84d9JphGsGzoGnHmpo5YT3AnDonBG?=
 =?us-ascii?Q?q+BadX4MSs7GhJv6mbs=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3rP08T/r4OE+t3RmFbBPNx/UnjGZ/GGam6OtXam/mGx5V5yGCM33P34vw1QS?=
 =?us-ascii?Q?T7iOFMT/YGtJ1AUPDIwxQ0BM4TTuxN59LOZmX8GNhcF0D5Evv8dFcI8k4GFO?=
 =?us-ascii?Q?iC1xBqBcCg5FF34I7jwjj6MerwmesQCIlmzn+bLFbTeYJujlKHP3vxAbAxJb?=
 =?us-ascii?Q?WcC+AQiTfWrRKYnTABD41No3zajGcDjhRVA6pWhpMZ3tCEGTBX1Ktat9Xhpg?=
 =?us-ascii?Q?8wW4Y+X/Kqem45rsOrC2LqtBizsOMgnqtA4lTLzIU0+zNgcYvHsO433TFqWI?=
 =?us-ascii?Q?K4g4poQRiJYNwGah19jyHpwiUA71Tltdnez9YI7JMZQtGzYRDg55sVe0F25o?=
 =?us-ascii?Q?kKe1k2yXBV8Vz7jFte3EurQ3koseN6+/l5vWbwdAZ8l50oUazQIK+vQyvQqz?=
 =?us-ascii?Q?kYHVaM3pkLayVViV72vNLzviqBXP5rCxZTVfQ3MYoVPQZ+phXGKDv6R1KNrg?=
 =?us-ascii?Q?YfuT188JVaLgx4ngJ6J4bSXXz3thN7+CryW2oEHSiwyY7Mr+tGOYwVNi13Vw?=
 =?us-ascii?Q?zO3jBftS7ihKqiKVC2uNgYmjll06bDIDEIlJxBi7GlT8qiTYDMZhPOPJk3Ox?=
 =?us-ascii?Q?USPCgP66/6j5z1QZBuqaE2J5zCK3fyezsRMVcOoJn8063W87eTg8YrTwCqPY?=
 =?us-ascii?Q?bqdUDlLKwaL+uSxpOeWDG+YtcAdz2sDLKjA9N0lQ11Hw+06zg88EI6zJL3qK?=
 =?us-ascii?Q?dhj07Ckh973RAyvICGlR+uj7LfbfwRf/vD20dS9xYrIArWW5udehhNY87cmt?=
 =?us-ascii?Q?u1hL7fckxfOzZ9KGbGYflUApctxqIMiQHJ3qLxSv9gAxWFBeucQ3GNMLu0e0?=
 =?us-ascii?Q?2Wpn47q8jBNPqWNyxjmA9yfhMTk+Tegh0WHLibvq4kgjEBP2JXD3fKOiyrkj?=
 =?us-ascii?Q?6IOo0h/fOXlGNI8wS0s43Wjnw6DadpFW4WR1Rb3na5aYqKdGA1wA+57lgvkw?=
 =?us-ascii?Q?6Nn3M6Aq9qqT0h5yzRYLzRa9CDDR71SCbFpdzPeWJBI0kg1xWK6tUQ8nlvEL?=
 =?us-ascii?Q?O2cEm03xYiz+be6+JoR/FQVNAnIn6B3O48cKNPHEHpHxNnBCWqrgqied+jfy?=
 =?us-ascii?Q?MmD8ruHmF4m9EoaT7fgyTSgxi1mqy4xk7IwqNXzrTSDEtf5h9Tr3/H8Yb7cE?=
 =?us-ascii?Q?xZU7tRsXy5G0v9z01A6K96SBZLsDghWcZrsLM7Vgn3xcD0EIU1iVg1a6PSoG?=
 =?us-ascii?Q?Iyl1vmFFjHqflFKU6cD+uUyThGWotq98k073IUAcYHLtpdBwKT950/8FEgsk?=
 =?us-ascii?Q?wfqkAwc57VJXftJL0VNt6XW7nkdB2tO1pMdRX62ywWDqYVQUTLy80xRLUFfW?=
 =?us-ascii?Q?Fl95VXjE33U163DfnrvbOAIWIBR4jw3U5N0WALi7c92fy7GgK8GGnGL3XXU6?=
 =?us-ascii?Q?/G4jLwB66tkYlUnXL8aeiCSJ/aaqljBU0yzvZI28QvQ4N2lNJ104crGTCPLH?=
 =?us-ascii?Q?6mFbRxT1B3cLmU+MPl3Y2MKlRF3uNLaaV+d5sLzTVGPfbJos52aHKxKeJNFw?=
 =?us-ascii?Q?iochToryA6PQMk3/7QsQnwZDuFVroIVFTn97slEg4jWKITH5Tdm+vFOvBf54?=
 =?us-ascii?Q?7wp0W8gqiquoef/E3YnPwA+5RUH8XiP0sZ5IH/cWiMWrPlM6JCce0tjorzRI?=
 =?us-ascii?Q?cY+heWMRLL8s+4M35V8Ea0ema2Bz/ApLOXBR4plq2yNhxmHnmY2nOOMG0JvE?=
 =?us-ascii?Q?RVCd7IMcCoam61QKPhgtzOcQw/JGgq5sFt5HNK3oE2RXitdtP5wqxQQcTpoa?=
 =?us-ascii?Q?AGynE2D4Ug=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ffda54c-a331-48f1-05fb-08de70ee5d15
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2026 02:10:20.1306
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I2HnqVYBszC1zHpJxv0lh1Z8XQ675WOAWMhtOhA8l4WyuiZ23UVXFaF8OsOANg/d0L9AjvHzO4fdMNsLA6Q08w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6996

Add const_align_up<ALIGN>() to kernel::ptr as the const-compatible
equivalent of Alignable::align_up(). This uses inline_const to validate
the alignment at compile time with a clear error message.

Add inline_const to rust_allowed_features in scripts/Makefile.build,
following the approach in [1].

[1] https://lore.kernel.org/rust-for-linux/20260206171253.2704684-2-gary@kernel.org/

Suggested-by: Danilo Krummrich <dakr@kernel.org>
Suggested-by: Miguel Ojeda <ojeda@kernel.org>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 rust/kernel/ptr.rs     | 27 +++++++++++++++++++++++++++
 scripts/Makefile.build |  2 +-
 2 files changed, 28 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/ptr.rs b/rust/kernel/ptr.rs
index 5b6a382637fe..b3509caa5ad7 100644
--- a/rust/kernel/ptr.rs
+++ b/rust/kernel/ptr.rs
@@ -225,3 +225,30 @@ fn align_up(self, alignment: Alignment) -> Option<Self> {
 }
 
 impl_alignable_uint!(u8, u16, u32, u64, usize);
+
+/// Aligns `value` up to `ALIGN` at compile time.
+///
+/// This is the const-compatible equivalent of [`Alignable::align_up`].
+/// `ALIGN` must be a power of two (enforced at compile time).
+///
+/// Panics on overflow, which becomes a compile-time error when called in a
+/// const context.
+///
+/// # Examples
+///
+/// ```
+/// use kernel::ptr::const_align_up;
+/// use kernel::sizes::SZ_4K;
+///
+/// assert_eq!(const_align_up::<16>(0x4f), 0x50);
+/// assert_eq!(const_align_up::<16>(0x40), 0x40);
+/// assert_eq!(const_align_up::<SZ_4K>(1), SZ_4K);
+/// ```
+#[inline(always)]
+pub const fn const_align_up<const ALIGN: usize>(value: usize) -> usize {
+    const { assert!(ALIGN.is_power_of_two(), "ALIGN must be a power of two") };
+    match value.checked_add(ALIGN - 1) {
+        Some(v) => v & !(ALIGN - 1),
+        None => panic!("const_align_up: overflow"),
+    }
+}
diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 32e209bc7985..a58a7d079710 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -319,7 +319,7 @@ $(obj)/%.lst: $(obj)/%.c FORCE
 #
 # Please see https://github.com/Rust-for-Linux/linux/issues/2 for details on
 # the unstable features in use.
-rust_allowed_features := asm_const,asm_goto,arbitrary_self_types,lint_reasons,offset_of_nested,raw_ref_op,used_with_arg
+rust_allowed_features := asm_const,asm_goto,arbitrary_self_types,inline_const,lint_reasons,offset_of_nested,raw_ref_op,used_with_arg
 
 # `--out-dir` is required to avoid temporaries being created by `rustc` in the
 # current working directory, which may be not accessible in the out-of-tree
-- 
2.53.0


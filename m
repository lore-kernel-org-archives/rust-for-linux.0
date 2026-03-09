Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010003.outbound.protection.outlook.com [52.101.61.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 628E63DA5BB;
	Mon,  9 Mar 2026 15:14:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773069278; cv=fail; b=e4m7vy+LO51Kh6Ji4RpFpfT3yqhMj6+KbyiJE4YunS/Scpc2Z3G1hJ9MCyx2XlAl5P5atEpxzezF388x/NZuoAGVr343rw+PsJmhcW4Mivvs3CS2FaDm/UD+Vb//WtynYxc0CGKOrqIACLbmDTROLvFMGzp7FIxb36BUIYxBEIw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773069278; c=relaxed/simple;
	bh=wUSIjD2YXoq+vf7Xi891tLazl7bTq6+pUjGSDbz+j34=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=bmQDKMIkU0Xuqu0/ttGCCWJZXuyvF3wom+sO+a6xO+x/SCNYPL2VOzP1bZnNVcbPUQkLib0RiJKsjQ+mLso/V9uckPxjYWEI8DBuN/RNmrj1l5C7ON0iIxVonwo2OuEEPggeDtNvsCdbQ8jARXYgheeh48FbiEpWSM2GqgC8LVU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=N0DOYlKL; arc=fail smtp.client-ip=52.101.61.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="N0DOYlKL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jfcCRKOU7ZTMmNkVXeMEZgn9D2opwXh7eS+VFNBBwIDkdhQHnUbRws6h9m2Ecoip8b/6UMA3HX89DDqNS93GU+wosyG976C2NYbRCc14TUb6Z/HMpm/UsnbsimI3GTpdf8M0zmT/pnsRcJOnh5yo19euAS5ZDTMtldvpBcMF5QgQJJoPZ8VV+CVjSaU7iScfBwxa+zvLJXv4JEsJ/8t46VWgM9R7xDmrhbXUURYSnK+o1R3FdhS1Rx/JOlfiztX5BCA3HKbj3Prpsx+iBNrSUhOA81IaT+nBX0CXtqQXgv+JKbL5WZRYBMgeeD6rCgpkJ/Y3om9x15isQSuCh+XtAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cbvmRtvWm1CcO9vTzzaaiMMG7wVAMWq+MUfU42tONIM=;
 b=KtTZnCQbMegk40u2VGm0IV9P2/1LtPVECtYDe6QTU2iZTmqrqOEiL8jhKs8hScULpoiLJYWhq0IHqyTJa3jMQyAtmjxI7WVzRket1D1OSrdJtUlyh3f+lH9cduPSFMTnwZD7nVTwC4b3xMw5a+8MrdAhrOXxWWUa9jxR+Q9a1McptxoyGL+BAn2NgoEgaGzrRXYZpOozTiSvFcFmhzPOf7gmkMWCEur0J/wDENyZv3AiCw4XhcVYId2qwWT/vuqhSn9CGekgm26RY1CsRHSUdKhgJNZertfQctJaq3h58bmripZNz5fLaHp1+5u6BZ5RTlCD0Li1HKcOrv+KyAhC7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cbvmRtvWm1CcO9vTzzaaiMMG7wVAMWq+MUfU42tONIM=;
 b=N0DOYlKLmiAUPxLFO2kxFMPuaISRS0jsrNyUQTEEnW/t00rrOmXSx63hIYda1OKF/i3mWuGkdgG8aSb8o94DQMSZaM6tkd9wXk+CmFCaPKnEnQQ+N94rYY/LWHEBRSRSQZbGap2u+MRaaLXVQSXsqwUnlJ7GDKnp42q6R+puG35AFBRXNgeLlN0sgUXNFPlYJNGb4x2v1jrY9nBZx5qC2mfPrXX0atFJZUFPpsvegr+3UQQiWtHsrV+t7VpOUdB3swm2eEbspRXbvDm/SeZRMicTwlN4ii4Uy8RmnJOItjeqUev//i9EDCiLwP9La0VqqvCRbu/LCilzNP2pJloqeg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CY5PR12MB6131.namprd12.prod.outlook.com (2603:10b6:930:25::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Mon, 9 Mar
 2026 15:14:33 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9700.009; Mon, 9 Mar 2026
 15:14:33 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Tue, 10 Mar 2026 00:14:02 +0900
Subject: [PATCH v8 05/10] rust: io: add IoLoc type and generic I/O
 accessors
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260310-register-v8-5-424f80dd43bc@nvidia.com>
References: <20260310-register-v8-0-424f80dd43bc@nvidia.com>
In-Reply-To: <20260310-register-v8-0-424f80dd43bc@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>, Boqun Feng <boqun@kernel.org>
Cc: Yury Norov <yury.norov@gmail.com>, John Hubbard <jhubbard@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Edwin Peer <epeer@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, 
 Dirk Behme <dirk.behme@de.bosch.com>, Steven Price <steven.price@arm.com>, 
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TY4P286CA0055.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:36e::14) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CY5PR12MB6131:EE_
X-MS-Office365-Filtering-Correlation-Id: 727d041c-891c-4596-0cfe-08de7dee919b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|376014|7416014|1800799024|366016|921020;
X-Microsoft-Antispam-Message-Info:
	frXi9zNASCUtXRH6vL1KzgEdvbJJ2p+bW14qYHT9DedqnhkEG6Nd9v7eptJ3bMisNMF70qr/BbhJdBSKZUcBY0x1mQ0QDUHeG1u7Tp7EiwEE8dMmKbA7WcpWwz9RzDaKCsaB0S/UJUDbceJ0Z/gxl/Cd60wW2I3Yj/lMO0cZIucz8E2SyiDjVbeCvkjDla1xfrAmvDukNcEiCmxZcvaDvivoEqNkhJRtmW1RMeiEjEwUt4VKQntoL3d+TKbSwN7jYbUog2NeuRa0jprfh8Kn1bekW/gjIHJyWxGjfPXv465xXjzq0eFXT4L2DmPBIrkpGtpMGlOkAs+aeVnzcSQDEr0mU5ZeBXAtpjnmNMiGCYqKA1ZWFNHVixNja5MnBc+6QEDAQPbYckP/AOxmqaGekoIjobb2yeRgTntLBsYRoppjLQM6ofvsV83FleaFnDEpJRHBMyH5mIFKLdKUJtceHMMWUltqCLU8Shv/7/uarNzjlyJf/vL11GuQjH784CSZ+5KBwDBM6bFP33QP69XA+hbaS6ovFRAfNByyoFqai74g+OOHqIwXw7YW1m+204LJZsHI3PXyYA2rZyz3M6JYPm4uVGhFT/osw/g41xXsO1wxHGR4GIzh6gjoW5GXyKhGykXmmQztRw8uO1ZvE7Bq95F+/5jh8R00TgN4dZKUyl+n1DVByO95y4i5uwXx27X2eY/REHR0w198y6r/3I53Hf0jYNs5/IiWejL68DPfcf5Gj58uHPLzj+rIxj9cjmq33ix+H1eexRSGb5YC0N6k2A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(7416014)(1800799024)(366016)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S2N0bW1jNWhGUFlQUGZIZzYvVkZuaXZTMjB4azgveTFVUHR4RHdRYjI4TU12?=
 =?utf-8?B?QTNSOEJlTFAxRGl0MkxQUTNubVpGZWdyb0ZHZkhjK1hxWSsraEtWalUrRDEv?=
 =?utf-8?B?UldSa2c4NUZuWk5JdzdoZEZia0Nwa1ovQUhvbStneWpDNFRiU205VHZQbHA4?=
 =?utf-8?B?YTNtbnJJVFZ0RTNMdHd2c3U4WjBIMDhvVXRKMUFCamJZS0pxU0NVdTJ5cisz?=
 =?utf-8?B?YnlPUXdqbUlNcncxblRVVnUxUlhPNmFQUk45VU5FUWFzYkRycWN3VWI1bWNZ?=
 =?utf-8?B?UHV2eWswZE5uNzdmMUhHcHp1TFZVN3B3aXBiSFVXanB0QUFvSVprNXVWaThP?=
 =?utf-8?B?ZExUZkdFOG1YK1N6cmhTUFFFUEpOK0dKZnVmcUE5Tm1BWW5NM2NaZmdFVFZB?=
 =?utf-8?B?ejlSM1F1SENnNmVvM0pGTjFVN2Z6ZTVMQ2Z1SkNlQ1B1bS9ZbTBYWERIQ0FN?=
 =?utf-8?B?RmdCNWs5RGFFTEpCR09telNucXJxTTEvSmkrL3FuSW9DWU1aRjNudVZhUDRw?=
 =?utf-8?B?blhCRWVadFZNTGpuYzhTc3B3VDBuejhMa0YvUzJBazE0OGNUeFVkR0h0YnhT?=
 =?utf-8?B?MHNEOEZDR29lNGNvdFo5MVh4eWwyT095Z2FNL0JMMjVYdHBDYStYZEZCNHlB?=
 =?utf-8?B?RHV4dHhBOENjMmcvREQzYnc2ZmF0NUF3ZTNhSHd1UVRobFIxd1c4UmtZV1d2?=
 =?utf-8?B?SnhZbUF3UDc4NVF5TG52RE9yelVET2ZVeG1KRGZneExXSDk5ME1CK21uWDBo?=
 =?utf-8?B?NjRiNDd2N1pzTDlNdXhDWFpuSzYxY3ZMTjFQSytRYktMaUtMQ2hhUXFXd09v?=
 =?utf-8?B?cUNGakhsWmQxTHlwK2VOM3hXcy93Nys4emhBK2tDSWUwR3pnV0RFT29RSDht?=
 =?utf-8?B?b2E0TnJoMTlUeTNJeVZWQkRoRE9ZQWJvazMxNnFKU2doZEVGQjV2ekVkaDQ3?=
 =?utf-8?B?MXpUVm0vSGZrTG5sWGJJcXZsM2JkTmtXRktYeWdEM0NYL2NpZ1owTGJ6MU51?=
 =?utf-8?B?NlR2anhjdVdsd1N3eE13S3NObGdzYThpYkFoTnR5TklrMjM4b2xubW5FQzUz?=
 =?utf-8?B?WFFJNUxIN3RoMmt3MkdtQXMxN3paekdhSVB2QTUzckMxTUNSaWVZbytMbkM0?=
 =?utf-8?B?QVczMzl3M28rM2pkZWx1bFVyNHk5SXdJSmhJSUVWY1hRTHQxNHcyMVlBRmRo?=
 =?utf-8?B?cDlERzI4VnBSUmRRaEwrMjZmTDE2ZlpxUGQvYXpOK2JmUHBYMjBpRE91VnVq?=
 =?utf-8?B?RTZiY09pK0QyVEFWQmFtK082SkkydVdPd0ZVbGhKYnBGN0tTSTAwWUx5S3Zs?=
 =?utf-8?B?ZGpMSENSWk0wNTUwcGdCNHU1QjFkNWtkTGYrNWdQMEJsbjQzbHg3TlFXU3p0?=
 =?utf-8?B?Z1FvN1FUTmZadmRTcFlLakNVdW8vSEhBUm9CNlJ2Z1lMVUkxNGVLRW1KNnZG?=
 =?utf-8?B?d0Q2WkJUT21nSThoWThHUVg1MEtKWnVUSmxDa3dpV3AvYkhDcm9ZNGtsOTZz?=
 =?utf-8?B?TmovMjE4THFrSVc1Y0VIY0pUTjVmdk5pbmhhenViV3k1NjVobk9wUG1wNSty?=
 =?utf-8?B?ZHRLMnN5Y1JGTXhrNDNxd01XelRSdEhCMm94YUdnOGw4TVhpV204MGtzbmpo?=
 =?utf-8?B?NDVWVWRSMHUvaVduVG5LdVFtbldUeHh1dm4zYktpaVEvUXh2eDAwY253SlRO?=
 =?utf-8?B?eC9vSnRkTE1aSnFqdnRyWUVNRkJ1Z1FxSGhQRDlIMXJjSlJTRmMveU00cHdJ?=
 =?utf-8?B?N0xiSnNlVFl4Qmc2RkhGSDNOa2gvWDdIc0RnRWRIbHBtakFWbDluNC9jb3VQ?=
 =?utf-8?B?eVNPVkQ4TGZIa2lVa0pvY2lrdW8zUUhzZi9CT1BMZERCTUhqQkkxYndTcGY5?=
 =?utf-8?B?YzBqbTY3ZVp2QTAxRGhPcVF1M1E4QUFWOEl2OGtXa29hczV1dU5oTzg4VVp1?=
 =?utf-8?B?T3RlM3hGaXUzb0M3MFZGOTNhcjlTT2daVjAvZDB1WXh4dGM1bFpHZm02aEJB?=
 =?utf-8?B?Q21ieW9hejdZQ1BUT3RVUVB4Zy81YUJIdE5FbEJtck51bGJpdVZtTVVkd1A2?=
 =?utf-8?B?dVFKOW9lTUo2VkVQMVRheEhlZ0dJZzJ0VnFRaHIrWndqaDBxZmZBM0hGNytK?=
 =?utf-8?B?NkJGYXVhT2VvRXlYaEh1eGNZaU13cmdZaWQweEJZM2hCZkJvRUp0Z3ZDYlhx?=
 =?utf-8?B?cmo0WWRtUzhtaDd3bjJsL1B3MlpTS09yb0tIUG9HcDhJbTlkSW9aeXYzV3dC?=
 =?utf-8?B?aE02OXQxV0JxRGpMY1l1c1hFQ2NIdzVBM0lmRnlhNGwwbE43cDhqaEdGQVl0?=
 =?utf-8?B?aldSV3VwOEVQdWVBTzFLQ09VK2taMXZCWXFWQUsrVFljRnBwME03bHFhSWgz?=
 =?utf-8?Q?rVwyqcYxfK31U3gdpAN0Y/IT4V5WS4tUp9n4Iy8Gz1h4+?=
X-MS-Exchange-AntiSpam-MessageData-1: cym3+rEyweGHHA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 727d041c-891c-4596-0cfe-08de7dee919b
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 15:14:33.3306
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YwLu56m2snQQa8zoOLfi6TwBrWefoWn/GSTEAnF+IhZj8ese9jusG/t69xZQ3GXhAS4wemBk4kkII3t2nsI0Wg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6131

I/O accesses are defined by the following properties:

- An I/O location, which consists of a start address, a width, and a
  type to interpret the read value as,
- A value, which is returned for reads or provided for writes.

Introduce the `IoLoc` trait, which allows implementing types to fully
specify an I/O location.

This allows I/O operations to be made generic through the new `read` and
`write` methods.

This design will allow us to factorize the I/O code working with
primitives, and to introduce ways to perform I/O with a higher degree of
control through register types.

Co-developed-by: Gary Guo <gary@garyguo.net>
Signed-off-by: Gary Guo <gary@garyguo.net>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 rust/kernel/io.rs | 124 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 124 insertions(+)

diff --git a/rust/kernel/io.rs b/rust/kernel/io.rs
index b150743ffa4f..1db6572f4a42 100644
--- a/rust/kernel/io.rs
+++ b/rust/kernel/io.rs
@@ -173,6 +173,30 @@ pub trait IoCapable<T> {
     unsafe fn io_write(&self, value: T, address: usize);
 }
 
+/// Describes a given I/O location: its offset, width, and type to convert the raw value from and
+/// into.
+///
+/// This trait is the key abstraction allowing [`Io::read`], [`Io::write`], and [`Io::update`] (and
+/// their fallible [`try_read`](Io::try_read), [`try_write`](Io::try_write) and
+/// [`try_update`](Io::try_update) counterparts) to work uniformly with both raw [`usize`] offsets
+/// (for primitive types like [`u32`]) and typed ones.
+///
+/// An `IoLoc<T>` carries three pieces of information:
+///
+/// - The offset to access (returned by [`IoLoc::offset`]),
+/// - The width of the access (determined by [`IoLoc::IoType`]),
+/// - The type `T` in which the raw data is returned or provided.
+///
+/// `T` and `IoLoc::IoType` may differ: for instance, a typed register has `T` = the register type
+/// with its bitfields, and `IoType` = its backing primitive (e.g. `u32`).
+pub trait IoLoc<T> {
+    /// Size ([`u8`], [`u16`], etc) of the I/O performed on the returned [`offset`](IoLoc::offset).
+    type IoType: Into<T> + From<T>;
+
+    /// Returns the offset of this location.
+    fn offset(&self) -> usize;
+}
+
 /// Types implementing this trait (e.g. MMIO BARs or PCI config regions)
 /// can perform I/O operations on regions of memory.
 ///
@@ -406,6 +430,106 @@ fn write64(&self, value: u64, offset: usize)
         // SAFETY: `address` has been validated by `io_addr_assert`.
         unsafe { self.io_write(value, address) }
     }
+
+    /// Generic fallible read with runtime bounds check.
+    #[inline(always)]
+    fn try_read<T, L>(&self, location: L) -> Result<T>
+    where
+        L: IoLoc<T>,
+        Self: IoCapable<L::IoType>,
+    {
+        let address = self.io_addr::<L::IoType>(location.offset())?;
+
+        // SAFETY: `address` has been validated by `io_addr`.
+        Ok(unsafe { self.io_read(address) }.into())
+    }
+
+    /// Generic fallible write with runtime bounds check.
+    #[inline(always)]
+    fn try_write<T, L>(&self, location: L, value: T) -> Result
+    where
+        L: IoLoc<T>,
+        Self: IoCapable<L::IoType>,
+    {
+        let address = self.io_addr::<L::IoType>(location.offset())?;
+        let io_value = value.into();
+
+        // SAFETY: `address` has been validated by `io_addr`.
+        unsafe { self.io_write(io_value, address) }
+
+        Ok(())
+    }
+
+    /// Generic fallible update with runtime bounds check.
+    ///
+    /// Caution: this does not perform any synchronization. Race conditions can occur in case of
+    /// concurrent access.
+    #[inline(always)]
+    fn try_update<T, L, F>(&self, location: L, f: F) -> Result
+    where
+        L: IoLoc<T>,
+        Self: IoCapable<L::IoType>,
+        F: FnOnce(T) -> T,
+    {
+        let address = self.io_addr::<L::IoType>(location.offset())?;
+
+        // SAFETY: `address` has been validated by `io_addr`.
+        let value: T = unsafe { self.io_read(address) }.into();
+        let io_value = f(value).into();
+
+        // SAFETY: `address` has been validated by `io_addr_assert`.
+        unsafe { self.io_write(io_value, address) }
+
+        Ok(())
+    }
+
+    /// Generic infallible read with compile-time bounds check.
+    #[inline(always)]
+    fn read<T, L>(&self, location: L) -> T
+    where
+        L: IoLoc<T>,
+        Self: IoKnownSize + IoCapable<L::IoType>,
+    {
+        let address = self.io_addr_assert::<L::IoType>(location.offset());
+
+        // SAFETY: `address` has been validated by `io_addr_assert`.
+        unsafe { self.io_read(address) }.into()
+    }
+
+    /// Generic infallible write with compile-time bounds check.
+    #[inline(always)]
+    fn write<T, L>(&self, location: L, value: T)
+    where
+        L: IoLoc<T>,
+        Self: IoKnownSize + IoCapable<L::IoType>,
+    {
+        let address = self.io_addr_assert::<L::IoType>(location.offset());
+        let io_value = value.into();
+
+        // SAFETY: `address` has been validated by `io_addr_assert`.
+        unsafe { self.io_write(io_value, address) }
+    }
+
+    /// Generic infallible update with compile-time bounds check.
+    ///
+    /// Caution: this does not perform any synchronization. Race conditions can occur in case of
+    /// concurrent access.
+    #[inline(always)]
+    fn update<T, L, F>(&self, location: L, f: F)
+    where
+        L: IoLoc<T>,
+        Self: IoKnownSize + IoCapable<L::IoType> + Sized,
+        F: FnOnce(T) -> T,
+    {
+        let address = self.io_addr_assert::<L::IoType>(location.offset());
+
+        // SAFETY: `address` has been validated by `io_addr_assert`.
+        let value: T = unsafe { self.io_read(address) }.into();
+        let io_value = f(value).into();
+
+        // SAFETY: `address` has been validated by `io_addr_assert`.
+        unsafe { self.io_write(io_value, address) }
+    }
 }
 
 /// Trait for types with a known size at compile time.

-- 
2.53.0


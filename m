Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011065.outbound.protection.outlook.com [40.93.194.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A6A32F83B7;
	Wed, 25 Mar 2026 03:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774410809; cv=fail; b=bN5b26pyF0xMUCR/8Xtk15c6cJkOQXLfPmqYOQQePvcHtvqp8bnivH0e/X4aYh6TeaBKtwi4Ym4V7UO3j1vrA8O7j4kVEuhsaU4Ln145nOqESCU0blwDW+oDsH2iNgu0qgJqfwEFeKf1iRpBYpW1RWRs2zPyoDu8FKEkEnoVDio=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774410809; c=relaxed/simple;
	bh=UT+l2O4Q5nskWQRnfadZNUIf8Fqy48VF+XSZOk43zuc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=VFnCQa9vc+uPAmCqQ+XVE2dfmVF2m5kMenGOi8oEiJGrm4RuhbWXNHJqYeHC3BF8JtyRiHKVjjpBJcUyUJMuSGgXs+oz+/hE9vx+BpzG03fsrPwdTfhVaxG+SalIzBfWrweO7zqzQiB5aE+TtAJr41UiTIgWghiOvGFu9fsoBAE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=b6BJvO4Z; arc=fail smtp.client-ip=40.93.194.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="b6BJvO4Z"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QGpE9KAJEyNWmKO6Y2NlmHaXT2VXKz/gY9iYIbS02Y3Ya+bUtW7VR2AqU8LgyNin10ulgXhNWfwIyf1USQpeiJRH6q0CzrZ4eIRuhp8XAC+tqJsAhpdv4MqCnZXcZ+964lWjQHhX7vwNbF8NSb37pEqKOFL8ZNNnoRfa4MJ4Yq3XsSCfDBAODhiRt4+Sd1ekeitvafcxL2OSRCWE33HAAYq6ziw596nbv1jXgiId0XXiwE2JuOV1Q0sNtwxT+NIaSNLndGaZQ0uNVxBL7+itWqj25KlwOkXwnwNsVlYX0prNHiy3AyK8AXFyV3I0eYzlGQfALzLV9DokI1mfrd56Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5rcbpF2FxePTPZU5vap7/SdGKdnppb+lRZq7qpbG6WA=;
 b=hiRo+0ceHQJIorVCfDNr1SOaH81xg9YKVh5e0Z/oROrN8ZLKuHopHmpfsExOnvmOcCALtypAhnEk3A2ZurjYXR3T3oMIm58x3NCNWLYMQf69EJV6gEkOGeqkA+wm1Q9Kd4rFHvuU0D3v1myOjr0hYJXkFSn9E7uE0tevv4DZFsdXkhiS+F6N2GR2WYVlzhsNLv9QBbrtG6htXrrx1t4qqFtdKLiCtjxjO10zG2iEdjQA+184/tskeh7U0g9IFJory92DYxWPYq8YJDU/nay/vxNg+uE1Wwj6ywwp31SMOlZlQ8gwgU3BP30UFMXg7Mt8FGSHgFtpSK3WTv5tcumx2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5rcbpF2FxePTPZU5vap7/SdGKdnppb+lRZq7qpbG6WA=;
 b=b6BJvO4Z6+KYIe4rlJXHcLp3WEpf0+ZZQ4P1w3UD2PGfdnDvTEswAmAGpSc7PXRXrIzsSzJ7XjLl1uDFWX9gTlGsa2ZVNBcTryjtY5KiYclHSc7rH9DjOtgueNf5ygbBvx8Qb6ssvPDzU6YXAWzMyuOWQ4eTIQ1mF2bGFIlwT9C17skMcV74Qv/hRerbkS9WfKq1cBA4SryerAoLz5dCsqJk43kiIkXloavy/JoXHYFTPe15qkAxI4/+knI3qVtQre3Ox2+tjfgBm+/m4/o/npgpqpg6+wNVFaUHjmaGhmRbYTVzN8i4D9I3od7VF7RIzCYBA7Wl5tUxUzpUDwJZkA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 DM4PR12MB6327.namprd12.prod.outlook.com (2603:10b6:8:a2::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.20; Wed, 25 Mar 2026 03:53:05 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.20.9745.019; Wed, 25 Mar 2026
 03:53:05 +0000
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
Subject: [PATCH v8 16/31] rust: ptr: add const_align_up()
Date: Tue, 24 Mar 2026 20:52:27 -0700
Message-ID: <20260325035242.368661-17-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260325035242.368661-1-jhubbard@nvidia.com>
References: <20260325035242.368661-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR10CA0020.namprd10.prod.outlook.com
 (2603:10b6:a03:255::25) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|DM4PR12MB6327:EE_
X-MS-Office365-Filtering-Correlation-Id: 66d2d41d-966a-483e-b7d2-08de8a2204fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|366016|7053199007|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	FJHZ1N7WMhyhn9ZcWUCWty5sorp0GJlhQ2gug6RoMeig83bKYTmuxBm6c5vlVDXDw4tOmkIVX6UrGYT2C56nmBad65QS4SgbHFsudrOXExwU7UNahXuZcvGgHLKIlPX1OgFbQnSnysj3G+GVT72L9XQ52TWUsbFsScEroDWeJVihnX0R3MVIR9tGHreyWDjHbjkVOk8wZfSFtg3sVepiLeGqAqfoOW0zgnRSti4c8pqIiLzWuYl97+4QzGmJa1FQZGn8Blt5t5YZqUlmUMMfDXKMa/pGRPZTeVBs6fnqjvSoK2cJT1lUvV2v5NEBcT9KZbOtcURUjjfNgGWeKWqw56WGeVQsEmFCzDVVRZv2oBv5FSXJ9s2rsFbBQKdzcFF+WuoyhVmVnSzTItfd9JJgd25UOTPutrWYXlPDJqUIPJ2jiRFGqslYwmky5TZZJM2evssK/+GsGtWJCcT6ZnMXY3e4NbBExjNwdkSNGdJACWw41lgTl65re+O6feT86tlchC3mjc6FEBcm30ngYWsO228PMHDjOlpI2/YnYSmxSl8hRCkQw+xC+oFNVj0aDlqMllToa+p5feXd7txbP40U5hNAVGp5tO0/vBXK1vgevLKQEy37RkV3eVad7s3QZOoHjXXB+tbpEluu2T650Saj4r34sDP0OOIL0jGdyNMU+/uP6/HvI/FzuLS5k4L+5t2UvfHkSQPf7esnDs9QL0Q1KL4/PySpIk0G1yL/ylj48XI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(7053199007)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?uR5s6jM+FxssvvEQYrmI0ycb3Qt7YZVOO9finMR+iWpDubSNiiGox5MyTUaU?=
 =?us-ascii?Q?R2p8SUxpdYqVW8ripgNWJkVmMRn9PRnTIbT8Al2Zev6sykOW4rN5e9GiYGTe?=
 =?us-ascii?Q?2DJu0MH548iR3DTviN4Qgs9lAtJUApz91a+2fld01UrIEpCyWOMJcHN2Tgay?=
 =?us-ascii?Q?/p4mWEYVFEdb6vU8Yp0YfDqXUhLgwmBMeFTTGrINY7KDuzxkV5Dh76gVHfX9?=
 =?us-ascii?Q?VmUplwghf4QTSsHbb/DmuKvQlK74Ai65TTiAaOsUEr15fmvoy/Xmrt0TkC4U?=
 =?us-ascii?Q?oy/pIVkB5xtLsze0W6rTkt41arVLRPlhvNCqvLcwJAUQHszQ+uFw91JMaNu1?=
 =?us-ascii?Q?687nP+Ea9qE6a34EybUIzzobq4RTx9GlS9SSSYFeaKQR0QCnWuwAiFyZdhWv?=
 =?us-ascii?Q?/Bm8UKTYn+um9VEhbTWzYyjp4o45+yZ/TKyRSazvmqWQYNWKKpU5zTolrB9b?=
 =?us-ascii?Q?+C+4MtcDpF9jIm4jCibWtK3d6XA2CtRiP3eHWZxoiO1bBE5kfwYbPSZBDP4M?=
 =?us-ascii?Q?wNS2UN45NrK6+226oxBecQ3snhkTDLW7azRC6DonFAnLJcpvwHVeYIMmEccp?=
 =?us-ascii?Q?5UwCMYXZN8I9WnVW+/k2XnAbc4f6fTNYTwO+6dcIfEMP9CLIYs6Vr7C6cEmr?=
 =?us-ascii?Q?G7iPUOFmqC5aa3E5nUjV8BQ5QnR1Cxkd+QgBuVvgZBVRe4G4grknP3K89fdn?=
 =?us-ascii?Q?KllBoltlGODeGUZjN6hu6YymcnqABvJfvWZgW5gKYnABQmWHJOqEFSwZiriZ?=
 =?us-ascii?Q?k5/t/x3e7P+D6+3AQdYvOcrAa7acgCxhLiSqSkoWyvVId28r02oqVDi6Jxnn?=
 =?us-ascii?Q?4JDLRDYbf1AdAd9Kuhx32Rx9Lp4os3bjYZVa67O+xUmCtkigDxJCKlfChwiy?=
 =?us-ascii?Q?EdgIqI38OAGnsJSrDQLCI2xT9SSNgngsBb1kyiPR2XmDW090SakhF/iaf+nd?=
 =?us-ascii?Q?C7olo7StqOV13FxgdtMmHyB3x15NRvWIpDqBqreHin9KtGrzhu8AqghwnAfC?=
 =?us-ascii?Q?o+xhsvhpjysM2Jqz2tzJWSdk7GQ1Nv6qCUo+ECyGJVAw10PQU2DOvTFNGRNa?=
 =?us-ascii?Q?lllUyPgOQ9cikXfH1OG73Vxw0ezRN3ZQ+LT4ijXLzxndPVpmv4eRR591vZ6S?=
 =?us-ascii?Q?9J6L845g+NOrc9bZXYUILGwAW7mNQOBU81p64YP+gmkuFpSpBB+6Cs08Ox6L?=
 =?us-ascii?Q?nOqTeiDPQfHeG7+aj3Xo53D/efKoibvthaU49TnfTlQkqjCQp5z8Xlv4eoP4?=
 =?us-ascii?Q?tE6zix/P9NlF5jJy31qL7JOoToZgVB27CwR6IOt0JWK6ssp5ubXYy86a6k/d?=
 =?us-ascii?Q?FTt4HYHtAsN7SlcY+tZ27D3ADZayayqNR0Wgn1eCliKINCgjSEo/i4vexwqM?=
 =?us-ascii?Q?aXoXnJBN5qA0rOMJJG8Xe7PkuaJRgUp7+ZvOx99NYpy6FuNvoGxkpkJgt6AZ?=
 =?us-ascii?Q?4baUZvOrGp/rGyfBZMHOfGBuMVoSRjQ5DewCZrRFJtvuS1mvTcyNzTgQGDiF?=
 =?us-ascii?Q?CrabtUJT7Fq6YuLfcIg4WNVXS4b5JrG7+QDLbO3F5w37qT1jwDByD3roOVgu?=
 =?us-ascii?Q?nsZHygRG/9DxsCyIiTGsMfVQsk/xs8CnAU5c96acKhiVKAE2auaoprotT+rD?=
 =?us-ascii?Q?eZWDLctsUC8UTWsR/O/CtEOftqhqcZRQX4UwdKREAROv3F5d1DDk7tuY/e8T?=
 =?us-ascii?Q?7tXdROSnZ24+Qr1N0HjDyg+hCzF0NI7H9P20URBkpF3kqxy/OJyC2NXsE4Se?=
 =?us-ascii?Q?IUzFEtfrzg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 66d2d41d-966a-483e-b7d2-08de8a2204fb
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 03:53:05.2058
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JSMSPuAjtrcbRSGkTyczfzgkZX4eZKiwz2Gy+/l3NJE1onnW922q9IzOtqX8xbVAa16FWse4R3BdS4o8nMiSFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6327

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


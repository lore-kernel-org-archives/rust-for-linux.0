Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013065.outbound.protection.outlook.com [40.107.201.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 209C43A2557;
	Tue, 10 Mar 2026 02:12:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773108725; cv=fail; b=MS/r9WuQUMwgtBwLSz67i3v7UCrzhqBE/SEWOd8niuFzaJWwX9g6nxnntA+tYhzRseXuwQwj+d1AmaCWoaIvetEJCS4nilO/01eEIFiliK20AH9S0e3cm46ZoK507V3ZOE2wDOWNSF8Bp73aO9RHVOfEKUYJ+OFiZcSDM20EWRQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773108725; c=relaxed/simple;
	bh=XafAiKuSVu53tKM0aFHg3HGJqt5gP+ykX41Clo9fM1Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=W5DR7kLARXLxbgfer3yHUiRtJyMiojlLZh3KWNDR6f/wfwCorFZpBDEy3foC1c3O4iZMacNQsed8mLtWN0OYyVuB6f6AwfvD9ImmSxgO5T1QSADC38NthUmYS1NQ80FFSyD4iMlJOM0r5PfLjWoLZ00sxNZAl5ny4IwunUMyPbw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ctd9vFce; arc=fail smtp.client-ip=40.107.201.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ctd9vFce"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gQzeMtbKHms8SuZvnBvxwGYMo2kiDac+jrqSwJvjvsbwqdwot1DEYf4pxWPKgDMiSZiIzpfXxFEf1UK61+emt4obH0jBwkAfdN0i0TpbiF4UR4r633sg9nx9m+AUHPM/mfILcn/BXWotuaHJxHQRuSnvoMTPNfM9BMaLemfJeQk6v0yGtuUaROA0VQwlSM2oJlDJe11Nwl+f3mGYfWKhhZC9OQvXAID8Vq+5XZC4ydjK7eph/lvb7FMgz3EUetkOEYveeUpJ47K8WHEai0nZqKGhfsVizWOOqzh/M47PuQO5LXFyaXtGhyl2ORmOpcN/K8slwdR5/j1WcrayQ5gyqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u3KDz5o5uRijOMYblhNA0E88D28l4Cursw6SBrjIbcE=;
 b=JEgSXCUsG8H8GQZOZny/gIABJnnicnqIGfu2RT6Sx+L/Rrw5LfcTqMbjEK2ud66rPczlQeH5j1qkDz5lelqw6BHf3spGaKKL/oyOOWoiDhV5/bXGsfpxeFbdufl0BwIetusi+NvEl0Dp+UYQ57x9q1OXAMR3qkrCoBLMgkYUaq4MD1s9WQr7zomBE1It5wRrDs9CyE3x6F786rSIytCy0V9cuJ+3Yqq1yGKw60kjZxjoiAfxsMzducu+E1SVh5/fEtB2DzQdYCfU7oPthMm0916WSbHxjbufO9lCUIj2I4QXBnB/WjnhI9JMI6B1bfZxHYS2YQ+tAdDJaiTiikv/og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u3KDz5o5uRijOMYblhNA0E88D28l4Cursw6SBrjIbcE=;
 b=ctd9vFcesk2m+Qym+RZTFaNeOLckW+7Yu3bKTJnekZNRAIaj162R6/7cu8eNJ46nMAekDxbgyfERJWu4xc03/CBq1vW3xBOLtS605ukeDmzAMEG8R2jUDsx4hkOtWJGXfFVpdoTjb7KpzT/anA2f1cNuBmghqfB6WsAIhSPgPfol2QyOtu51riv9gEOqaAYtfRx81q9Cg6ovlleoplI2LeL6t5Y/WOjxQuLcVxK/Bdk74Awtv0hK6cTAQDRfJ4bk5eYiIEFSTRoyePOlvy9Kqo1r+Gy3zsQAhCeSaK17V7h4Ir2BCVFEF/2DKPTlCyAQpklOtCvvd6w9Uf2eXJd+jA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 DM4PR12MB7573.namprd12.prod.outlook.com (2603:10b6:8:10f::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.11; Tue, 10 Mar 2026 02:11:53 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9700.010; Tue, 10 Mar 2026
 02:11:53 +0000
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
Subject: [PATCH v6 19/34] rust: ptr: add const_align_up()
Date: Mon,  9 Mar 2026 19:11:09 -0700
Message-ID: <20260310021125.117855-20-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260310021125.117855-1-jhubbard@nvidia.com>
References: <20260310021125.117855-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0034.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::9) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|DM4PR12MB7573:EE_
X-MS-Office365-Filtering-Correlation-Id: 282a6459-056c-439b-a69b-08de7e4a65b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|7053199007;
X-Microsoft-Antispam-Message-Info:
	2+soiiftHPJhowj3ZPHY1HWPZ+rmCcSr15wGRyTat1U6GUB1zOXwlHkNNPWGDb4GgJtatz4RveZ8o8LKzdCBLvgdaWdtr6eTh/K4mMeKPToNp+AitSa9MM/o+2cTVaWK9tgSWur6YJhk1eyCK3i8eaT463RYDZDp6jHuskZvXUp8N9F1Yvj71ndhaHjj/6WOtqYU+aoGBaaZ2CKTU1BKMVxd585jP7Fe9jr+mQnFbykeeIdNnX8EszZfqy5KopnoNv8UwHWFrKJ9DHiFS1jwRZSIVp8vcA6HG8rlA/jaDRRCcFs90B+/ZxieFYW8gfOV1jqNcD2PP+S8wjxRk2D2FO8GGO5YQR3BM0heMau9LIAY+//hFnomsdPTwQf0a+LPeDVVA0WyPUZMRFqKIb0izpg3X2uJI4hKLOugrDANuyOT9g2wEoj67GmuTIquopF0sQt4yvqTnn8oyP3/IfjUFHpAgz9PbHJm+S9lDmquAhgGvWJQe2ObgTlSiyhldbpY1Gq4v8LX4Nf8h9uOwQQ6ToSjP/3Zp7Yhz/qG4IPEMeAOn9s4SKCGXRPoIOcROKtRRNvpKcHbrKzHCBLPGB3F5DwciRZH73vdRDgWHVxPIinr3SGhLATyutkDLHbMznkpQuLGfFAUOSI5HkNiIHvxW6AKuj0EHA/mdmZyf0S2jJmZluKJfJWtR1L3Qw6aMD6pIzZCTXA85iblZP2Wp7ojWMVaTSs5qLw425OlrPHmP0E=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?2h+u0rKpTh2E1MpIMyCL1gVufwTsq6lXbJC3Fj+Xkf7VFSsqarR6DQPE406z?=
 =?us-ascii?Q?YlWdHMhPNuCcCK2cWwJ3cha339nV1dMKEQiGOWbX3YsQ8Jpn3yFexKv/4Usm?=
 =?us-ascii?Q?YgikQV+NnExTuCYMNwy23kzVUZWKoLmL/b5IUHBOcasu3OY7bjUe6X99bvdh?=
 =?us-ascii?Q?qB30FgmdzOWaV3fnfJIqnjFNgtCKY5qv+9hsVEYlj//8Tq9usPVTAk00vbtP?=
 =?us-ascii?Q?nAnog7K+/PMKGubw9m2MW+/Ufj5YxJ7LYR9Y+0o6NlTKOq+E+RH2jxJKbhBm?=
 =?us-ascii?Q?KljzTls315WibH7Ir64VKhMoKMKQcrxNFBkUerbJk4YTJN2T+VQs0gAoSuQ6?=
 =?us-ascii?Q?p0BA4Kbxhyk36n+8CWzXxwgEddCnLC6cDWzyD0LoNJ1Cqa5sR1FddtP5ai3B?=
 =?us-ascii?Q?47bNSAJ8G7d1NXy9M9e7Q+PzdF+Pn/MgotH03N4kdiSFenbqs0L+1uq7Qxk0?=
 =?us-ascii?Q?dWfZxGE62fh2ctqjM/mckBrs82ffVoqAHh7zdvUuaMro67ZfkpoP8Wv7UjE2?=
 =?us-ascii?Q?24GGOVwr99loYFvDWPL3hS9izmIp5qM5ru/aFYaptgB17grnZmIoe8SKOMZv?=
 =?us-ascii?Q?sCBm+8xUEPDYBdLcojmDUdR+YfrfcEpSp/VOsxD7xCTEcjE2nF9S09w6UCfT?=
 =?us-ascii?Q?NZRhSE3is5JfhyR6PuuJs4e1IQet/Jb3u+IZus10QWHbdvRIE6YxUsjGXq29?=
 =?us-ascii?Q?FaZ1ZoXhi+Fg4wOeXP/0QZ2JUgwkACRLeiJaBUBY6w1YF/0QQ5OuXywVobPe?=
 =?us-ascii?Q?Pq2GRCW4aFvgS+jUcEjcyfYe4C+boXT9twVyMeNyq/7kQ54+Sl+AyvcgUOvq?=
 =?us-ascii?Q?Hyk3WyyybUBWKuL6+b7PGlyH7YMqk1JGUIln7y6KfSjkSFq4TuDg80Xv2EtE?=
 =?us-ascii?Q?RwQX67OmOUlMPyoaLsrc1v3zojPkltY7gRpBNPQNkA7sWO0HVg2M08mzyPq4?=
 =?us-ascii?Q?rtcJsklnAVUjT8dvp/taOs8jzCIMqnYoSqhZRpafMrKxVuWOv7dfcJU7gpQ/?=
 =?us-ascii?Q?Ooz5VCQ1TIU4BV0hhXEKF2KhcwO4KkxxfZCl686P3miCUWFUhsVOq3c8+JRD?=
 =?us-ascii?Q?rcukoCTYHLqGfayDZETN+eca9TSZkTmmc/rkeuko9BKIWqKXWAjH7/3TPVJr?=
 =?us-ascii?Q?Uwl1yKa3ab05vBI1Zc4EdfCvd9wRq4vkU1avzENRqppZIUFnNDRvGVUaeWf9?=
 =?us-ascii?Q?t1Ss92wjymH5fUUrgyi5iXBcNdELconk1iM/cNRI+j8ucVRaKz0KXxokK1Z8?=
 =?us-ascii?Q?d+i6J0RWKcdFTKWyMKIzrow8A8khvDN8mfejHXkmS91f+WK+7mtziTqEYkyG?=
 =?us-ascii?Q?fw3JmXvkJi3G9DxKk4PZYPeyI9074aCE/QaGI/sNAV1PUuXqthGIfTgiw8UY?=
 =?us-ascii?Q?NmlmdBJDafUonrEF7Bo32CAnPf7xi9/B0s7lNX7M7dGIeRxXcnej3YvFuyuF?=
 =?us-ascii?Q?XAnu0wDWLj3JeRW2ZTjoFLIZ8AjNvizz+zdgX1RfxHh/8p9+GB9SAcGX6ine?=
 =?us-ascii?Q?/53TVNil8HOtESMDXMqHHnwnquXFuISeVKsc8EtND7C8JZhwKs+ArkPGW8ZX?=
 =?us-ascii?Q?QLVrzQJSAh7lkDszFYamcFwwZbwnCa/vwtCWgYKebfp6gdPVc49iKr3OFryH?=
 =?us-ascii?Q?B4YXakDOwXFSBRWw62WSIBCIGCsTFMKRtIFwugwworncXggy5xrrUHB9i7yc?=
 =?us-ascii?Q?PWnrkVnnYhX5l7MulSKDHzaP8nXTOyVKvN5QVkqz53Jk5zI1FiNUsP3h5SCR?=
 =?us-ascii?Q?jm8qTtt1ZQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 282a6459-056c-439b-a69b-08de7e4a65b3
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 02:11:53.3806
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ma/SjP2mxPDGMZvL+5Ot0e9aNxRfrGNpGYYLO+yDA5eCbMNcRigfsXj9NCFH4gtnoUgk0TMYTjOD90gegrgVbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7573

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
index 5b6a382637fe..1e15aac4faca 100644
--- a/rust/kernel/ptr.rs
+++ b/rust/kernel/ptr.rs
@@ -225,3 +225,27 @@ fn align_up(self, alignment: Alignment) -> Option<Self> {
 }
 
 impl_alignable_uint!(u8, u16, u32, u64, usize);
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


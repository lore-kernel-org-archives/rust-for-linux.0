Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012042.outbound.protection.outlook.com [40.107.209.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4ADE25B1FF;
	Fri, 14 Nov 2025 02:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763088084; cv=fail; b=SL+9zrocBaH6Eul7DJmRSlOedWI42cSNE+08ex/HZq1denELmNY4UBTLkHSPYhZL1E6CaKgPU94gp0cF4Zll0pS0O0ofGbM0P8eC9hygfld5yE5QxZLoHzYCJWPBfVYZw5lZO1kYIXIeqkELA4FSpiYZV5yhsipG9JiqiQY4sGA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763088084; c=relaxed/simple;
	bh=8HsX69tNqfFGLNGan4bm57M8CsY/syy7g3L+3eoT+yc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=mW8vcBROyAVH6vvqG7MM1NOtToCN838YIgIyr2UM20UQS5PquM7CNiMEXff3t0XtcRlBJ6qrBovGfRLOTsxga3HjOC43tD+Y5ejo/tx3Abl04IRQgPSfu63BxDaLXthiUP9l8qsMdlDq0E7jTMFp8VkbOfjAZpB1UOj64toufS8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=tuB+u9Ux; arc=fail smtp.client-ip=40.107.209.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="tuB+u9Ux"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s1JW8JxIvriNi4W4lMHSpl3Lgvob767/FqH0RYiInCWbI1eSHgD5PHRKH/t5IiItlJoBZb3j222LQWRlgMUBcMgkJeihjqgvZa3BIoAXVQ+mQtQZlxUGzRGM7xdWmamyGf949nCo0N1lUnfpI2UvAO1su7Ge6ULjjRwJ+qsFwCOrJRFohRSm+U3MaCq+g7kMxbGhsvok+bELh5rCESGtHx6Pj6clp0GXVxQEDTWMTLnC5wtyARQmmEAo5H733sxX6km205QaaZEAJPWGFRfCU3kUUqwaqKVGvGk5mgaYBmiiBNtrWyELvnI2pMUhLfr0dQo36CHsA4WqiIbWTk4iqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bSTvbs9hexf7vlye8ulIsLmu1oT8As33MryWDkvib7s=;
 b=tcnJ+8h2RfpAJ90ApljEVOjzpV7OKD1i3beiIOsdmcfLd0h8ob3ejXOXFIhBxk54mc2RVSCPnateYgocVfQz4LidaJ7vwGW4UCJXE6IE28bTS+ZI6e7L5OOC91ryNxt5Zi+QyFLfkgZQMUClF1plYFBE9wyWqmX8CJDGObmXZhCkARbREFqFdxOqaMpbiSPUNaXFFr8HZ4tK6W2j8FgjpqEoP9m87wNHloZTaomi0vn7qWKQOctUjSbCjnU6GsGDs895Gy+M5thHfzEtKueRCrrkvsn5UqFcXGtd9cFmpD3niC54DXV054nl4lUJ77epSSYV8CfHkQ0umO+rOTmtFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bSTvbs9hexf7vlye8ulIsLmu1oT8As33MryWDkvib7s=;
 b=tuB+u9UxRiQolcuU9YA9QZVh5uH4h4CG3gLIjkbJRF3brbxJRFgitsMumE3klK9JQ9r4YeQZnKS+Ppk7c2mUp/tVY5d2UCaPGwYA16LR5HAHSlI2yVYp0nxCfPQ26J1gJUOwE1l4EcaV6qg9j7HydFy44z+2HFzlqDrizGsGbhaO/Jp6g3k4EEppGQFLLRxM3UVbbosIKkoZn+Izp7BS3IDbv/ITO7U9w3vmkks+Q58ZK09KGAJ+tczNEiX/QcEz7YLVegjnqax9FadyrgeBIZO0z90QiH1msTl4rgmke17rPgSuZ/w/QKb+bbRUpEkojQ+JdfR48mqpe6MW+wlOFA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 PH7PR12MB7986.namprd12.prod.outlook.com (2603:10b6:510:27d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Fri, 14 Nov
 2025 02:41:15 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::d622:b3e9:bfe1:26bb]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::d622:b3e9:bfe1:26bb%7]) with mapi id 15.20.9320.013; Fri, 14 Nov 2025
 02:41:15 +0000
From: John Hubbard <jhubbard@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Alexandre Courbot <acourbot@nvidia.com>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Timur Tabi <ttabi@nvidia.com>,
	Alistair Popple <apopple@nvidia.com>,
	Edwin Peer <epeer@nvidia.com>,
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
Subject: [PATCH v8 3/6] gpu: nova-core: make Architecture behave as a u8 type
Date: Thu, 13 Nov 2025 18:41:06 -0800
Message-ID: <20251114024109.465136-4-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251114024109.465136-1-jhubbard@nvidia.com>
References: <20251114024109.465136-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0188.namprd05.prod.outlook.com
 (2603:10b6:a03:330::13) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|PH7PR12MB7986:EE_
X-MS-Office365-Filtering-Correlation-Id: e0a89cb3-fd14-4994-384a-08de232747d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?q4SPvci2oVK1f2stcUcafJeP1neqFhQCLoHaT7uKgdr7yvpE9GeUVU9mUHAY?=
 =?us-ascii?Q?W/qZu7caAlaZjAuRjdxWUQdt+XyVVsR1alTgpP8tLpRQ9B/95HKQ7SGub0Bp?=
 =?us-ascii?Q?HqEkdaYdq0KJC1DHENSSdimqY4/vt9lXd6v8/J2yKkynUYOrmuVI/VysJofG?=
 =?us-ascii?Q?M45SRv+WAxycPW8CFlQB+pPfRyjV1wO+PPW8Edsi6z+eevHd4SJk6ksHKwI2?=
 =?us-ascii?Q?R95Xsc6PTsVX8errNoQ6KQeNBLb+9mF//M3M9f5ZMLTTxeggAaVAmhK6REb4?=
 =?us-ascii?Q?m8pm1Ik3BAY/BRDnmzkzgdRbKoolM1mqARmORb9kXFvU/m5+P/WEbBgjMFCW?=
 =?us-ascii?Q?dZ237bAcRhAbKVvfE/ntlS07ZxbvJwmLkZflJgcmx1rk76URrCfACXIT7vPM?=
 =?us-ascii?Q?qUjfPNcrsyjaUJHRKkgxWcYmawSkv5+0r7/fpIVzKrcp0oTAiGdl4lDxP9v8?=
 =?us-ascii?Q?NlyIiEbM6QqYloA259Ah4SmEQCkSKPrIzhdZnC8YgnJNalroZ2+lcP+4Pmqz?=
 =?us-ascii?Q?aUNa0PQtUSoRw5K6FQKom+BPD0JHTSNVWDPe7N6ZyIvW4nszrV1GvPW7mcDL?=
 =?us-ascii?Q?Qo7hAmbbnQLiFcCtWrrw9TJ0yczVIwhuiLk4BlWLVXPPg3QioeAr/LWGRpDh?=
 =?us-ascii?Q?d/w7/dsdy9OUCsig3ZvQWSCOKy5lU2hqn4AktcgJsFffh4SbyQRulRjZYD2k?=
 =?us-ascii?Q?hFBpo78dSAFOlKcyq7/YSBlVmYacUoVAJxxA2PhFR5McG1sh82xvTDZogp2M?=
 =?us-ascii?Q?cRzSoKKmsZeIlu4PFcxdmVU0/wWvArcApOeSTamGWbczpSRlOzpI2MDNIr1X?=
 =?us-ascii?Q?Dvl14YShJObLoehdk+yzAjxvjgDJV8qJ5mFxdVnQZDFncwHmcschrfv25WhI?=
 =?us-ascii?Q?D5aoqI+0jACJthnE7VJ2Jx1Qd1FJUHtYte4m0peOBb1Ve/5GaBKNWlRZKjh/?=
 =?us-ascii?Q?w4PRjpSGiZprarCtEEQeygJXDl1vqYPV6imbMxuXKpUzIHwmlguUTQRf9Bb6?=
 =?us-ascii?Q?9qW5Rky3odugrAkbxllimGSWc2TVD6yLPHdOSlmd2njxTqR8t4ktOwkS/ngn?=
 =?us-ascii?Q?MWXzzg8/cu//UIx8A5RS6XPqZ4/v8LswWCBrenN2a5eTN5wnPcl3FeZSzwcw?=
 =?us-ascii?Q?/VIQ5BwQ228pH0CVnytc6XpQgpfXelan0bcGXa/+qd4PVDZWPZUs77y8kA9C?=
 =?us-ascii?Q?xBw1dNCxvBMpI4kSWC8LkyvJkjF0aPIuxBzztGZCgWw94D/ZKn00om7ez1PS?=
 =?us-ascii?Q?ZWpppESeVcB9G2EC+U70WktEEvWfPmMKRwa1d5WrZTahdodfnCY93nbJryvv?=
 =?us-ascii?Q?SYk6XnzwXGnvUFChPX4z7ugUjuQ9LwhPOHb2l3JFxAXc0z6QNkS5ZZn0VwV/?=
 =?us-ascii?Q?lEj1l4IhGGn8lDX+V5K44UNqybDDWZq2BQKJoqwcfDj7DqCI/xpSg7npX4e9?=
 =?us-ascii?Q?Ye1rkdAeSmoeAQwqo+vzzO4uSStmyE5+?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?DR/r3evpounI7+psY1RpyaPhhfxgKpkjI1zjhyYntn7Qy6xpJq8t1BltEKKN?=
 =?us-ascii?Q?Ro5c4PfYulZskw/B+M4XbGXM1fuG4A4aEKIa7rip3c8l/JzRgjFz1LDzf8RV?=
 =?us-ascii?Q?Qz3uPYpPxoq1k52KaBjfm7d8J8sFkEMBY4rzxshCqLXm5gA3OFKdxWO/0ddB?=
 =?us-ascii?Q?WDA8xUhAivKFUJFUitryIiwtx6lwC1CJkqv22JK4mZxB4+jAozVYJNBo0Evf?=
 =?us-ascii?Q?Ln3kiJelGj1c5TgW7clgbyRe5qVorj/FH3uYx2sp1tCkl4q+6hXkpHC6Ga/t?=
 =?us-ascii?Q?XAym+L/8PWzECU0sH0t1p9rJTAmHrXs70a1zSKAKX+XI5Yg7tK2sENEkO/se?=
 =?us-ascii?Q?+xOSNpMQYoMEMfsMoglwSnmYRluU90b1/oj7g1E5mYeuvqpx2XKrFMqw3ETC?=
 =?us-ascii?Q?imrwYKSeFVlodQ6nGy1gbjZncudooKmFHuUWqQSQVBlcY8qlEF9eMNn0sLr9?=
 =?us-ascii?Q?u06JGs+afxls2/fN4IUDlK955/vMbBcNQ6PoYQjFnMRXG/49+8lDsT4tDwLm?=
 =?us-ascii?Q?9U/7FmY+qeMe7khU7U7RIwSbBzR+zdkMIQNsDAW2nYo4C4Fem8/TKSc0+IGk?=
 =?us-ascii?Q?UwBA8LrGZpfMLSw5FW7u03aZ0I2GyelsYSokpnj7xaRBN+CFMFGEKfiTIeRl?=
 =?us-ascii?Q?DlKOTcRxFxAGSklwE3xtRTpJiVbe0HUnVmboM1prNm4Be+OfJU16AcXK6YC/?=
 =?us-ascii?Q?4pxSaL+vLJ2Hh9XUN4OTyOESOkOFb6dhcpVWMZGMDCoxZDU0YEWdQZneBuQ2?=
 =?us-ascii?Q?buysruygtjNne8jx97t7mk6ByGrDJscehjjwR87FaC6vSH7hb0uiN0XRw0ez?=
 =?us-ascii?Q?FunRFC/cjndaFS4VCOo1tnRZqy0z3xZmFKeU+At+zA7CXsMlEywlp0y93Nxv?=
 =?us-ascii?Q?8jhX9aXBFCnvmrRv92968hkfTRt55VBzqQbZSAd3k4BuX6yuIaiwlTHSuDU2?=
 =?us-ascii?Q?TqYXttAViju10UXQyeTkGWV0TFT+L1PLiTKCfssxAj9aNO25B6ejtzYe8o1R?=
 =?us-ascii?Q?Ib8qCCk0QN1lYFa4lRrkK0DXaiqy5EVm9L0UzA/PhclFMdZfnBSgZM48j0/d?=
 =?us-ascii?Q?uTMXrITbRyrR7XJblvnFakYqniAFk44YIfBVNHRzKuZT/BQsEiiLxsqFrr78?=
 =?us-ascii?Q?fuaiYeCvP0aMXDbJ8blKD7J4lQp62NMtgHfq64vhS6Q1q7/I5FwUI7RZ7dBY?=
 =?us-ascii?Q?Yz67GMQXKkZyghX74hJSTy1/zdJS/1PB6q6RjMeE/MIYlHkfX8b5/AkMVOJ2?=
 =?us-ascii?Q?eBBptA/hN3KirwMtTMy2s6H4o/jJbaFDszp8qD7TvMjVqx84w2HLJNWqYkO5?=
 =?us-ascii?Q?p+h9LGhkY6kwgwukAXr1NCPvN2tWY94JYxuti1u3m+1XGbh3+jr6hyM2GsKB?=
 =?us-ascii?Q?en3AHH1y+bksuEBOsSh5M+CW/0q3N1H98aaljKI9HoWZFAHrPp4Oigt7p/S1?=
 =?us-ascii?Q?7ofI6G0/kICo6PbLj6bkQdJECluilvWEGQ7EkHahxkzUdx88WJEo6Qxe4eoJ?=
 =?us-ascii?Q?zfLf6F+OTSLewfVoW3E7EyZ9MTdP8zeOiIEwtTz3XT8dyAHAN2Vocse4z2Cv?=
 =?us-ascii?Q?HDRJw4BmgxLVPWX654YjF8bZto9ocTf4PRW7ejgx?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e0a89cb3-fd14-4994-384a-08de232747d0
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 02:41:15.0746
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 66YybatbODnip71sDNq7tEB2fT2wUCtb0NOx5iLtI3V8lGcKaUASUfZQmO8UwBbGd2S8veAx1Ia9i5YYd8eJVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7986

This allows Architecture to be passed into register!() and bitfield!()
macro calls. That in turn requires a default implementation for
Architecture.

This simplifies transforming BOOT0 (and later, BOOT42) register values
into GPU architectures.

Cc: Danilo Krummrich <dakr@kernel.org>
Cc: Timur Tabi <ttabi@nvidia.com>
Suggested-by: Alexandre Courbot <acourbot@nvidia.com>
Reviewed-by: Joel Fernandes <joelagnelf@nvidia.com>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/gpu.rs | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 8f438188fc03..c1eca052968b 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -122,8 +122,14 @@ fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
 }
 
 /// Enum representation of the GPU generation.
-#[derive(fmt::Debug)]
+///
+/// TODO: remove the `Default` trait implementation, and the `#[default]`
+/// attribute, once the register!() macro (which creates Architecture items) no
+/// longer requires it for read-only fields.
+#[derive(fmt::Debug, Default, Copy, Clone)]
+#[repr(u8)]
 pub(crate) enum Architecture {
+    #[default]
     Turing = 0x16,
     Ampere = 0x17,
     Ada = 0x19,
@@ -142,6 +148,13 @@ fn try_from(value: u8) -> Result<Self> {
     }
 }
 
+impl From<Architecture> for u8 {
+    fn from(value: Architecture) -> Self {
+        // CAST: `Architecture` is `repr(u8)`, so this cast is always lossless.
+        value as u8
+    }
+}
+
 pub(crate) struct Revision {
     pub(crate) major: u8,
     pub(crate) minor: u8,
-- 
2.51.2


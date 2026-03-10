Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013035.outbound.protection.outlook.com [40.107.201.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DD6C36A01F;
	Tue, 10 Mar 2026 08:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773130621; cv=fail; b=RI2UxljaN3EmP7FvO41STq4VdSFwYeMCDAIFm89HuEAm+Ds7YXezAg5bqNXtGCVUWB+t5dNIotI8jvkePiO6ism22WLfdcPg7h/hkNKzzM0A79ic9S//AqYXUMEbmRI8ZWwyzKJFNrlkgeiiHQh4VbW7BnJ9JbyIJdVKYccfvCc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773130621; c=relaxed/simple;
	bh=Ch03aK3PuE97zDo/rDsbSE7zK0p2tDfLuXuQZBshrAw=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=XP5NjAXP3NO6G2IwzoTmVFuibZJ1wfdCdkZTimSuQgSphBJ9rpxvU92k55hhFX6wsInkQDg1rZ8abGqa6RlaqZ+kCcThDBLTMMBYSjFPKHDAwA14cKeFVuSyXTRE8mqtuQc5HxdVPbQ02F2GjLK3I6DWtrCxXbNImHkOSpEm9k0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=BkKXjYIs; arc=fail smtp.client-ip=40.107.201.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="BkKXjYIs"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GurN97h0JSryfE8mZy6SFN+QdFBQ7g+OzSJ5eHF1kr7dE273l+rrsRD1NeG0+oTYJnWl9eNCayQCVP+ZiN5te2Pn9iFo+pgqCziHgOouV41cKx/ugw8tmxG5vy7r/NAO6nRwz1UerIzEjh+RHyIFv18eixn6S7hMdJDZdx7hGoKGG9St/tl80i0z53Yr+5YiDW5lEyR4tCJMBvElTZFq6xwr82Zn8e+ZHdITYYiek4xoroJx6h8ewOE2dJ42jgrI9CGrlEB+lA2eTS1kZrM6jL4G4xyIWYEAUEr+Iw3mugPDCW0I83c+S+AnXE8/Qh7LMoz5pIskJOtVB9ajVgMNOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=38DF3dR/rn5xz5WgdkXVlyjoOfmXuyqzamWhjT3bUYA=;
 b=dnZywwMs+V2MHFx4LY9J1z5weYknh3nnG+X062dLNcwNZh21pwzccOacZDfyEXmqWl1eWdW0EPjvvVP/eeAXpAfYKxT+7i8ADUQHTIs761zaS6Wm8uUNENm/vsQ69+jC/u0oU5Qv4MXzPXZnEXwkIkhPJJ8na8gNO0C76dWUIjaogahq0noau2hsetwIiZVC8C155E52U9rwknBPJBdaPdF5hD1IW2VATTjmt57k/v+V0uehg40M97SPPY9BceSFSkfKEC0kscU3F8tTiquVK9O2mTmgX/dCIKMsKwTeQmdwXEsZEf2CKjfh8LHGpUMJFx5mXAHVqbPtfyycgxD97w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=38DF3dR/rn5xz5WgdkXVlyjoOfmXuyqzamWhjT3bUYA=;
 b=BkKXjYIs3EWnTJOpnK61PjjUOYPXxXpG8535ihO2k/Cfrxt6r3/2/5naTX5o/RhW8J2LMCm3Mev1Z7yVe0dVzRVIUDtlGcqtrO4u4ub4WucB3oOpus2njV21UMu/1rWN5l71Qgawjur9WWGrPAZJmphVT7iXmfXkY1xY0hxLgNnAI777l4gpv2WnkIuy3dv7sqHZfr7m5/+lIQtjYySl57y2xkMnCoBSw+C1GNJOrtMGp37s92JvSfOgFpi1K4IPN6w/AMWlEXmQFiEy4/CtZMjP2KsE4FH2/JeLJ++KUC1feP/ijAOkHSsxFLKg+IFsDa4vaaBzyfTCa3yvohc6xg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by IA1PR12MB7614.namprd12.prod.outlook.com (2603:10b6:208:429::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Tue, 10 Mar
 2026 08:16:56 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%4]) with mapi id 15.20.9700.010; Tue, 10 Mar 2026
 08:16:56 +0000
From: Eliot Courtney <ecourtney@nvidia.com>
Date: Tue, 10 Mar 2026 17:09:17 +0900
Subject: [PATCH v4 3/5] gpu: nova-core: gsp: add reply/no-reply info to
 `CommandToGsp`
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260310-cmdq-locking-v4-3-4e5c4753c408@nvidia.com>
References: <20260310-cmdq-locking-v4-0-4e5c4753c408@nvidia.com>
In-Reply-To: <20260310-cmdq-locking-v4-0-4e5c4753c408@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Alexandre Courbot <acourbot@nvidia.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Benno Lossin <lossin@kernel.org>, 
 Gary Guo <gary@garyguo.net>
Cc: John Hubbard <jhubbard@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 Eliot Courtney <ecourtney@nvidia.com>, Zhi Wang <zhiw@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TY4PR01CA0112.jpnprd01.prod.outlook.com
 (2603:1096:405:378::14) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|IA1PR12MB7614:EE_
X-MS-Office365-Filtering-Correlation-Id: b6a3d1ad-3d58-437f-a4f1-08de7e7d64fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	KiNmOigQvW3rzImecUE+8TgqYuCz9bq16KS8CPxfEpVv3W8T+Azrcym4hrFP6RN0Ielj2pgJJPor3Ekte/ERLkYzLUmdvRKRMTMu3vkgvgPiq9iZEpdwYpFfRn9uoLDjh26rOVdlb4RWOJGR1HXh7QfOUz5s3X6arQmfwXFmuqHDTJGijtKCqwCFsiKtz4HbrB6O126nvPbiQijaxWjg905Dnl5YSaiitTxXLXHpm3QuL/+Ndd7+nRjftzzVraSKMF7FFLa3dFcAE6vIOOwL88XZr3PDpr9T4EtqD+j4wshhMq20NWgOnrNFA5YuhxjMUEuOaYCNsLbWPfn4blsP4gH/z87U2kOJ7e0TsmlYSdfgADDrVBaEoKbkg74wL2GSd9pIxoSDZ1vFFTtNRznKpZrCcn88bvZ/PfmLfmCCciWpwUq0a6usWjvYMPsnHLt8m6DtPBMwATTHuQAGz9AcYULhtAMyJv8b7teC5rrrGoQ0u9US8kfA/cNtRe6KEuTvP+sChdJuzol7jM4cbsz1eiZugDmtYPByFjY22NPTGnKTsCZgkfcpdvnXx6/KECmx1vAcvVFYt9cA7NB2Qv4CwdEjW72ilXrCgrkjBJ1RYzkQDfF6wXMlX0bFgZ5NPdSJe9r328JCSEirafVJ0J8lHkjfNTsXo+biphk3RHDu5cb7VqkOb8qKAlhkHRSMCkJs7c1/CkEJemo/xK28y/sZp6iv0JY514AxZI7bzXD6rzw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR12MB2353.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TG9BZ2Y2ZE93VE1zWngzdG15NEVnRmE0TVhCdG1BcVNQYzN5a3JlUEczbE1O?=
 =?utf-8?B?czY0UjFJbGdPRUVSQVVHWm9xVmdQZGpjUXREbmNyR3RuUHkxcGNiZk5QYnd5?=
 =?utf-8?B?V2VIQ0pVaTlpcnpOaHIrRHFxOTJ1NGp0dHU1dzF1WG5aZUxUaWNGSDRET0U5?=
 =?utf-8?B?RGhjMmV1dnRGdGhlZkhWOTZwMy9KVkhJVXRlNlRJcUlFZXB3U2l5Y3ZTdUdD?=
 =?utf-8?B?S0RUR0Q5ZzYrVWRMTUExQXNXVTE5STlDL0pjV3crU25wbmQrZStwek9lYVBP?=
 =?utf-8?B?d1NjVSsvcVduKzlSSTN3RjYzd0ovVFJuVHVjaE43NUtmM3U5OExob3IzdVVP?=
 =?utf-8?B?ankwSFNMdkRvbHRWMGUzODdRbFFGNGEraTcxMHVvaVE0em9JVlJqc3d0ZXpY?=
 =?utf-8?B?d0J3Ky91MGtwNFVxbXFKQTV0Tm51Z3FRR25VT0hsTmhVeDZlQWFiS0YyMVNv?=
 =?utf-8?B?eldtUndkdEl1RnhCSjIzY2NLd1NMUWkyNTgvR1NUZ21pS1J3SUhOdXNSbEM0?=
 =?utf-8?B?ZG9UZmlLQmFDcko4all6Q1pBTmQvMkpGc3AyRXYyVXh0MFZZYkVxQVZTM3dE?=
 =?utf-8?B?aDhkY1BBM2QyandjQ0pzMTBZSEZHbTJlNW1sQ2FpVjhJaG94OXZlamZPNHp1?=
 =?utf-8?B?NEZhVmpBZmVLbGYwNjRxa2ZuQStidTNKUTd4L1Jwb1d5UGNYRUtrQldIdzJo?=
 =?utf-8?B?YXZEOW1sbVdnOVpibDZ6RUR1WkpYT0NGY2hBRjhIZW0wZE5zSWY3TmlxaTJl?=
 =?utf-8?B?K2pzYkROcG92bGZTaFdPQ2VORk1walZqeER4QVNyd1FwQmprSVlvNGZESVhz?=
 =?utf-8?B?djVJUCtWcXNreSszamtJQnVSNk5zTU9VUDNzL0ZEemJobTE4RDVkRzRqVVlH?=
 =?utf-8?B?d1g3S05tL0IxcXB0NFZHTDc2OXBJcVRiMitQVzB6ZGErT1lhU3AxWXdBdWta?=
 =?utf-8?B?dXFCcGhsZGJwMlpMV2tRL0wrRXBQNGptc3BQcFM1dTZUMkxFVEhUUm9qNzln?=
 =?utf-8?B?QkNnYStUUnBIazZ4N1VDcG5SOTdQOG1NdGVGdUExZ0Z4RW9NcWMxYXhtQzJi?=
 =?utf-8?B?aWRTSXFXSjUxSnh2Sk5aYmhocVZraS92MU5IdmJJWmt6eTZLdG9qVWhqQnl1?=
 =?utf-8?B?T3dGSytRR3hFZEd2UjBQeWxSUUtrWHBXUUtoVFd1MWExOEdoL3JuRFJZTWlz?=
 =?utf-8?B?cm5mc0Q2NzYxVktTVmxXZkRlcmRFWXp2d2RDRFZJZGhkWVgzQnJadTlGMWZU?=
 =?utf-8?B?c0Zia01CTVNaZS91ZzJlK1hKZDBoUmdYQ1ZDbWk2aHh6Kzg1TnN1NklxUW1u?=
 =?utf-8?B?K0l1Z1dhWFdDelNLbXBzNFp6Ukxub0pvTGJHT2xNbXNrNUxYYlljMGlKKzA0?=
 =?utf-8?B?R1lBaTJyUHFhcmoyb1V5MGljMjQrVlplbTVodjJEaVVTb1NOVks0N2Z6TzZy?=
 =?utf-8?B?RkFhSHVSaFJOLzBkNU03YkpudG1QTVN2d2ROZEVqb2JqVTh0Ly80dzZKOFZp?=
 =?utf-8?B?ZW5kVjVmVjEyMXJTdC9odmdkSlZXdjZCUW9EL2VQbFcvRTRDbjFOSmFWcysz?=
 =?utf-8?B?V3BrUWVwTFpjVC9wNStsalVSc2pvY0JURENwOTJhc1o3bUNSaDloNmtCYTRI?=
 =?utf-8?B?d3g0OEpUYllhemFKVVN2ZlhaRVpBSjRmWmE4UHhEM1NwdnJ5U0hpT1diVlhj?=
 =?utf-8?B?OU01TVFURGtjKzlFZzFTODZ0NHdmMi9Bd0NQUWFRL2c0QTB5U3R0UkNmaXlo?=
 =?utf-8?B?alZETW83ZDZBekVCVjlzSUpaTnZBZWdGWStwcWlYU3lDR1hSVEVlUFRmaVpX?=
 =?utf-8?B?ZTgzbStLQjZRU2k1d3BWKzNvblBhbHQ5aGlMODdFZGZGU3VvdUNtSTNaWGhU?=
 =?utf-8?B?NUlra0lDcmlkNS9TdWt1NHlLcjRJTWdldHRPM2VObWFiZUd0QU5DbC9PQk8r?=
 =?utf-8?B?UlJRcTExOWxycURjV3hiY1BXNnE0QTlWNHBBV3NSbDJ6WmozZHhjUzgrdDFE?=
 =?utf-8?B?V25tY2VKc0k3YzhwbFhXMjhkNjJXcnV2YUwvU2JKcUdYMjNLVkVqSlowdDAr?=
 =?utf-8?B?MVJoSXQ1YXdhQVIyV2dUaUI5N3hzNitwS3lWUy9kck9xTy9mZTcrSTZBdnZw?=
 =?utf-8?B?c3B3OHgrM1R0YUtZbWNlVXNkbmE2eHdWQ0JKL1puTHBvK2JBU200NGdYbzVW?=
 =?utf-8?B?Qzl2cVFxRFgzdU9rTWxOYk1iVU5OR3g4MTNNYUhQR3dzWFJrUUNoNS8wVGdV?=
 =?utf-8?B?bXhmLzBkTXA4ajBTWXF1c0V5YUU3UXpVQWhOa1lrREpHRjIzdU5SaHhUUU5J?=
 =?utf-8?B?Q1hYWEg5ckQySVpiVnpjRjRjcU9OdGpPbmUrT1RPM05vUTBiYmtuaFUrNDZ0?=
 =?utf-8?Q?3eaNQLM67Vw4JIfVy8OhxAZX8BtFfGfYy+OnRQS0P0Jdw?=
X-MS-Exchange-AntiSpam-MessageData-1: Hx7fcMKOvjzUvQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6a3d1ad-3d58-437f-a4f1-08de7e7d64fd
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 08:16:56.4622
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QaBuhg0ZHMX+WFYcUrO5MjMfkKBWXr6ob+ITsYCXBz/5rA1zXFZzCUGFNB/4qZDFoyC78ls+taKkGgeCKzRapw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7614

Add type infrastructure to know what reply is expected from each
`CommandToGsp`. Uses a marker type `NoReply` which does not implement
`MessageFromGsp` to mark commands which don't expect a response.

Update `send_command` to wait for a reply and add `send_command_no_wait`
which sends a command that has no reply, without blocking.

This prepares for adding locking to the queue.

Tested-by: Zhi Wang <zhiw@nvidia.com>
Reviewed-by: Gary Guo <gary@garyguo.net>
Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
---
 drivers/gpu/nova-core/gsp/boot.rs              |  5 ++-
 drivers/gpu/nova-core/gsp/cmdq.rs              | 59 ++++++++++++++++++++++++--
 drivers/gpu/nova-core/gsp/cmdq/continuation.rs |  8 +++-
 drivers/gpu/nova-core/gsp/commands.rs          | 16 +++----
 4 files changed, 72 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gsp/boot.rs
index c56029f444cb..991eb5957e3d 100644
--- a/drivers/gpu/nova-core/gsp/boot.rs
+++ b/drivers/gpu/nova-core/gsp/boot.rs
@@ -160,8 +160,9 @@ pub(crate) fn boot(
         dma_write!(wpr_meta[0] = GspFwWprMeta::new(&gsp_fw, &fb_layout))?;
 
         self.cmdq
-            .send_command(bar, commands::SetSystemInfo::new(pdev))?;
-        self.cmdq.send_command(bar, commands::SetRegistry::new())?;
+            .send_command_no_wait(bar, commands::SetSystemInfo::new(pdev))?;
+        self.cmdq
+            .send_command_no_wait(bar, commands::SetRegistry::new())?;
 
         gsp_falcon.reset(bar)?;
         let libos_handle = self.libos.dma_handle();
diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
index 08ac3067f1b5..b631daae5642 100644
--- a/drivers/gpu/nova-core/gsp/cmdq.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq.rs
@@ -51,10 +51,14 @@
     sbuffer::SBufferIter, //
 };
 
+/// Marker type representing the absence of a reply for a command. Commands using this as their
+/// reply type are sent using [`Cmdq::send_command_no_wait`].
+pub(crate) struct NoReply;
+
 /// Trait implemented by types representing a command to send to the GSP.
 ///
-/// The main purpose of this trait is to provide [`Cmdq::send_command`] with the information it
-/// needs to send a given command.
+/// The main purpose of this trait is to provide [`Cmdq`] with the information it needs to send
+/// a given command.
 ///
 /// [`CommandToGsp::init`] in particular is responsible for initializing the command directly
 /// into the space reserved for it in the command queue buffer.
@@ -69,6 +73,10 @@ pub(crate) trait CommandToGsp {
     /// Type generated by [`CommandToGsp::init`], to be written into the command queue buffer.
     type Command: FromBytes + AsBytes;
 
+    /// Type of the reply expected from the GSP, or [`NoReply`] for commands that don't
+    /// have a reply.
+    type Reply;
+
     /// Error type returned by [`CommandToGsp::init`].
     type InitError;
 
@@ -610,7 +618,7 @@ fn send_single_command<M>(&mut self, bar: &Bar0, command: M) -> Result
     ///   written to by its [`CommandToGsp::init_variable_payload`] method.
     ///
     /// Error codes returned by the command initializers are propagated as-is.
-    pub(crate) fn send_command<M>(&mut self, bar: &Bar0, command: M) -> Result
+    fn send_command_internal<M>(&mut self, bar: &Bar0, command: M) -> Result
     where
         M: CommandToGsp,
         Error: From<M::InitError>,
@@ -630,6 +638,51 @@ pub(crate) fn send_command<M>(&mut self, bar: &Bar0, command: M) -> Result
         }
     }
 
+    /// Sends `command` to the GSP and waits for the reply.
+    ///
+    /// # Errors
+    ///
+    /// - `ETIMEDOUT` if space does not become available to send the command, or if the reply is
+    ///   not received within the timeout.
+    /// - `EIO` if the variable payload requested by the command has not been entirely
+    ///   written to by its [`CommandToGsp::init_variable_payload`] method.
+    ///
+    /// Error codes returned by the command and reply initializers are propagated as-is.
+    pub(crate) fn send_command<M>(&mut self, bar: &Bar0, command: M) -> Result<M::Reply>
+    where
+        M: CommandToGsp,
+        M::Reply: MessageFromGsp,
+        Error: From<M::InitError>,
+        Error: From<<M::Reply as MessageFromGsp>::InitError>,
+    {
+        self.send_command_internal(bar, command)?;
+
+        loop {
+            match self.receive_msg::<M::Reply>(Self::RECEIVE_TIMEOUT) {
+                Ok(reply) => break Ok(reply),
+                Err(ERANGE) => continue,
+                Err(e) => break Err(e),
+            }
+        }
+    }
+
+    /// Sends `command` to the GSP without waiting for a reply.
+    ///
+    /// # Errors
+    ///
+    /// - `ETIMEDOUT` if space does not become available within the timeout.
+    /// - `EIO` if the variable payload requested by the command has not been entirely
+    ///   written to by its [`CommandToGsp::init_variable_payload`] method.
+    ///
+    /// Error codes returned by the command initializers are propagated as-is.
+    pub(crate) fn send_command_no_wait<M>(&mut self, bar: &Bar0, command: M) -> Result
+    where
+        M: CommandToGsp<Reply = NoReply>,
+        Error: From<M::InitError>,
+    {
+        self.send_command_internal(bar, command)
+    }
+
     /// Wait for a message to become available on the message queue.
     ///
     /// This works purely at the transport layer and does not interpret or validate the message
diff --git a/drivers/gpu/nova-core/gsp/cmdq/continuation.rs b/drivers/gpu/nova-core/gsp/cmdq/continuation.rs
index 2aa17caac2e0..05e904f18097 100644
--- a/drivers/gpu/nova-core/gsp/cmdq/continuation.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq/continuation.rs
@@ -6,7 +6,10 @@
 
 use kernel::prelude::*;
 
-use super::CommandToGsp;
+use super::{
+    CommandToGsp,
+    NoReply, //
+};
 
 use crate::{
     gsp::fw::{
@@ -63,6 +66,7 @@ fn new(data: &'a [u8]) -> Self {
 impl<'a> CommandToGsp for ContinuationRecord<'a> {
     const FUNCTION: MsgFunction = MsgFunction::ContinuationRecord;
     type Command = ();
+    type Reply = NoReply;
     type InitError = Infallible;
 
     fn init(&self) -> impl Init<Self::Command, Self::InitError> {
@@ -144,6 +148,7 @@ fn new(command: C, payload: KVVec<u8>) -> Self {
 impl<C: CommandToGsp> CommandToGsp for SplitCommand<C> {
     const FUNCTION: MsgFunction = C::FUNCTION;
     type Command = C::Command;
+    type Reply = C::Reply;
     type InitError = C::InitError;
 
     fn init(&self) -> impl Init<Self::Command, Self::InitError> {
@@ -206,6 +211,7 @@ fn new(len: usize) -> Result<Self> {
     impl CommandToGsp for TestPayload {
         const FUNCTION: MsgFunction = MsgFunction::Nop;
         type Command = TestHeader;
+        type Reply = NoReply;
         type InitError = Infallible;
 
         fn init(&self) -> impl Init<Self::Command, Self::InitError> {
diff --git a/drivers/gpu/nova-core/gsp/commands.rs b/drivers/gpu/nova-core/gsp/commands.rs
index 88df117ba575..77054c92fcc2 100644
--- a/drivers/gpu/nova-core/gsp/commands.rs
+++ b/drivers/gpu/nova-core/gsp/commands.rs
@@ -23,7 +23,8 @@
         cmdq::{
             Cmdq,
             CommandToGsp,
-            MessageFromGsp, //
+            MessageFromGsp,
+            NoReply, //
         },
         fw::{
             commands::*,
@@ -48,6 +49,7 @@ pub(crate) fn new(pdev: &'a pci::Device<device::Bound>) -> Self {
 impl<'a> CommandToGsp for SetSystemInfo<'a> {
     const FUNCTION: MsgFunction = MsgFunction::GspSetSystemInfo;
     type Command = GspSetSystemInfo;
+    type Reply = NoReply;
     type InitError = Error;
 
     fn init(&self) -> impl Init<Self::Command, Self::InitError> {
@@ -99,6 +101,7 @@ pub(crate) fn new() -> Self {
 impl CommandToGsp for SetRegistry {
     const FUNCTION: MsgFunction = MsgFunction::SetRegistry;
     type Command = PackedRegistryTable;
+    type Reply = NoReply;
     type InitError = Infallible;
 
     fn init(&self) -> impl Init<Self::Command, Self::InitError> {
@@ -178,6 +181,7 @@ pub(crate) fn wait_gsp_init_done(cmdq: &mut Cmdq) -> Result {
 impl CommandToGsp for GetGspStaticInfo {
     const FUNCTION: MsgFunction = MsgFunction::GetGspStaticInfo;
     type Command = GspStaticConfigInfo;
+    type Reply = GetGspStaticInfoReply;
     type InitError = Infallible;
 
     fn init(&self) -> impl Init<Self::Command, Self::InitError> {
@@ -231,13 +235,5 @@ pub(crate) fn gpu_name(&self) -> core::result::Result<&str, GpuNameError> {
 
 /// Send the [`GetGspInfo`] command and awaits for its reply.
 pub(crate) fn get_gsp_info(cmdq: &mut Cmdq, bar: &Bar0) -> Result<GetGspStaticInfoReply> {
-    cmdq.send_command(bar, GetGspStaticInfo)?;
-
-    loop {
-        match cmdq.receive_msg::<GetGspStaticInfoReply>(Cmdq::RECEIVE_TIMEOUT) {
-            Ok(info) => return Ok(info),
-            Err(ERANGE) => continue,
-            Err(e) => return Err(e),
-        }
-    }
+    cmdq.send_command(bar, GetGspStaticInfo)
 }

-- 
2.53.0


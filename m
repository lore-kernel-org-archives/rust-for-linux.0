Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012046.outbound.protection.outlook.com [40.107.209.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FE8E3451BB;
	Sat, 31 Jan 2026 00:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769821005; cv=fail; b=TL8pKmet73roeB4sVRDAZj0cJiVcsLz8ZQjfvcZdcrWIJJ1lw3pc5/rcIHQztJay433SnTAC71uFxRLNdqN4gnOu719klxYBdWKvzKBLBdsVvVFJGERLW1ApDqVBBjruiI28kojdV4PBsZ4U+HGO4+wP2wx8/e7suwYGHuzXmPo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769821005; c=relaxed/simple;
	bh=1QDwSS3xPcBkbcxWZ5FS7Z3p/48jGbdyydDurgaoPCo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=UKlMRQqgQ5Vwx9ezVdootg2vlULPgKRdgsvVEek4NV1Hw9GGTVg0HxhB+bJFvsL7gLyihNGoiUqkt0dkFpkttkTZDNbnYgScfqpxE4nTQvHfUsI/CXe8OmUgiznNBke7EQeDBcIfpWdjd8nh8nA7gBjfJV6LPondJBKBOgdpp8M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=MRmBD9rm; arc=fail smtp.client-ip=40.107.209.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="MRmBD9rm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qALDfjQsE4AMKphAMjMToz27uf5asCw1wOzj49Lkn7obVjphns8S12KAScCnAacYf88P92UYxz+IzVH1B/13CzIotAY3KRW4wfbNBJ7cKY5/IOaTkYp5nMvDHnWcEdULYLyTDRTv0ox/bFaN6x4935uKrDHu2NaPoj2nnBDkcJ2OB4i5D/ZaD4ad8c0n/Sn5RqqvvogTmqXFGeb9hF88l841rjJblI1xIx+D4ARc5QdsHCBMblFWxWgY9MaFHFXfqicCR6Enyet5yqhdqaJCGDuGjLPOHFovS9Rq1th2I6sNSFJuk8C6a3WqfiTcRJwbW678uX5QZ2vwF8K3LG6d1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oV/G7g8OzklrxJO1p49pERJ1k89vsa4vdEA38MLWgmA=;
 b=nwEZJwpGBH6yQu4/GD9M2YmgFxbhvPtD08iR3CI3y8FLR2sOyjcNd9frgomsoU8krr+HNrH11imwxQN1mEacfce44E334f5L9bigG9Fi1gwBpJvQfyFfSsaqcDQlPg6tplBYthlHXMJhNcIOPKhQX0TFWz+36dr/fXs89/fcUBMNdNWwOxY8iGvSDNvxdRW5PVofm59TGzYBQ1oiX9blLckxWlr0lX7mQH4zpjRrmcREidPOMnemD2eZXtddzh8RxohXhHk9OZICE6Fa5TCW5OfKcLmwQkBpn+bZoVRFm1pXbb6tvWo1AzoDJTsBPwqdTShxiLTEophK5YdUsBcT4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oV/G7g8OzklrxJO1p49pERJ1k89vsa4vdEA38MLWgmA=;
 b=MRmBD9rmQ7d2rDEKHwqXVodMZyeokxIi7T9t5E1v88LF44/Dvex8jN7zQbiXwvmuQYwrb+0Dog9ehPVmEG0TAp3nSLJp4JFkFFAKQvwghDC3apMcGkMXf/I47K06VCGmLNWNcCRCS4fL7oU2Pxye1+65/YG+EXMWuQa+Q5WI6TIzCg/c1eLdFfmJx83Di7nTbq0szpeRN0EOML8YL0I/36VqvVpt84exweBzUMOvNweviwmn2FwoDrvSa5dyZyo/PFwwRp3qxjFLwLuaXd4kfWisV4NyfCkZy+3MHQ2PvZdUJcEh6Q2QgqcsvrLle0qis1QV8yXRK47GqzdNMWSZpg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 BL1PR12MB5945.namprd12.prod.outlook.com (2603:10b6:208:398::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.11; Sat, 31 Jan
 2026 00:56:33 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9564.007; Sat, 31 Jan 2026
 00:56:33 +0000
From: John Hubbard <jhubbard@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Alexandre Courbot <acourbot@nvidia.com>,
	Joel Fernandes <joelagnelf@nvidia.com>,
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
Subject: [PATCH v2 19/30] gpu: nova-core: Hopper/Blackwell: add FSP secure boot completion waiting
Date: Fri, 30 Jan 2026 16:55:53 -0800
Message-ID: <20260131005604.454172-20-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260131005604.454172-1-jhubbard@nvidia.com>
References: <20260131005604.454172-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR05CA0006.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::19) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|BL1PR12MB5945:EE_
X-MS-Office365-Filtering-Correlation-Id: f50fa130-6843-4cf8-9f4b-08de606393bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?jVmkVZU9M8TJyhWYtvBr2KQvsNyeihyk2K5a1/rd0rPn1Dt7RLr5sNhYuCNU?=
 =?us-ascii?Q?Oab9Tkzd5nWqGKR8JV4DKsv/Fepu5j2PW2IODDJBrE8/pq8cd6h2Vq16TdHC?=
 =?us-ascii?Q?q65Hi7mHRnugpp9GaQJjvV0R/uqFWVaiMnTMVbuThLWQXttYy58U4KyaFiJ0?=
 =?us-ascii?Q?Gsbr7pbj0jdkuiPPXcykJp9/qnpiJKqP9UyXUMwzw1IWjlxjdC23PRhw8ki4?=
 =?us-ascii?Q?G4HNisGT+rdQUlRdwQWoFq3AlLXr6mHLK2v+wOJWw2HFDQ+HxZimyTys9oPt?=
 =?us-ascii?Q?R3sYcUj3UUeSQiurgiIWoAgZRnxjggUDK/1HdvW6fas4GgyjlJi5R2r3Z5vJ?=
 =?us-ascii?Q?qDgxluBEGbbiLget5dbzFQgYiEqzgzX/aShDkzqylcvycrAVNPURYw4Ethkg?=
 =?us-ascii?Q?f+kMlrxf8/c5n3l/m7Rw7PRmYolVEonKLesltU1vUp28EOWISx9j/1ywiezi?=
 =?us-ascii?Q?bwpfyuTZHMomAtvQXRVoDedc7Wvt15Bc3OFYUoRC+6aRfB5WgduuhqKDKRlm?=
 =?us-ascii?Q?usDSSQMGuOy48Z/BAVrj1GG7bZAp/jOmKMnyDPmkEib4mVwffGLcBqsHLmVH?=
 =?us-ascii?Q?w/fOKVj+6YFETyNFjKMMQZ/hR5I10l1EO+p5ChJFXrO7QHqtOPmm+38KnR5Z?=
 =?us-ascii?Q?438X3OGqtBEZZoZQqAzpAvYSrKRiNsWB3nISOXF/z5MCeV9CnHBgiGjv0riI?=
 =?us-ascii?Q?0nNiknJCvQA30aZkJfL5tVoNeNIL3Z+KSzfH3szDiUGiolPqfoyob4mAS6iH?=
 =?us-ascii?Q?cnzw4X6lKEYVmsYhOhukA2x6ul89+qs46jQYmQOSW1g3k8W3+44TPeL0aIrj?=
 =?us-ascii?Q?mOWEHeDi6Tjy0hZIKN8X3+dBmJ9jn2gFUGrB96lvcKDonyB+2md7yYUzXRlR?=
 =?us-ascii?Q?I0XXo3EGgRXiPoO22CJfbwdWWL01NU0SB9LZOHn8fnvt1smkjggTq80ZEHGe?=
 =?us-ascii?Q?VfO4zeyQL15eaGFZQp6G0aTIgFqIGkcT1VQueC8G6Y+GL7g8a8DKZw0zY+vT?=
 =?us-ascii?Q?GaTlXZDUNg1y/sAgbfTiFKM5KbQFbAEwXQAch7oOriQ4FUg4O2obRY7PBRMV?=
 =?us-ascii?Q?3ddGWGjQ+L/wOdslY+Oa0mjve6iSaLt0faub85b0rAn7Clsz3vowWJdy8EVV?=
 =?us-ascii?Q?An7XW5z3rM1L5DI7V7LVDDDlk18WOne1R6JQ71bCCoITzK7SFmsWNHpueZcb?=
 =?us-ascii?Q?SztkgKagH6fdpx6QHLjUswl55qvztRDzzGpgy/p3b0h4aEZ+aQ/vF172J4yR?=
 =?us-ascii?Q?t2knU57CDiRhsOrSsJE1I+ZFUfdg1hdE/dHk+xHNoU6gRJkpYhm+SnmEsP8W?=
 =?us-ascii?Q?atnyFdMvJbiNmXOVMP4GFBnxN/KONXgSokNb4uc+PIvkjBIdy+NEVdaDUPVI?=
 =?us-ascii?Q?XNWFgUocSsB1JkpfNbY6mK7j/TL4nANyIqUeI14UzVuZR4S3z6DIT+gZVebc?=
 =?us-ascii?Q?NylXNHgbtI9IWx+DxMu2DcX27Sr9D34BKVsS9bioDZpwRGKibL0bNLt+u+Zg?=
 =?us-ascii?Q?6k3AoSQWZWNrl10IGhDNQOHrQM/QG4PYjPP3TjcqeR8Rxcev3g3Jo7sGajUG?=
 =?us-ascii?Q?DQtY89iCwH1hYUCyEFI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?woPoMa8HEvyXrqBGTYzxa0ZSdalYQbESrLNRxuFqgeCbTDe1vC+Xc59E9xMx?=
 =?us-ascii?Q?yJ60WJYHn4Y4aCGOqX6nO2b9nK84xuur3iKPlzkCFTICjggggF6TlOyAgxtV?=
 =?us-ascii?Q?ClxrCvGbSzY/q1AikP65ofyELGB1x3iEldsbJg9acITyxIpXyjSHrhmUoYlw?=
 =?us-ascii?Q?jG1fJaD9dCKGNmYfFV+YUzTwcuDzJJ+yyDvoADjPDRjKIo6DInFy8vEyg+vI?=
 =?us-ascii?Q?wDSZ1iSMXHhdILnwpRppds8uNmYff8iva+rhwQBmMwg6Tc0u8R7FSEuR9FHO?=
 =?us-ascii?Q?0VoEn2k2p1uEyRt+OR1SdoNtZ0d0czVPP3lHlvdIHpdIyw6095sGX8eA2L+u?=
 =?us-ascii?Q?rI/uOsH1zK6vi7TChixd/ub4a3kAPmyV/BMcho0LYsNgzE4FUnSQOvwv4Ekp?=
 =?us-ascii?Q?MyLs/i1YNZ18B2k2Vat42bch/IfIQrG5poEk8SG1x/4LGl5GURrelrWzLp82?=
 =?us-ascii?Q?qbZYuEsCe13Syp0zvN/S+0yU3lojb1IO0iqe1XPV7qxdD1dtBdLTtKk3kKHX?=
 =?us-ascii?Q?clUzo4mUyz8dQZ7AktOtcnAZXPXVJgpJKp4gNEDzGnxJV96yTCsZA0rgXty1?=
 =?us-ascii?Q?P/k3EAY79nI/azROVo19PaYXisy9zBI5vcSIf/f104HhIfRPSOHSmzvn/lE6?=
 =?us-ascii?Q?6M7X4rn1R5WW1id8PIbSAWr0VFdkjDE3CZj+W6KpJa8T8jNRocqkjJQUWpn1?=
 =?us-ascii?Q?xzDVIVWrK+xlwSCKnEfMlelbuQ+KM2wjfSJ6k3oEORVSvpk1k171goN52tZQ?=
 =?us-ascii?Q?m3W3DpJE4Si0RE5qypyALWBuHsxNG3+4ohA6jPqBVO+IhnhygZ8hw2x2NwuE?=
 =?us-ascii?Q?pHcogQEDrHqTcepQHGPATTdeHGO/ZDaYViK9sETak7x6m2RomXPQaLg4b2nK?=
 =?us-ascii?Q?jt0qLXxWOctCVG5Z6+SKGuDqSVDKCsSCDntLk7yAqxGHiw4DtCz+t7DXCHRN?=
 =?us-ascii?Q?2xB2AEObYs1bgN6YzdIInSsENPJcJJ4dTxzD/G3HGmLeGzIsK6QcLdNj9BTn?=
 =?us-ascii?Q?tv2S5GC+Fa9n8/FnW+rUY+fNGV72G1hvkPPFrssJxUrHXaQTmKwDfHUPqnlg?=
 =?us-ascii?Q?7NClS0JffPP6hYyVixMeBnOWCMGubxSVNI+XFsM3hH11WlDmlqH6LuJWl0Fz?=
 =?us-ascii?Q?XIj2hoqYSlA1XUQxrOO75+fTXTfHMFYdieHX+4cB1MJLurP9AWXppAdMJEQS?=
 =?us-ascii?Q?iUkrNMQ+w1lWHpfpSkquGLGw5zW2JifSWEk0wJCKWjJrT4HMnl1B+n/m2qoV?=
 =?us-ascii?Q?NSxr2GwXCPaHNRiZGf3G2TuD2Ee56Vuutnb0t68eEX0LsOXv7Gbyc7FVKVRC?=
 =?us-ascii?Q?v1UxU/00SyRkf9FOkZZi73pcjLmclgJXZFFXRAqSwLwqh0tMrIgStyehibka?=
 =?us-ascii?Q?luT9X23skl+IQuuq8gAkjZpdKCZBB5w0JIUJUm//BRqXkK/W1+n4KsFk/+UO?=
 =?us-ascii?Q?i64ag2cv01Lkg7ShiA7fm8J7rRK8k92DEhAaNQn/7YpGzwFSG9MwIEp81k/E?=
 =?us-ascii?Q?71wiUjmaqwbVXYR/voWm62dtUcJHfA6daXzkl4Z3BxaOF1ZR4jZu8UCm07TF?=
 =?us-ascii?Q?NhwPSPjKQ+rP7twqOAiTQoNKybMRID1fM69bb18h0LkEQwJncMi8t2hCsn+H?=
 =?us-ascii?Q?EPhOn5pl9c4JHvYNoCqzBdMgp5ElLDlDgoz5021IBSwJ4lHawiqWR5oKKKFB?=
 =?us-ascii?Q?DL/zjPV5SSvcsl160iSMizQU3ujIoSFd8dIuKBXTfJzxNNltUwQxRMygJD4y?=
 =?us-ascii?Q?ap0WmETYZg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f50fa130-6843-4cf8-9f4b-08de606393bb
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2026 00:56:33.1143
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vZ6LX4VG4HMETTz6p1OTAVCfbDW/1emKhgDsQ9mXkb+H0B1g9FaI45s29ooWtJ8Jxnodwq4gBglh6GveT0znFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5945

Add the FSP (Firmware System Processor) module for Hopper/Blackwell GPUs.
These architectures use a simplified firmware boot sequence:

    FMC --> FSP --> GSP, with no SEC2 involvement.

This commit adds the ability to wait for FSP secure boot completion by
polling the I2CS thermal scratch register until FSP signals success.

Cc: Joel Fernandes <joelagnelf@nvidia.com>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/fsp.rs       | 168 +++++++++++++++++++++++++++++
 drivers/gpu/nova-core/nova_core.rs |   1 +
 drivers/gpu/nova-core/regs.rs      |   2 -
 3 files changed, 169 insertions(+), 2 deletions(-)
 create mode 100644 drivers/gpu/nova-core/fsp.rs

diff --git a/drivers/gpu/nova-core/fsp.rs b/drivers/gpu/nova-core/fsp.rs
new file mode 100644
index 000000000000..5476259d224c
--- /dev/null
+++ b/drivers/gpu/nova-core/fsp.rs
@@ -0,0 +1,168 @@
+// SPDX-License-Identifier: GPL-2.0
+
+// TODO: remove this once the code is fully functional
+#![expect(dead_code)]
+
+//! FSP (Firmware System Processor) interface for Hopper/Blackwell GPUs.
+//!
+//! Hopper/Blackwell use a simplified firmware boot sequence: FMC --> FSP --> GSP.
+//! Unlike Turing/Ampere/Ada, there is NO SEC2 (Security Engine 2) usage.
+//! FSP handles secure boot directly using FMC firmware + Chain of Trust.
+
+use kernel::{
+    device,
+    io::poll::read_poll_timeout,
+    prelude::*,
+    time::Delta,
+    transmute::{
+        AsBytes,
+        FromBytes, //
+    },
+};
+
+use crate::regs::FSP_BOOT_COMPLETE_SUCCESS;
+
+/// FSP secure boot completion timeout in milliseconds.
+const FSP_SECURE_BOOT_TIMEOUT_MS: i64 = 4000;
+
+/// MCTP (Management Component Transport Protocol) header values for FSP communication.
+pub(crate) mod mctp {
+    pub(super) const HEADER_SOM: u32 = 1; // Start of Message
+    pub(super) const HEADER_EOM: u32 = 1; // End of Message
+    pub(super) const HEADER_SEID: u32 = 0; // Source Endpoint ID
+    pub(super) const HEADER_SEQ: u32 = 0; // Sequence number
+
+    pub(super) const MSG_TYPE_VENDOR_PCI: u32 = 0x7e;
+    pub(super) const VENDOR_ID_NV: u32 = 0x10de;
+    pub(super) const NVDM_TYPE_COT: u32 = 0x14;
+    pub(super) const NVDM_TYPE_FSP_RESPONSE: u32 = 0x15;
+}
+
+/// GSP FMC boot parameters structure.
+/// This is what FSP expects to receive for booting GSP-RM.
+/// GSP FMC initialization parameters.
+#[repr(C)]
+#[derive(Debug, Clone, Copy, Default)]
+struct GspFmcInitParams {
+    /// CC initialization "registry keys"
+    regkeys: u32,
+}
+
+// SAFETY: GspFmcInitParams is a simple C struct with only primitive types.
+unsafe impl AsBytes for GspFmcInitParams {}
+// SAFETY: All bit patterns are valid for the primitive fields.
+unsafe impl FromBytes for GspFmcInitParams {}
+
+/// GSP ACR (Authenticated Code RAM) boot parameters.
+#[repr(C)]
+#[derive(Debug, Clone, Copy, Default)]
+struct GspAcrBootGspRmParams {
+    /// Physical memory aperture through which gspRmDescPa is accessed
+    target: u32,
+    /// Size in bytes of the GSP-RM descriptor structure
+    gsp_rm_desc_size: u32,
+    /// Physical offset in the target aperture of the GSP-RM descriptor structure
+    gsp_rm_desc_offset: u64,
+    /// Physical offset in FB to set the start of the WPR containing GSP-RM
+    wpr_carveout_offset: u64,
+    /// Size in bytes of the WPR containing GSP-RM
+    wpr_carveout_size: u32,
+    /// Whether to boot GSP-RM or GSP-Proxy through ACR
+    b_is_gsp_rm_boot: u32,
+}
+
+// SAFETY: GspAcrBootGspRmParams is a simple C struct with only primitive types.
+unsafe impl AsBytes for GspAcrBootGspRmParams {}
+// SAFETY: All bit patterns are valid for the primitive fields.
+unsafe impl FromBytes for GspAcrBootGspRmParams {}
+
+/// GSP RM boot parameters.
+#[repr(C)]
+#[derive(Debug, Clone, Copy, Default)]
+struct GspRmParams {
+    /// Physical memory aperture through which bootArgsOffset is accessed
+    target: u32,
+    /// Physical offset in the memory aperture that will be passed to GSP-RM
+    boot_args_offset: u64,
+}
+
+// SAFETY: GspRmParams is a simple C struct with only primitive types.
+unsafe impl AsBytes for GspRmParams {}
+// SAFETY: All bit patterns are valid for the primitive fields.
+unsafe impl FromBytes for GspRmParams {}
+
+/// GSP SPDM (Security Protocol and Data Model) parameters.
+#[repr(C)]
+#[derive(Debug, Clone, Copy, Default)]
+struct GspSpdmParams {
+    /// Physical Memory Aperture through which all addresses are accessed
+    target: u32,
+    /// Physical offset in the memory aperture where SPDM payload buffer is stored
+    payload_buffer_offset: u64,
+    /// Size of the above payload buffer
+    payload_buffer_size: u32,
+}
+
+// SAFETY: GspSpdmParams is a simple C struct with only primitive types.
+unsafe impl AsBytes for GspSpdmParams {}
+// SAFETY: All bit patterns are valid for the primitive fields.
+unsafe impl FromBytes for GspSpdmParams {}
+
+/// Complete GSP FMC boot parameters structure.
+/// This is what FSP expects to receive - NOT a raw libos address!
+#[repr(C)]
+#[derive(Debug, Clone, Copy, Default)]
+pub(crate) struct GspFmcBootParams {
+    init_params: GspFmcInitParams,
+    boot_gsp_rm_params: GspAcrBootGspRmParams,
+    gsp_rm_params: GspRmParams,
+    gsp_spdm_params: GspSpdmParams,
+}
+
+// SAFETY: GspFmcBootParams is composed of C structs with only primitive types.
+unsafe impl AsBytes for GspFmcBootParams {}
+// SAFETY: All bit patterns are valid for the primitive fields.
+unsafe impl FromBytes for GspFmcBootParams {}
+
+/// FSP interface for Hopper/Blackwell GPUs.
+pub(crate) struct Fsp;
+
+impl Fsp {
+    /// Wait for FSP secure boot completion.
+    ///
+    /// Polls the thermal scratch register until FSP signals boot completion
+    /// or timeout occurs.
+    pub(crate) fn wait_secure_boot(
+        dev: &device::Device<device::Bound>,
+        bar: &crate::driver::Bar0,
+        arch: crate::gpu::Architecture,
+    ) -> Result<()> {
+        let timeout = Delta::from_millis(FSP_SECURE_BOOT_TIMEOUT_MS);
+
+        read_poll_timeout(
+            || crate::regs::read_fsp_boot_complete_status(bar, arch),
+            |&status| {
+                dev_dbg!(
+                    dev,
+                    "FSP I2CS scratch register status: {:#x} (expected: {:#x})\n",
+                    status,
+                    FSP_BOOT_COMPLETE_SUCCESS
+                );
+                status == FSP_BOOT_COMPLETE_SUCCESS
+            },
+            Delta::ZERO,
+            timeout,
+        )
+        .map_err(|_| {
+            let final_status =
+                crate::regs::read_fsp_boot_complete_status(bar, arch).unwrap_or(0xDEADBEEF);
+            dev_err!(
+                dev,
+                "FSP secure boot completion timeout - final status: {:#x}\n",
+                final_status
+            );
+            ETIMEDOUT
+        })
+        .map(|_| ())
+    }
+}
diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/nova_core.rs
index c1121e7c64c5..af6f562779d6 100644
--- a/drivers/gpu/nova-core/nova_core.rs
+++ b/drivers/gpu/nova-core/nova_core.rs
@@ -10,6 +10,7 @@
 mod falcon;
 mod fb;
 mod firmware;
+mod fsp;
 mod gfw;
 mod gpu;
 mod gsp;
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index 861dbde5a0ac..cfd9d6f0de07 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -475,11 +475,9 @@ pub(crate) fn fsp_thermal_scratch_reg_addr(arch: Architecture) -> Result<usize>
 }
 
 /// FSP writes this value to indicate successful boot completion.
-#[expect(unused)]
 pub(crate) const FSP_BOOT_COMPLETE_SUCCESS: u32 = 0xff;
 
 // Helper function to read FSP boot completion status from the correct register
-#[expect(unused)]
 pub(crate) fn read_fsp_boot_complete_status(
     bar: &crate::driver::Bar0,
     arch: Architecture,
-- 
2.52.0


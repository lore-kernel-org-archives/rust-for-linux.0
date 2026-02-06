Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013025.outbound.protection.outlook.com [40.93.196.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C814346A1D;
	Fri,  6 Feb 2026 04:22:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770351726; cv=fail; b=oQe3SJkez3cXb5Ico4ay0QDK5NHtqzU1x0AuD9Qd8sCsmR2TokJh1UcMobK7opeB17EuSS+6efRU3qWFMi1Vw50elbjZqkaGgT6ud3QVuiQ1nsdFCzwN032IKG9utUxFckVF8eeXkITXI0NHG0AOzR3yoV1rCILNHUm9a3tYIOU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770351726; c=relaxed/simple;
	bh=NoV2pUiEq4oOk+JeDd3kaTNYhMU0Pymyz0oF5J509lI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gnkCXN49dd6YlUKqy7SjaLK8fWU2WkQWhV+lDFTEwmm5/W+1xCOkZ1sNkWprQxQXEYqbiqdr0d0R/kikvLCkGX5Vj0z9acMfFwH7+UR2owSokpaWSEco4QycqePFSHEwKjl6vzhJhw94PcC1YNSq10mN/lPOqe5YcGDhxoExEOE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Hg6Fa5ej; arc=fail smtp.client-ip=40.93.196.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Hg6Fa5ej"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XX4NZTXXFv1JtkMmmYAOZFfwqyd9UXPMg57atwwS3Xl4vQ5q7wtNUBjPg2a0UTmxZqv6b1sV9VqRn5AJqArRKM4Sz/gkrQwwKMAtvGDIcCABBqE28O3uE2b60SomWSwYetaZ2j2Tot+Sbru9fbq4Of1hYU4jtr4QI1o6SqXLcSgGL0WNdidaCU8CY5mthA6YfpjJmke7xSTPYrBha/1bG51dTF4T5q0Wq1uHiiAjsxnGI5nbeFQEuUmMxXXd3tDKh9VzBx25qSgp4gI9IvnCh3tAehQXGC1NNZKMWo+MVck+tMJxBbOteAxd30svbscI//7sqi5ef/+DO2z+9vcnZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A/yAe4ujIvgPgvcdVGO20nNKPjVG+DOIETCRZGIl9iU=;
 b=lv+hlJnM/rdUW7jlkWv56JLp0Nt8E/SOIZm/zidWs1jivN4vl7ziQyBG6jP0fYnNqQZAjVDz8IUmP3qPChQtE514DfZPHWtNf+k888gFVi17nJN8fkaSHd7GKnLhLmMESI5q91U1EzNsqx4/VkUSXTJYOKN05325XUvO9N74ZgGGJUt//eS+7GzS02zrZZtDb7Ih2xOikFTIisgxZZ5WCnxHoZwHYHB1QzviWzVupBk8yfa4tIDcrBJXwJfLFFFZwtBu6lAXBv0nu4LyuyHQ3tV4br6LjqtiGECJ4QBNIcvOWl6EPJOI10fmVv7BK+G4QUqhbsMcy3pzMHbTY0xnqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A/yAe4ujIvgPgvcdVGO20nNKPjVG+DOIETCRZGIl9iU=;
 b=Hg6Fa5ejZ4hdI3QlD52+UPGe/Tz92bJKLwJ/Cp1DbDnYjAuenkXRz1NP19eYNvl4Ww+mvbcjGELpvld0vRFIK2ZjtVhF6nrgoqDbFsrMozklpxWqYavxoSAYBxi5c9AWZfWK6sDQKWknva1D6Luyn4kN9I31J1OCEn3R3dGoATcvz600TEZrjbHjtViIHE2GIbeTNo7YdoLjiPy0W0wjexlHNRoGYRXXYRieNMNxHJ10oDneP9OgK4pziyZpMcOfe8tBe62uWFkC0xN5PyF6BbxgM+jmVfJdToMq0nUOpOrmzNGQj7V+nyZXZoS4dCIi8rBqxcalOGodSQy8g/0TrA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 IA1PR12MB9468.namprd12.prod.outlook.com (2603:10b6:208:596::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Fri, 6 Feb
 2026 04:22:02 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9587.013; Fri, 6 Feb 2026
 04:22:02 +0000
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
Subject: [PATCH v3 28/30] gpu: nova-core: Hopper/Blackwell: add FSP Chain of Trust boot path
Date: Thu,  5 Feb 2026 20:21:21 -0800
Message-ID: <20260206042123.303281-29-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260206042123.303281-1-jhubbard@nvidia.com>
References: <20260206042123.303281-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0107.namprd03.prod.outlook.com
 (2603:10b6:a03:333::22) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|IA1PR12MB9468:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e6cc8e2-4c2b-458f-f106-08de65374722
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?MBPV9LGXH4SQPSJC8XyZfaJbHdhvM9qyUDAtvdgC+qTc4U+k9MLTkxk2SzNm?=
 =?us-ascii?Q?e1UbfxBwPMYHgebqlwPpMLV+rGJSRXH9gnBaNaA474zZKQmHKvV2LKHsmSry?=
 =?us-ascii?Q?OdVavfMeRNUK4+wL77w5rVhyknfqlYApSt+zeazqYbKi0a+a8Ydc8AZPn/gZ?=
 =?us-ascii?Q?5ZTArlw71+6yA1oaahOjE7el0FUtkBaL5mNqwZJfaG+LIIS40uGfe6Dv71Co?=
 =?us-ascii?Q?QwGWwVkAqr6l6OJU3RYmfnRSpo3LCZpsZy5LcOSy95FvMV5p5vQWaVlCHNNv?=
 =?us-ascii?Q?cefBZ18y5LFb9TrIkv6UVFDsL5esNtir14c2xgyu8wb1c8EwGvoKqevrYzaX?=
 =?us-ascii?Q?IVlykB9xYDd4DDZ/m1G4i1Q5QkS1ZZH5lR8MP/Jv0HlGN9il3XNQeQU8XREd?=
 =?us-ascii?Q?oKAdsUM+cWwCiWKdiquyT8gPLXlEzuWipGkN1zYsgQV6Mpw7U41KFHaDdy33?=
 =?us-ascii?Q?wI2yzC2AexpImN9XUT4YvcWBoQtA1L/ZkWAdfITdzpitBuE2RDLQI2Kik5IT?=
 =?us-ascii?Q?IhFwVPs9R4ZCGFyCJVtgicglFL82piUR7rY6pQWLKmVqCdgZX3kkPm4B7xgR?=
 =?us-ascii?Q?dUH+JP5ODyGH0HBZJOG12KO6CTYGrMII8OmnveMCfYTGJ2u5fQMDuXy7iVI/?=
 =?us-ascii?Q?lLYZ6/eBbLCWQfpHemD7ZMB/Mld/qdug86qaX3zWcKWMOo4zufzPu47r228+?=
 =?us-ascii?Q?K6XxnmhiP1UT4w0r+MpmtLqqa+M4omxiH0Zo4yQM7afxWmvu/7IilM+bk8Ne?=
 =?us-ascii?Q?+G6oWOz57VKmIvmPt5SIQC4lwLMQNMXyu2PZG05BC6ZvMEeM1RS3kxKpb7XK?=
 =?us-ascii?Q?sb6nukvq6yqNZBdhwwnFBVZH/KAmPyiuADpwEkQ+IboMHLdZrgNzPw5H8plN?=
 =?us-ascii?Q?8cRosYWvMNdCiHIBt6J19tJ+CK7IDOinhaSaOJJ6fgcF1VkdBrLASWUZv2sO?=
 =?us-ascii?Q?HrZNkDpMURWP4PC4RkvFeFypJlx9OaEDIE0HdUVSc1asfJNyNCSnV4af78+5?=
 =?us-ascii?Q?iK+2wZ70BbuCbDJLNAeScUwJKadMAMXM/pAWpgaw3Ym8BqCMteAmvzq0d+/l?=
 =?us-ascii?Q?2m7DaykvYQN/Zs78AuYvUWXE52DdWeg+ChYEpvJUdWOl6iUvIaYgkrIQq8yW?=
 =?us-ascii?Q?AtW53mMpM9ru+9CXcFc09sJsZ+SnycBekN17AcEtxDF4SRKZHeM6otbc2/Ws?=
 =?us-ascii?Q?bbNR+zH61bkThTMilzrUMdqnL1ISA/MENBf7km/NTvC3ACi1xE70kHZAfvGA?=
 =?us-ascii?Q?u66Mq/j/0sk39K18slkyD2O1szZt5BsB5MmbLppJbvUcGQUWrSemMuGF3wyE?=
 =?us-ascii?Q?6Jh9YMZFVJIdGcq9a7o9dX2Qk2eCMcRzsIQxRkq1umh8H7zO65zyaA27wU76?=
 =?us-ascii?Q?0NBIIJY4x6vRgV0JJJcZAEsfzBk3PS8Z/p3ODwzQbJ+pfKlgRLZey3M6mNFo?=
 =?us-ascii?Q?PXpamkpg/jkfgPDR0/vRBhOn2bxitYGdj0rN7ZbadLT0XxNXpjQXkSlFjJZt?=
 =?us-ascii?Q?n6+iKGdFRAjCGwdEH9YJulPChELMUnLKd8wavBEdm9xBcg3tJWHkuHctUxnt?=
 =?us-ascii?Q?Ng+ak1RJTFIGvKV9uIY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?a8tG/OygKgZOtejI8s4x6i5QWLQemJf4jgtSIbLfm49msT3u/tR2Io/CCA4A?=
 =?us-ascii?Q?kKe0DE5Ng7icZMM+Q1WwL0nkqnaeqtFX7rkzYSD7eJk+AbFUKMinO4DjIcPu?=
 =?us-ascii?Q?9UBCl6fzE5eeQM+925YvJlj/AVvcSWr3DjTXN3aksld6JCyamIQ8MMXTo4zX?=
 =?us-ascii?Q?L+4h6skzLZhPxoT4okej5KnAorjWkkSTE0JwKpCQ+HEOlVGdTQdsojhTT5l9?=
 =?us-ascii?Q?Vij835TzVINBEqzPTy8IdCgjbAHgclPIuy51ZPXJ3YF6+WroGkzHs8Qaj+EX?=
 =?us-ascii?Q?/naOT29Ci6nEegsGHfg8vspbHmSquvbDp37XfWuDEYiVX69QhQXIEbMTtCp2?=
 =?us-ascii?Q?kHvcTiSIHCQGoct/0xuT9ey53c1ZJfROOjqUhfuuM54EpczLKjjech4rYBZa?=
 =?us-ascii?Q?ouPHCx+L01QAZLdjl3+GSwI6swpXkcFhgq8dZneOafDSO1JCm3HpnZgtj7Zh?=
 =?us-ascii?Q?AtI1dXwnc54k11+8mxSnKAfET3P4dOk17LcwsdorGHMOuBP7znhhMu5b92sN?=
 =?us-ascii?Q?7DdTiUgFTjIhaDpNakLI8zH17lsnsr3sCko1OW6/kz5p5TPyKhmZQQKJYyUl?=
 =?us-ascii?Q?KbJ6zToUGuO83eNWrDNxxejawkgvIRu/nErxkT94zEOg+L3Qk+I1+lfUDdoN?=
 =?us-ascii?Q?6GY8UCzzU7c76bCUzu3TptJA/jtOBZewE3ijOb2IG1hsAChBU8pwhShiWkmW?=
 =?us-ascii?Q?yiTaTC/bqMqQVpIg3H0ukc4TkNVjt/5jQrQBFzcGoGYGjaycTJLqsKt+IYxn?=
 =?us-ascii?Q?vBJa7nLVv/R5VT+MLKeSugUsIjAhJOLhcaHOtg1UZVEWKJdd+mP7AG0KGaTm?=
 =?us-ascii?Q?AX/bjfe4HSn0IESTnaE9x49ISEe6GFA8bolxQIdNxfNSYmwS34NV/2PytTMV?=
 =?us-ascii?Q?T2Ji+jNQlFWb1KrrKeJ6YrTbebIOSsYhTYv60Pu/CESCCo5lIuVnmeZmwgeX?=
 =?us-ascii?Q?OuszbsxBg5XAj2N/waEC0a4mmm82+UZhCn4x+cAUnQd4tn7bI/uLmp6jLutP?=
 =?us-ascii?Q?W84xBoyr5TeNDpTJtpXB5Y7lSviPuWGrh/ZTvNUZsa+pwhbLNQ/S+SfD/9ee?=
 =?us-ascii?Q?yvo+iC86stG+aNZiHdcRSF5SQV0UHjLuPYxXCDkCmkiEr0Yo4HP5YR0h8J/F?=
 =?us-ascii?Q?VRVkYJ9pnkSZRgmIObD5+NW8bsv8nqYpgF/MjmbIoRCY4+U1CzrIHWMsve3W?=
 =?us-ascii?Q?F/U44Tg7Abtj0MRG6WDi1NbcWNUxP0FHXdsf/O37iJuBnPQSPjVw4qgtZmZW?=
 =?us-ascii?Q?Brvey3lolg2NbVrXN8YPU9c/LBPbPOUZocLPT/3nuboH/o22dviIl/IbAkz/?=
 =?us-ascii?Q?W07M86f5AYs+MUPFNp5b8CdgojMcSuJzFg4NKW8duAw8EYBIWSo36ytHoORB?=
 =?us-ascii?Q?p0yAcNEtJYa7o/ZxVw2mjAplzHSNHY9wHCa+HRp6ukk8YefXWea2HMs2BUd6?=
 =?us-ascii?Q?dW5prJGVAy3f08w8aHJQReR1zWWs2s3SOeAuqYL3e5kz5LeDDRnLtTdx/Pb+?=
 =?us-ascii?Q?31L1XBNq3i3mkx5JpduGVeXvPyEQZxFIlCBkW/VgjIx4BY43JZqiFCCsVugJ?=
 =?us-ascii?Q?55f/LycRfPJX9w0S5NxWaNHqeM6znFNpmkNJ9Y2VZxsSawMAbSV1Q9zyDvkx?=
 =?us-ascii?Q?nBXEavuXBGfZzSh6JsKepxvyRfcA4WyJb4b6FR6hcg2L1v2igZ/7GEDW+CqL?=
 =?us-ascii?Q?ghHJuNNak++vnnIbe1d3wmQ2XOwXTu4t/cxy49DGJbw5x5xexwKIIBej6SL7?=
 =?us-ascii?Q?HZ5pyQ8OVw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e6cc8e2-4c2b-458f-f106-08de65374722
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 04:22:02.5893
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tVfNrqSYwkuluk/tgvRYtdk+JdRlZraTUxGp33VcIeOc1+z5EGwDU4BTZ71Ve1UIWzUOUPvr4QEdvoblS6vYPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB9468

Add the FSP-based boot path for Hopper and Blackwell GPUs. Unlike
Turing/Ampere/Ada which use SEC2 to load the booter firmware, Hopper
and Blackwell use FSP (Firmware System Processor) with FMC firmware
to establish a Chain of Trust and boot GSP directly.

The boot() function now dispatches to either run_booter() (SEC2 path)
or run_fsp() (FSP path) based on the GPU architecture. The cmdq
commands are moved to after GSP boot, and the GSP sequencer is only
run for SEC2-based architectures.

Cc: Gary Guo <gary@garyguo.net>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/fb.rs           |   1 -
 drivers/gpu/nova-core/firmware/fsp.rs |   2 -
 drivers/gpu/nova-core/fsp.rs          |   6 +-
 drivers/gpu/nova-core/gsp/boot.rs     | 158 ++++++++++++++++++++------
 4 files changed, 123 insertions(+), 44 deletions(-)

diff --git a/drivers/gpu/nova-core/fb.rs b/drivers/gpu/nova-core/fb.rs
index 7c502f15622c..a860f43ec5af 100644
--- a/drivers/gpu/nova-core/fb.rs
+++ b/drivers/gpu/nova-core/fb.rs
@@ -180,7 +180,6 @@ pub(crate) struct FbLayout {
     pub(crate) heap: FbRange,
     pub(crate) vf_partition_count: u8,
     /// Total reserved size (heap + PMU reserved), aligned to 2MB.
-    #[expect(unused)]
     pub(crate) total_reserved_size: u32,
 }
 
diff --git a/drivers/gpu/nova-core/firmware/fsp.rs b/drivers/gpu/nova-core/firmware/fsp.rs
index edcc173c2fa6..e10954aa146a 100644
--- a/drivers/gpu/nova-core/firmware/fsp.rs
+++ b/drivers/gpu/nova-core/firmware/fsp.rs
@@ -14,7 +14,6 @@
     gpu::Chipset, //
 };
 
-#[expect(dead_code)]
 pub(crate) struct FspFirmware {
     /// FMC firmware image data (only the .image section) - submitted to hardware
     pub(crate) fmc_image: DmaObject,
@@ -23,7 +22,6 @@ pub(crate) struct FspFirmware {
 }
 
 impl FspFirmware {
-    #[expect(dead_code)]
     pub(crate) fn new(
         dev: &device::Device<device::Bound>,
         chipset: Chipset,
diff --git a/drivers/gpu/nova-core/fsp.rs b/drivers/gpu/nova-core/fsp.rs
index ecb1235910f3..f46fe900dae1 100644
--- a/drivers/gpu/nova-core/fsp.rs
+++ b/drivers/gpu/nova-core/fsp.rs
@@ -1,8 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0
 
-// TODO: remove this once the code is fully functional
-#![expect(dead_code)]
-
 //! FSP (Firmware System Processor) interface for Hopper/Blackwell GPUs.
 //!
 //! Hopper/Blackwell use a simplified firmware boot sequence: FMC --> FSP --> GSP.
@@ -11,6 +8,7 @@
 
 use kernel::{
     device,
+    dma::CoherentAllocation,
     io::poll::read_poll_timeout,
     prelude::*,
     ptr::{
@@ -371,8 +369,6 @@ pub(crate) fn create_fmc_boot_params(
         wpr_meta_size: u32,
         libos_addr: u64,
     ) -> Result<kernel::dma::CoherentAllocation<GspFmcBootParams>> {
-        use kernel::dma::CoherentAllocation;
-
         const GSP_DMA_TARGET_COHERENT_SYSTEM: u32 = 1;
         const GSP_DMA_TARGET_NONCOHERENT_SYSTEM: u32 = 2;
 
diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gsp/boot.rs
index 178e319d48e1..5284a35dcc2c 100644
--- a/drivers/gpu/nova-core/gsp/boot.rs
+++ b/drivers/gpu/nova-core/gsp/boot.rs
@@ -13,6 +13,7 @@
 use crate::{
     driver::Bar0,
     falcon::{
+        fsp::Fsp as FspEngine,
         gsp::Gsp,
         sec2::Sec2,
         Falcon,
@@ -24,6 +25,7 @@
             BooterFirmware,
             BooterKind, //
         },
+        fsp::FspFirmware,
         fwsec::{
             FwsecCommand,
             FwsecFirmware, //
@@ -31,9 +33,14 @@
         gsp::GspFirmware,
         FIRMWARE_VERSION, //
     },
-    gpu::Chipset,
+    fsp::Fsp,
+    gpu::{
+        Architecture,
+        Chipset, //
+    },
     gsp::{
         commands,
+        fw::LibosMemoryRegionInitArgument,
         sequencer::{
             GspSequencer,
             GspSequencerParams, //
@@ -155,6 +162,55 @@ fn run_booter(
         Ok(())
     }
 
+    fn run_fsp(
+        dev: &device::Device<device::Bound>,
+        bar: &Bar0,
+        chipset: Chipset,
+        gsp_falcon: &Falcon<Gsp>,
+        wpr_meta: &CoherentAllocation<GspFwWprMeta>,
+        libos: &CoherentAllocation<LibosMemoryRegionInitArgument>,
+        fb_layout: &FbLayout,
+    ) -> Result {
+        let fsp_falcon = Falcon::<FspEngine>::new(dev, chipset)?;
+
+        Fsp::wait_secure_boot(dev, bar, chipset.arch())?;
+
+        let fsp_fw = FspFirmware::new(dev, chipset, FIRMWARE_VERSION)?;
+
+        // fmc_full is a KVec<u8> for CPU-side signature extraction only.
+        // A separate buffer, fsp_fw.fmc_image, is what gets submitted to the hardware.
+        let signatures = Fsp::extract_fmc_signatures_static(dev, &fsp_fw.fmc_full)?;
+
+        // Create FMC boot parameters
+        let fmc_boot_params = Fsp::create_fmc_boot_params(
+            dev,
+            wpr_meta.dma_handle(),
+            core::mem::size_of::<GspFwWprMeta>() as u32,
+            libos.dma_handle(),
+        )?;
+
+        // Execute FSP Chain of Trust
+        // NOTE: FSP Chain of Trust handles GSP boot internally - we do NOT reset or boot GSP
+        Fsp::boot_gsp_fmc_with_signatures(
+            dev,
+            bar,
+            chipset,
+            &fsp_fw.fmc_image,
+            &fmc_boot_params,
+            u64::from(fb_layout.total_reserved_size),
+            false, // not resuming
+            &fsp_falcon,
+            &signatures,
+        )?;
+
+        // Wait for GSP lockdown to be released
+        let fmc_boot_params_addr = fmc_boot_params.dma_handle();
+        let _mbox0 =
+            Self::wait_for_gsp_lockdown_release(dev, bar, gsp_falcon, fmc_boot_params_addr)?;
+
+        Ok(())
+    }
+
     /// Check if GSP lockdown has been released after FSP Chain of Trust
     fn gsp_lockdown_released(
         dev: &device::Device,
@@ -196,7 +252,6 @@ fn gsp_lockdown_released(
     }
 
     /// Wait for GSP lockdown to be released after FSP Chain of Trust
-    #[expect(dead_code)]
     fn wait_for_gsp_lockdown_release(
         dev: &device::Device,
         bar: &Bar0,
@@ -257,43 +312,63 @@ pub(crate) fn boot(
     ) -> Result {
         let dev = pdev.as_ref();
 
-        let bios = Vbios::new(dev, bar)?;
-
         let gsp_fw = KBox::pin_init(GspFirmware::new(dev, chipset, FIRMWARE_VERSION), GFP_KERNEL)?;
 
         let fb_layout = FbLayout::new(chipset, bar, &gsp_fw)?;
         dev_dbg!(dev, "{:#x?}\n", fb_layout);
 
-        Self::run_fwsec_frts(dev, gsp_falcon, bar, &bios, &fb_layout)?;
+        if matches!(
+            chipset.arch(),
+            Architecture::Turing | Architecture::Ampere | Architecture::Ada
+        ) {
+            let bios = Vbios::new(dev, bar)?;
+            Self::run_fwsec_frts(dev, gsp_falcon, bar, &bios, &fb_layout)?;
+        }
 
         let wpr_meta =
             CoherentAllocation::<GspFwWprMeta>::alloc_coherent(dev, 1, GFP_KERNEL | __GFP_ZERO)?;
         dma_write!(wpr_meta[0] = GspFwWprMeta::new(&gsp_fw, &fb_layout))?;
 
-        self.cmdq
-            .send_command(bar, commands::SetSystemInfo::new(pdev))?;
-        self.cmdq.send_command(bar, commands::SetRegistry::new())?;
+        // For SEC2-based architectures, reset GSP and boot it before SEC2
+        if matches!(
+            chipset.arch(),
+            Architecture::Turing | Architecture::Ampere | Architecture::Ada
+        ) {
+            gsp_falcon.reset(bar)?;
+            let libos_handle = self.libos.dma_handle();
+            let (mbox0, mbox1) = gsp_falcon.boot(
+                bar,
+                Some(libos_handle as u32),
+                Some((libos_handle >> 32) as u32),
+            )?;
+            dev_dbg!(
+                pdev.as_ref(),
+                "GSP MBOX0: {:#x}, MBOX1: {:#x}\n",
+                mbox0,
+                mbox1
+            );
 
-        gsp_falcon.reset(bar)?;
-        let libos_handle = self.libos.dma_handle();
-        let (mbox0, mbox1) = gsp_falcon.boot(
-            bar,
-            Some(libos_handle as u32),
-            Some((libos_handle >> 32) as u32),
-        )?;
-        dev_dbg!(
-            pdev.as_ref(),
-            "GSP MBOX0: {:#x}, MBOX1: {:#x}\n",
-            mbox0,
-            mbox1
-        );
+            dev_dbg!(
+                pdev.as_ref(),
+                "Using SEC2 to load and run the booter_load firmware...\n"
+            );
+        }
 
-        dev_dbg!(
-            pdev.as_ref(),
-            "Using SEC2 to load and run the booter_load firmware...\n"
-        );
+        match chipset.arch() {
+            Architecture::Turing | Architecture::Ampere | Architecture::Ada => {
+                Self::run_booter(dev, bar, chipset, sec2_falcon, &wpr_meta)?
+            }
 
-        Self::run_booter(dev, bar, chipset, sec2_falcon, &wpr_meta)?;
+            Architecture::Hopper | Architecture::Blackwell => Self::run_fsp(
+                dev,
+                bar,
+                chipset,
+                gsp_falcon,
+                &wpr_meta,
+                &self.libos,
+                &fb_layout,
+            )?,
+        }
 
         gsp_falcon.write_os_version(bar, gsp_fw.bootloader.app_version);
 
@@ -311,16 +386,27 @@ pub(crate) fn boot(
             gsp_falcon.is_riscv_active(bar),
         );
 
-        // Create and run the GSP sequencer.
-        let seq_params = GspSequencerParams {
-            bootloader_app_version: gsp_fw.bootloader.app_version,
-            libos_dma_handle: libos_handle,
-            gsp_falcon,
-            sec2_falcon,
-            dev: pdev.as_ref().into(),
-            bar,
-        };
-        GspSequencer::run(&mut self.cmdq, seq_params)?;
+        // Now that GSP is active, send system info and registry
+        self.cmdq
+            .send_command(bar, commands::SetSystemInfo::new(pdev))?;
+        self.cmdq.send_command(bar, commands::SetRegistry::new())?;
+
+        if matches!(
+            chipset.arch(),
+            Architecture::Turing | Architecture::Ampere | Architecture::Ada
+        ) {
+            let libos_handle = self.libos.dma_handle();
+            // Create and run the GSP sequencer.
+            let seq_params = GspSequencerParams {
+                bootloader_app_version: gsp_fw.bootloader.app_version,
+                libos_dma_handle: libos_handle,
+                gsp_falcon,
+                sec2_falcon,
+                dev: pdev.as_ref().into(),
+                bar,
+            };
+            GspSequencer::run(&mut self.cmdq, seq_params)?;
+        }
 
         // Wait until GSP is fully initialized.
         commands::wait_gsp_init_done(&mut self.cmdq)?;
-- 
2.53.0


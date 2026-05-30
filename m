Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013022.outbound.protection.outlook.com [40.93.201.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27AE7348883;
	Sat, 30 May 2026 03:10:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780110646; cv=fail; b=I30iePodEEKvrTQuEuLiHKDwtwFRuP7h1eMZ0befJJWxNlrcUqo1QyzLxpla25UAy7RwFOXiw5qLWitPjjIwZ3Bvq1u9Iab8brYe9yELEKvr7j+J/74GnjCHbuC0163hfAEpaxjri6XZ4Rqc6mSZWT7Qmms+CxceGKB4u+WOlDE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780110646; c=relaxed/simple;
	bh=9aTn6XYUU7vTgBKrnp3cUAQfmyuUQT786vjiC15hX0A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XYD0CMu8E/oTqpSnqc1DB+qh7etl7UROhr9pNvBlPuLWToX9aOJHjjYr4iLylMd+R2TLdGqqinBogeLno109V5QC2Ca9VMBYA9NMMDr7LGOujKB6RDBwKzZg8irGQXjF+x60Q6UxEfK5asAw5wut4C9g3rsGtRtCatMrg+hvvB8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=G+m/Eaat; arc=fail smtp.client-ip=40.93.201.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="G+m/Eaat"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lenPXrQTryvgkkVvMbHa3GTIz59hEW5RN4NnFlrCy0nvNyIiM9XggfwMrILcacSYuQqEZTgEWMN3mzGameMj88jLj6ebZ6BER+MT6WudmRw2KmGv9EXa5M1Dc3toNciwVjtdsMhvwOAAC/hSzIEQS21dd/2NTmMl1KyGnVcYkLXSm8LulBm80oR2C3GQ/8ZL2UIKcL40nIQ9/2sgGLoh4VIxITkH2i5CdnaUWCEn9Uu2T2xsJ2zuftOP78TX2R1aQTvfHtTGcBia4VKGO8NIztAnX5bP0VNBbECwCIKpJO0YWL7b8f1m03xthYe6VaOW33RLagy64UGvebYZs3V2Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CEVId1HfqvX6wY6Mp3hH5iEInI501ZvgvEpfVfIkeUY=;
 b=s8DHBDBjo96vOUch9Op8boKrEt2I8Atkh0LWDCkRkgMuGmcvh+gDICr5/D8kjIEe4dmEYs4ldSPJ0kDbvMQsP8SKPyTcg5Hp0hbzJlu+TZHMd1d8TbfGmsLqWftu0N6Q8ALitDFIwD3TrkM9nvPhdhT+I5HMNxaEOq6NhmXAbUjho4s7dxDhKD2HDVLpKshrUSZ93s5ygZO0OZecGNgUlMhRsEpaHNSa3VMcVFGqkZfFgpapZjoqKbLp2rQ6MxHmmsQYNIsfIBzVYFdN7QQ1Z4OF8qdh3SE+c7xD7WwVJoJSAKhobK/Nphmj9ztdfZNkaEwu2fFNWy0zhXACztWHRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CEVId1HfqvX6wY6Mp3hH5iEInI501ZvgvEpfVfIkeUY=;
 b=G+m/EaatslV8vIIdaf4e1ufD/QDHP3K3Jye1ilt/3vXix0LWxxRoDnAinAux22Mo9BKUh6i6y2qv04gBJYGPz51YbrYhwL2Hf/23+u19uUG521a+KqpDDRw/wWnHGq3gHHdmF8XnslawjRa87b2Xm/bFHbh3mVo1cJgboFR2ZdKTc51SkcimU9kAikgj1dUQYTZcyJqZlZXxC0qQ0olSany1UPNa8JRZiMoD6Nnqy4N65TvmJIvZU+dLNSTa0zrysba5dQrfYY4Addp9WtZpKF7kmqjUNxcrOamCytVyKbDJZH4KUMto5uZVb1zIR5VFQ77DEjpKZY4gpCCG/RVdTg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 MW4PR12MB6850.namprd12.prod.outlook.com (2603:10b6:303:1ed::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.15; Sat, 30 May
 2026 03:10:24 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.21.0071.014; Sat, 30 May 2026
 03:10:24 +0000
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
Subject: [PATCH v11 22/22] gpu: nova-core: gsp: enable FSP boot path
Date: Fri, 29 May 2026 20:09:53 -0700
Message-ID: <20260530030953.740561-23-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260530030953.740561-1-jhubbard@nvidia.com>
References: <20260530030953.740561-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR05CA0021.namprd05.prod.outlook.com
 (2603:10b6:a03:254::26) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|MW4PR12MB6850:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ddf5aa8-ecfb-4d03-f04b-08debdf8fe0f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|1800799024|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	z+FRx3NSL8DDLSTt/F/vh7Lsv19rg+zrdUOQo6kEq7X3QtcfYQDjt+7bO6g735kBzuJisAiE8xioQByvHv4xRd/uG6pqTq157qa5M8ezKvXX2H6UP/NX1hrJDjGJJs+QfY2YkeY1L3iCIrXaD+6SvHDRCmj/NNJxggd2X63aHAWIbcvBPwAlXaPVeKwnJpF3ZtVNznXJYbRH/7Opic/IssHSJockGHR426MXKcWOxiypJJQC260XvMZZD/J31g1FrTccCsq4qdmJlrCkZH5F4t9o2OOfrIyjaTyDKmgFMOZ/Twl61yNN/Zn6IINABn1qypq/2UbUZIFO+SfHkNwwKddFDcW5inH+UYnxyCWnKSnXqa4w6RhNcXhkFSwM+ocO8qA0tArxtU/FW5etqUCVxnpimZZnmxco62e8Wf8MTdTasFwqRcqlrl0GwXE8ZTAARhv6J51uFLlyOMXq/Bau9E9UoNf2SbQmkj9d8o2xGwZkmhWcoAbsfC2CuHcmhRPTdu0covkrkrB1/sZs7aJXlQtngA4D0Jb9Dh6gQuX5nTR6Wk92Q7ncjM/9tfR5YNXC/h5TZQlbLbwlW5uZ2CW6qV9d+rqbh5pfTVmwj+KVdJhurEyH929cQVHbj3DhAzYAW37GcVezbIJ2enktwKrOq9tnFzOAExTaS3C+dbIBjWSMYJpMQuowr9MUVEfXpmJ5
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?gUp5NKCoKlwhbP4wz2wAFHwjuaB3Bsaywu2Ob1FeoS0mN0z8O8Hf7BVUwEH/?=
 =?us-ascii?Q?S0puBs95QWW98abMdjLwI7BEsCmXTfjIbyXEo89F9q1Fe1BCwz8GKmXfUpkz?=
 =?us-ascii?Q?YpSxr8snUPM9not3ykgfe9g5rp/DJ6WHrA8st8coybxwntnnh1mCG1RDEFME?=
 =?us-ascii?Q?ZhMY6aF9g73T12speo3bFqRGXUNwPdtLOV7qj4EVFrzQIEmtECqEjbYKNEK2?=
 =?us-ascii?Q?6HC7+elSu97uP6O3q7iRKOMwLRl8oB1rJttestfLV0/HBLMmuPkQMxkBMpyg?=
 =?us-ascii?Q?zR5LBcixlhqaGsgLM1rLzOnlxsNwhs7eFPpba/ui4osX1ISn03YAoiK4pDxH?=
 =?us-ascii?Q?IGESHjL6LJ2gmR2i355PrMuudCVDJRcXizjUKZ3n54SZI87U9a1lLJUkKS29?=
 =?us-ascii?Q?KZUoRDWNbxHS5Z/FE+BvknOkTutwqGwP1g/JZHxRT7oIflnGnCOXvDzQcFDt?=
 =?us-ascii?Q?sX93kaDxJytXOn+Nw2dhTLaTFq++QiRZNfm6Hat8B2g75P5zlhMLHUa4zH85?=
 =?us-ascii?Q?C2KyiHggY6wnRIebiTJLvupajTeFwxdkSlJi6UuRamj1YwOZ+ePyAdQ+CcS9?=
 =?us-ascii?Q?pCaA763gnaP1Ec5og3KT4twk8Wh/R5anvhkCA+GCasITlzHUuKgsp9Dl2BuH?=
 =?us-ascii?Q?vV26S/QP4NzFtu8tCFjf0qc+daEP2pxj1mX4SvDNyZRNp59knukM/hzvitcm?=
 =?us-ascii?Q?Maju3mNejyKinbfZ+y567dT8lbzkMRRv6X4TDp6i9Mu1wws1WpsT3sAdszS8?=
 =?us-ascii?Q?Ws4Y2DvayW+zWN65XT7+PQRAcjKz2cnmgyWMfUtBW09Bb7ESO8XBYY8g8GAM?=
 =?us-ascii?Q?hSIil8SMOnQKL7EAaib0GeaaMIrK/RiL/xBN94WTp5wLNSiEFednxv+PZmDV?=
 =?us-ascii?Q?gWcwqLzWxBx4xm39xnnvIDmXCnZ9RPqBnfhEoKVPTZx+EW/Eo4/3gyPLmwkT?=
 =?us-ascii?Q?ayoOkUhj5bAzwJsGLOWYfcXGeBZzDcEU8hTxgz9XautAZiB8QqZPk4S3irMr?=
 =?us-ascii?Q?O5mkfxVuTXQfr8Bcg9ujKC5XE7pRGDzfjXpUfCiXOlAJcI7IIAQImNyBM9/6?=
 =?us-ascii?Q?h4ILm49si6lU1/ivdPgLD5JjmP38bNzvoTMyGxyX+5a+IZUjXiBbWxPOTey4?=
 =?us-ascii?Q?sqBq0dbqAaQCpp2Naw9Ecx/fw4Ap7ZObv1cMKmyGuuoh2nmQcFool1/s5soS?=
 =?us-ascii?Q?4m9Imujlr4uXgeWtTCnAjsKj7xmEsW8f/aAtk6OW8hYI76NFLBpa4wrvCHa8?=
 =?us-ascii?Q?CNtF3H/yEUIx/nRgG6whQn9g3tip3Fu6TnF7o78MJG5hMVmp3YPalbxHkDr7?=
 =?us-ascii?Q?OMVXuK/bFs0AiKq6PjCdSRKg+1yinicXYD4AQ2wN+qv06IaVoKi5YBpgu362?=
 =?us-ascii?Q?i0yVFG2vUj6UJ/uuLE5hPpAjMDZLilPgaVjd5/OaxB9uLH+m9GePupqOcd2g?=
 =?us-ascii?Q?VVCI18+4pFcF8j+Ym7L4rt3BIngNBwIN0o8pYlPfcz2gfQAv4cy//W3Cp1hW?=
 =?us-ascii?Q?luqGPXdhwosUnV8bdK0lw57rgjgpwzi4ulfMQUs7/ho1Pg+/1qQCI2RrmbWV?=
 =?us-ascii?Q?9hwZFYocV35QiCD0Ptgz+mUtkqmnq7vhpfvYAsYVLX286R8ypAjE/iVDjyP9?=
 =?us-ascii?Q?JGJRr5f3uV7LlPv3ThXzQud4sFAVD7AB7QVNdH0ixxHSbGLksJ2XIBa8D6yH?=
 =?us-ascii?Q?A+0NqQNKZshZTjomf++M5JEJNNYUSC0pJf+Pu/XfvxXuc+X/dhQlIfyjzuDv?=
 =?us-ascii?Q?TWMpmxB5cA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ddf5aa8-ecfb-4d03-f04b-08debdf8fe0f
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2026 03:10:24.6564
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jdj6JhRxtN1wccC3MRpE6fnur+psD0hOEecN51exOqkflbbqQtQfvyK4Lr1c1E9oaRXRHiNPSOzog5wArgcSrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6850

From: Alexandre Courbot <acourbot@nvidia.com>

Now that all the elements are in place, enable the FSP boot path so
Hopper and Blackwell can boot.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/gsp/hal/gh100.rs | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/hal/gh100.rs b/drivers/gpu/nova-core/gsp/hal/gh100.rs
index 0076ca00a771..c5434d59db0d 100644
--- a/drivers/gpu/nova-core/gsp/hal/gh100.rs
+++ b/drivers/gpu/nova-core/gsp/hal/gh100.rs
@@ -168,7 +168,7 @@ fn boot<'a>(
         );
 
         // Wrap the unload bundle into a drop guard so it is automatically run upon failure.
-        let _unload_guard =
+        let unload_guard =
             BootUnloadGuard::new(gsp, dev, bar, gsp_falcon, sec2_falcon, Some(unload_bundle));
 
         Fsp::wait_secure_boot(dev, bar, chipset)?;
@@ -187,7 +187,7 @@ fn boot<'a>(
         let fmc_boot_params_addr = args.boot_params_dma_handle();
         wait_for_gsp_lockdown_release(dev, bar, gsp_falcon, fmc_boot_params_addr)?;
 
-        Err(ENOTSUPP)
+        Ok(unload_guard)
     }
 }
 
-- 
2.54.0


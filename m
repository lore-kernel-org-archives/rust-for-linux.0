Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013009.outbound.protection.outlook.com [40.107.201.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A5E6256D;
	Wed, 11 Feb 2026 00:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770768302; cv=fail; b=YPJF4TCF5oLu3e22lKSCD1IipkdgZWv2qzVLNBO2F39mnNtelItLi5HUQHwnu9MKf1lOtGUkDr6yFdyrhqREmec0nnPfez7ldMWqgkghOtdSLhVc/4ZDpQbS1bsuPJUGzMQ3/MeOq4RWg2JkpwEtzqcqRYYgQDop/0O4TLdtzHA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770768302; c=relaxed/simple;
	bh=bsS54I+Mf7dQ1hjW1dHFBqcWqQVjVXdE0NyNwHVskns=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=YM9+z0Py1Ek40BCz4+dFQu0lq11gsaHvL5bkiViTGw4WYnZP26v5g/RDVZhFoNREiFXnXEL+CZ4ykAHoH6Os/fXgRj6tpm36C+AVkedlT6rJSXo0b3gqZ4ABTIYZKur9IEsWOZ16M68dH/OmW6cRD81ZwkmYOtzPCuk8Gv059N8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=eiSukl/b; arc=fail smtp.client-ip=40.107.201.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="eiSukl/b"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nATAYvb6afd26dxXAtpo7p+cGsUMbQvmOpOjy/LH1EnK9dVrZtAqKbqLsK+4eBUPm5S/w0IBEwHnzXYSl2UY2tmXAJIz6kcM7SqiOIxZzIKYN8/imrW1eSgAhGSZyRls0uCDKNi+OJ2MysA6bKvTxRdWRexywtHvO85vmv0fSP1km80pUfisO5kzt5iVoLwkko5UIAopO9QFN4I+gwkEyFWku0ziFccoOXuMU0wAfpQXu1S+AKCejahU4RwgogI35UOhKrpxLQEAxGtG7S5sRzdMRJc659Q33PrzhrppDYzC440JpniQqOi3tOK/XF5RbRqTwPpUhW3Mylh11e2O0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XuPCskS/mygGQcFRM7HnDO8xOT+zRpsH39DqMLkDjIY=;
 b=p9IF3jw4+jLgjOHWk453luMBLD2EYTyWDYAnuSFSzVuTWSvd6LrCyCEW24kp1c2oWe1MkoEiOfK1eIz8uPstrbLQIwzfVARBH4L67Ona0fmI1W5RoYYV6+7aeqbWBGazEjDor0sZ0E24QcQmHSU0Ew1Uu6MsVQBT8K6FUNXgaKsArxqsYp/YCM10WbYQ1Gx1m++DiNzKduZLbWEOsSp46y0/FReojAJuC0sjocANQHVAGJ1yqezAid2P8W2Sx50OX49WhvIPgQ17Ji3ZJ3ICXogHJDAhdUnTT0nQ8HguLCFkYSxbrO7szYBHCvBBJlfKyR2SrTI7yT91PZwGh26VKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XuPCskS/mygGQcFRM7HnDO8xOT+zRpsH39DqMLkDjIY=;
 b=eiSukl/b7kRYeXS578RAsLidN0wdHtwbymxiFrmvgFBD93PAeX5IYZi672TZQXjkNIJskjS2vNYSSbvV57I3R83kT7Rf+daPegLCaSF+56KUUosX5E3eg1GVbW6UlFoJLMkGHg5e9qOc50ULyEOLy+HEnYeNb7JKdbij8BpL0kWUw6/ZDpsBvROWq1gG9cqrmeFfKPaaRNyjKdHXkK/5Sv2imXwG9ZpalDoMQ93SCvpUbty3Ug95szz8097mac0L6ZCa2EgI6T/A6VI3iyp6YT6es7VvCJWRKLJw1OAGMMnSeoysv9OBqcI9LydzHV6CWZd3dEYHNKyJvCc4g6DHxA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 IA1PR12MB8588.namprd12.prod.outlook.com (2603:10b6:208:44f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Wed, 11 Feb
 2026 00:04:55 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9611.006; Wed, 11 Feb 2026
 00:04:55 +0000
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
	John Hubbard <jhubbard@nvidia.com>,
	Maneet Singh <mmaneetsingh@nvidia.com>
Subject: [PATCH 1/2] gpu: nova-core: fix GSP RPC send sequence numbers to match Open RM
Date: Tue, 10 Feb 2026 16:04:50 -0800
Message-ID: <20260211000451.192109-2-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260211000451.192109-1-jhubbard@nvidia.com>
References: <20260211000451.192109-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR03CA0012.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::17) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|IA1PR12MB8588:EE_
X-MS-Office365-Filtering-Correlation-Id: b95906d9-0388-45ac-e7c1-08de69012f74
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?V1IcN51/K0x6FYbAtMZ9dvYt+blNed9Itw9xvm/el8dVbtOu8BrupLRXX5Qh?=
 =?us-ascii?Q?Cxitt5e4YePFXKTM11fydydqMUCDE7TKxicgtlQamNRNiQVA+m4r0PeJBgWa?=
 =?us-ascii?Q?MLayT5Xr927NLaqdfdmz/YpUPabrCc2XM4apeKUSRCZ5R9J/G7I7RdkZF0Fj?=
 =?us-ascii?Q?D3dh7oDqyF06yRs/7PmchfsWOHXfs4iT+T76T8giHeVkS2Y61G8sTR826ErT?=
 =?us-ascii?Q?/SYQZyTJWigQXfJSK/tv+DBHbE6Bvu6uLNrWXeIQfENn8llOZhBHlSQNZtL1?=
 =?us-ascii?Q?irMnd7FjLuBm3MYWRPb0PHkn0X4MRivqP6zpnQdNmKlJQXOWAmEsKcUfHNKm?=
 =?us-ascii?Q?zTJWWG98+w/UljfnrWEsbYxWkt0/TjKSpcYwYmglvyjlP9jneDUv/tcp9U/q?=
 =?us-ascii?Q?+5D+Cej5GgC9hqOSEd0F6I6RuJhRc9pfTS51hkDvtsVER6Nq8vVMbwRcrss0?=
 =?us-ascii?Q?KpDYGpX61kAWwyTL42cp5/Jq2VUXz1IQRPIALskYm+WKIQGCpRQrQyOroxLd?=
 =?us-ascii?Q?u8WMms5vwmrttSO67nffUiMT93jui1GJm0JoGKlrAtKIEvaEhp+HzGWhQ7x5?=
 =?us-ascii?Q?NEwb6gJop/nc0IOjZhzBwVTq4qA+lvRevBFMYV0plL9HPgUuyRWBqjeDH3+Q?=
 =?us-ascii?Q?YlwpNI9tBIKHCjpUc/nTPSsCQvidxY1UMWwqPhle0DK291USemfkGT28WbZL?=
 =?us-ascii?Q?1aQz4Qjd01WPCN4W966V+ECF7Q0d0r06LNTEUvuNQWazgZlPIjNvfiB4NhQ5?=
 =?us-ascii?Q?Fpufo1ybGHnKPtnPR4TPOkQ48fFwJof4sBIJp7cfvBBE8eLHWdOI/Zp3idlV?=
 =?us-ascii?Q?PTwK/u8Ffca1pvGxhPqdBOnx4FsQCZbpOAOQL/ZkbjiaCDe7vQuvyb4HXbtC?=
 =?us-ascii?Q?3F+7rBmZ3Wli10e9orPCCJ1x025JRJiOZ/txqzr6DbJYVUk32CVOsteI1foh?=
 =?us-ascii?Q?DeRA/+HohxO90YsuY8q5fe5ZE9SiZCM1ec7NmP+4xZptu7UljTMIC+yJ/EFr?=
 =?us-ascii?Q?0M966EeNcRo5dPZfhZeD+MIDsrUXEB5pCbDqzoskgi0V+/Irbgn23s2EoeE3?=
 =?us-ascii?Q?g6wVfbivuTvxA0dhXtGdGYXC36eKrsazss4SRHttdT+3ndSfUDoGyySOeqyA?=
 =?us-ascii?Q?mtAgw7Vw9BPKwAlJdStQpIXxFse/UsDm1yxT32bGUt3rTSPavydNz8OWj8iC?=
 =?us-ascii?Q?M4h0yS/I/do4up6UlPrl1DqvVfCgRLRWb25N7ylb7l0FVBZyHsqOfDCV2UCb?=
 =?us-ascii?Q?aUZFCnXFDKZuMkrl8PnaRANlQxY6wnm+njeaDkOqJXWgvCsJtu/HSqODyYJh?=
 =?us-ascii?Q?ya/OUyHncbjzkynGCHocXQi+MrtGOouhk+aJuWyGNSeEbk6vrJrbPI7oTkDJ?=
 =?us-ascii?Q?PXBgY/rY9qCHUPNTK/DPU4DqiYoIgdVTYQw4rVLgPM74zT9H+7GAikfBXpyz?=
 =?us-ascii?Q?So6jr97ixz6wNwnzuGJOEwnHr37tz5Apew+wsJUAaGURibDOdaTm4Ujf3B1i?=
 =?us-ascii?Q?3mqZpBACKVR4hYHr9ZqOBgsP6L5UB4q+C6REt1z565egtJxg48AiQihwjt3g?=
 =?us-ascii?Q?JmDTPDu7HNK3+UunY3w=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?m9pq3X4jb2AcuYra6zAbMWA8YVUyxtULC2zArjOBp7+q0Df0kpIyGnaAZVWx?=
 =?us-ascii?Q?0QZnd97ES3DdLJ7EoZLBMFpidC64KWqV6lYE/IZwhvKcS1Xe44APnOT9VwBU?=
 =?us-ascii?Q?jf3qWem3RRECWkNW5RpIA98/1UzHYfT9BzPDkBK9sUOAh10jVlZGzkL0nEDs?=
 =?us-ascii?Q?PmWEFe4oicJ2Enk94lX65lzNwIpQSBz/nVdT6iikiKEbkc/opFkKP/vGofG4?=
 =?us-ascii?Q?zanpaVBPM5jpnkcJjdK0kcqkSKRVnWLqKrxyUo7MKNN//LOjDG+UGsbdY/9+?=
 =?us-ascii?Q?AB6REpkbk0T8SwUDZV/lu9BiyUxMpkiJI55MutpeRBfEIgg1l86VZbaPChAb?=
 =?us-ascii?Q?9lENctIIENm/WYUx2UV3KXlRota0dvdbF07nRkvoQ6dNs7s3PYfCC7Pc1ER+?=
 =?us-ascii?Q?1J28cQy57TwQDuGvsxsLXxHpwEAEvT35Y/LXbAMqvYA6BEHBO/Py1bTE7Q0V?=
 =?us-ascii?Q?5NG8e1juyinukoOR+ASgQM2VaJ/xuHv3sPGpuSimpOevxzRzwcWXgeEKlFzd?=
 =?us-ascii?Q?Rveyo5u2cEwIEF4CA5x8NcYubGV4dUw/qCFJutAWIr8buI3INRw8WS4OUFZL?=
 =?us-ascii?Q?n5iVfQPZHsH+EW2EwX0OU8MZXDJDOABWhMdanPPkZxW+2wubSY8iRrDrq+0S?=
 =?us-ascii?Q?0HtOtWM2R1CRfkEqqJKdyOe7YjYZJxJ6lNcZ4IV+lq5l+cUZXaJg9TrjOQnc?=
 =?us-ascii?Q?AT/maHIqXrv14iBf846NXbxrZ+WtKHEL1/9dMuq60+b0aimK7kvnmHSGfVyx?=
 =?us-ascii?Q?tAlRIs0sSPPVDA9EgoDnFSwcZGqyIFMoDVGWTbDl6jkrKOQS9/o31igZHoqT?=
 =?us-ascii?Q?xd7tJC0f64Py8IL21jFE3tAdkPP9vw/Ek0E8az2RpaVrCSIc+eFDqH84TDVo?=
 =?us-ascii?Q?1D09vzpYnSgVbW6tp8+t77bbrHGAeVH7eu0jRNTHdP/hVLjDZb3J+VT1DZMb?=
 =?us-ascii?Q?IGHyzUZSYmr3jnhpEXYFuyUTQq7BSLNh5OsrVHmITpaVBiEgl9U2TAA97ofn?=
 =?us-ascii?Q?QhDZAoH7sVSgt64hsyxrdSsemnRVgynjCJkFoLc7ud1bQXfVf7z71uMvnq/I?=
 =?us-ascii?Q?0IOayX9r8F4zLzSVIReC8x/CxtMUUC2b4XiudLhqj4t51AIQVfL9cHezU/YU?=
 =?us-ascii?Q?0LNA0RRbqx/+Nyf5z3OAIreK1i2dndt2tSNU5dcQ+IZADgQQNLe0MX6CTmwL?=
 =?us-ascii?Q?V28BqzTkUIaKggeV/p1iYccgIDODKECovSdJVwBzF+S3hpEqP1VkZgNUCe2u?=
 =?us-ascii?Q?fzCxuK1k5WS1/JG0qsj9zxFRoWzavg+uWpjk0j0LH9bjiddOCKy6oc62I8Zy?=
 =?us-ascii?Q?IRK28i53dUGP0n+2XUY1M+SgiL9GPAbif3I5AgIPYZWEiGQqEYIvTdmBvLH8?=
 =?us-ascii?Q?GkHp0hQoO1ZzilQlHCakqj2wxZRjKwLmtpDYM8QMMWacPwUrRgg9LYS0cYol?=
 =?us-ascii?Q?AnoJpvZM6SuPp9q7O/DOvnXCDidq01Ab//q8RGx97AVKgN1IfY83SPqEQYlf?=
 =?us-ascii?Q?xk14v+Pn8kHnodF9GZqAFvou0zA6XG21axjruM4S/x9PXEYR6MIX+/F3os2/?=
 =?us-ascii?Q?xFNo7wdnEh2X21MHSD79aA2P3f12yU+5RFqL3txc618oCEk2OZ9y7fIM98cO?=
 =?us-ascii?Q?tGG5vQOGI9Dcn1SIOzOyadTqE8DiSRKeO+g3G0DjIDHUYMM9YIliqZJJO3Lz?=
 =?us-ascii?Q?xbKNDcLcA7QdcAq/jftjcKz++cYXjN/eIvHn7c4/seMtRvjyaCAqZ+pa/9Xi?=
 =?us-ascii?Q?YXLZoCPujw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b95906d9-0388-45ac-e7c1-08de69012f74
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2026 00:04:54.6361
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v1lfI2orTrFX4/2ygTKVRErsLkLPGaAWjmZNeSnriRUBkNCvt6+6BuMYYBeoP3XXVoToR9wsltqBv5z0F5FXOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8588

Nova was setting the outer GSP_MSG_QUEUE_ELEMENT.seqNum to an
incrementing counter for all sends, but leaving the inner
rpc_message_header_v.sequence at zero for all sends. Open RM sets the
inner sequence to the counter for sync (command/response) calls and to
zero for async (fire-and-forget) calls.

Split GspMsgElement::init() into separate transport_seq (outer) and
rpc_seq (inner) parameters. The outer seqNum always increments as a
unique transport-level ID for every message. The inner rpc.sequence is
set to 0 for async commands and to the transport counter for sync
commands, matching Open RM behavior.

Add an IS_ASYNC const to the CommandToGsp trait and set it to true for
SetSystemInfo and SetRegistry, the two fire-and-forget RPCs.

Add MsgFunction::is_event() to classify received messages as
GSP-initiated async events vs command responses. This will be used by
the next commit to improve debug logging.

GSP does not yet include SetSystemInfo and SetRegistry in its sequence
counting, but a future GSP firmware update will fold them in. A comment
is added to note this.

Cc: Maneet Singh <mmaneetsingh@nvidia.com>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/gsp/boot.rs     |  6 ++++-
 drivers/gpu/nova-core/gsp/cmdq.rs     | 17 +++++++++++--
 drivers/gpu/nova-core/gsp/commands.rs |  2 ++
 drivers/gpu/nova-core/gsp/fw.rs       | 36 +++++++++++++++++++++++----
 4 files changed, 53 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gsp/boot.rs
index 02eec2961b5f..f769e234dae6 100644
--- a/drivers/gpu/nova-core/gsp/boot.rs
+++ b/drivers/gpu/nova-core/gsp/boot.rs
@@ -403,7 +403,11 @@ pub(crate) fn boot(
 
         dev_dbg!(dev, "RISC-V active? {}\n", gsp_falcon.is_riscv_active(bar));
 
-        // Now that GSP is active, send system info and registry
+        // Now that GSP is active, send system info and registry.
+        //
+        // These are async (fire-and-forget) RPCs: no response comes back from GSP.
+        // GSP does not include them in its sequence number counting today, but a
+        // future GSP firmware update will fold them into the normal sequence space.
         self.cmdq
             .send_command(bar, commands::SetSystemInfo::new(pdev, chipset))?;
         self.cmdq.send_command(bar, commands::SetRegistry::new())?;
diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
index 16895f5281b7..7d6d7d81287c 100644
--- a/drivers/gpu/nova-core/gsp/cmdq.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq.rs
@@ -58,6 +58,13 @@ pub(crate) trait CommandToGsp {
     /// Function identifying this command to the GSP.
     const FUNCTION: MsgFunction;
 
+    /// Whether this command is async (fire-and-forget), meaning no response is expected from GSP.
+    ///
+    /// Async commands get inner `rpc.sequence` set to 0. Sync commands get inner `rpc.sequence`
+    /// set to the transport counter, matching Open RM. The outer `seqNum` always increments
+    /// regardless.
+    const IS_ASYNC: bool = false;
+
     /// Type generated by [`CommandToGsp::init`], to be written into the command queue buffer.
     type Command: FromBytes + AsBytes;
 
@@ -439,7 +446,8 @@ struct GspMessage<'a> {
 pub(crate) struct Cmdq {
     /// Device this command queue belongs to.
     dev: ARef<device::Device>,
-    /// Current command sequence number.
+    /// Transport-level sequence number, incremented for every send. Used for the outer
+    /// GSP_MSG_QUEUE_ELEMENT.seqNum. Also used as the inner rpc.sequence for sync commands.
     seq: u32,
     /// Memory area shared with the GSP for communicating commands and messages.
     gsp_mem: DmaGspMem,
@@ -514,8 +522,13 @@ pub(crate) fn send_command<M>(&mut self, bar: &Bar0, command: M) -> Result
         // Extract area for the command itself.
         let (cmd, payload_1) = M::Command::from_bytes_mut_prefix(dst.contents.0).ok_or(EIO)?;
 
+        // The outer seqNum always increments (transport-level, unique per message).
+        // The inner rpc.sequence is 0 for async (fire-and-forget) commands, or the
+        // sync counter for command/response pairs, matching Open RM behavior.
+        let rpc_seq = if M::IS_ASYNC { 0 } else { self.seq };
+
         // Fill the header and command in-place.
-        let msg_element = GspMsgElement::init(self.seq, command_size, M::FUNCTION);
+        let msg_element = GspMsgElement::init(self.seq, rpc_seq, command_size, M::FUNCTION);
         // SAFETY: `msg_header` and `cmd` are valid references, and not touched if the initializer
         // fails.
         unsafe {
diff --git a/drivers/gpu/nova-core/gsp/commands.rs b/drivers/gpu/nova-core/gsp/commands.rs
index e6a9a1fc6296..c8a73bd30051 100644
--- a/drivers/gpu/nova-core/gsp/commands.rs
+++ b/drivers/gpu/nova-core/gsp/commands.rs
@@ -50,6 +50,7 @@ pub(crate) fn new(pdev: &'a pci::Device<device::Bound>, chipset: Chipset) -> Sel
 
 impl<'a> CommandToGsp for SetSystemInfo<'a> {
     const FUNCTION: MsgFunction = MsgFunction::GspSetSystemInfo;
+    const IS_ASYNC: bool = true;
     type Command = GspSetSystemInfo;
     type InitError = Error;
 
@@ -101,6 +102,7 @@ pub(crate) fn new() -> Self {
 
 impl CommandToGsp for SetRegistry {
     const FUNCTION: MsgFunction = MsgFunction::SetRegistry;
+    const IS_ASYNC: bool = true;
     type Command = PackedRegistryTable;
     type InitError = Infallible;
 
diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index 927bcee6a5a5..e417ed58419f 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -260,6 +260,26 @@ pub(crate) enum MsgFunction {
     UcodeLibOsPrint = bindings::NV_VGPU_MSG_EVENT_UCODE_LIBOS_PRINT,
 }
 
+impl MsgFunction {
+    /// Returns true if this is a GSP-initiated async event (NV_VGPU_MSG_EVENT_*), as opposed to
+    /// a command response (NV_VGPU_MSG_FUNCTION_*).
+    #[expect(dead_code)]
+    pub(crate) fn is_event(&self) -> bool {
+        matches!(
+            self,
+            Self::GspInitDone
+                | Self::GspRunCpuSequencer
+                | Self::PostEvent
+                | Self::RcTriggered
+                | Self::MmuFaultQueued
+                | Self::OsErrorLog
+                | Self::GspPostNoCat
+                | Self::GspLockdownNotice
+                | Self::UcodeLibOsPrint //
+        )
+    }
+}
+
 impl fmt::Display for MsgFunction {
     fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
         match self {
@@ -816,7 +836,7 @@ fn new() -> Self {
 }
 
 impl bindings::rpc_message_header_v {
-    fn init(cmd_size: usize, function: MsgFunction) -> impl Init<Self, Error> {
+    fn init(cmd_size: usize, function: MsgFunction, sequence: u32) -> impl Init<Self, Error> {
         type RpcMessageHeader = bindings::rpc_message_header_v;
 
         try_init!(RpcMessageHeader {
@@ -829,6 +849,7 @@ fn init(cmd_size: usize, function: MsgFunction) -> impl Init<Self, Error> {
                 .and_then(|v| v.try_into().map_err(|_| EINVAL))?,
             rpc_result: 0xffffffff,
             rpc_result_private: 0xffffffff,
+            sequence,
             ..Zeroable::init_zeroed()
         })
     }
@@ -847,26 +868,31 @@ impl GspMsgElement {
     ///
     /// # Arguments
     ///
-    /// * `sequence` - Sequence number of the message.
+    /// * `transport_seq` - Transport-level sequence number for the outer message header
+    ///   (`GSP_MSG_QUEUE_ELEMENT.seqNum`). Must be unique per message.
+    /// * `rpc_seq` - RPC-level sequence number for the inner RPC header
+    ///   (`rpc_message_header_v.sequence`). Set to 0 for async (fire-and-forget) commands,
+    ///   or to the sync counter for command/response pairs.
     /// * `cmd_size` - Size of the command (not including the message element), in bytes.
     /// * `function` - Function of the message.
     #[allow(non_snake_case)]
     pub(crate) fn init(
-        sequence: u32,
+        transport_seq: u32,
+        rpc_seq: u32,
         cmd_size: usize,
         function: MsgFunction,
     ) -> impl Init<Self, Error> {
         type RpcMessageHeader = bindings::rpc_message_header_v;
         type InnerGspMsgElement = bindings::GSP_MSG_QUEUE_ELEMENT;
         let init_inner = try_init!(InnerGspMsgElement {
-            seqNum: sequence,
+            seqNum: transport_seq,
             elemCount: size_of::<Self>()
                 .checked_add(cmd_size)
                 .ok_or(EOVERFLOW)?
                 .div_ceil(GSP_PAGE_SIZE)
                 .try_into()
                 .map_err(|_| EOVERFLOW)?,
-            rpc <- RpcMessageHeader::init(cmd_size, function),
+            rpc <- RpcMessageHeader::init(cmd_size, function, rpc_seq),
             ..Zeroable::init_zeroed()
         });
 
-- 
2.53.0


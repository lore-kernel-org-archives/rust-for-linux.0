Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010063.outbound.protection.outlook.com [52.101.193.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DBBF36402A;
	Mon,  2 Mar 2026 11:43:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772451786; cv=fail; b=Mlj4/w67GhCbnwBfs6Q4xBpPUayfe5DXKmVpZ4BfHXPcbN3vgb+shNzZG+HtkkotFXEYk0NvEcZ3tRVHHVhPh8zjZZQO4JYeB3thLT3BvihqiyyYJ7Hq6yThJy/j0iT5C2gGRPzbabZPyIQBaw2TV2lrrEZMys7gcu3X+SyB4HM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772451786; c=relaxed/simple;
	bh=1+V/9J5J0c74hA4ikZHRnlIFsvGcHl4ZHe4Rc1PMAkQ=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=km8nEc4mhuuwfZURwgCnig9PuKN1rzXQlKkFDdmmSOj1exXptopYIy+2Bd9FB3k4u6Nw6S6+LxlcRdYNfbIewEjzNTY799XIp5OI8q2U7exYJ4jjAC4yUR48EvQR74FkksUaAFJi6D5Xdy5THuPe+5xIqsUW21eq0cE2xvdXPro=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=fSDzamss; arc=fail smtp.client-ip=52.101.193.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="fSDzamss"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TGHMGW7KojsGs8Si+793g5gtfzTf7NFX6zl+5633HjZp6iaZmA3OuN3SNQnWTwpEKS/JbgWTzlWPDB1rJ0IHVGvuSA4wMPteEJ8GLLPC2c7Ocxc9uU/5W4JYr6SqU7yxgTaWEG0+1Oq6Du6DS5ukv8moiqp2eTCP7jZWQDU1+uryWn7Wcm2k+LXvW5L5t/m1KLept4WmcEnkAAMySJz6pQdyFgPMcMSymxHWSlJySiqaqYusByiOMbwAo5mOAAECKFvS+l7AtEE8Tu/+DzzZn7UVn4s695wIkWeM7XjlzwAFTWYSYgbfB6pNIjFVRq2OgVOcEvC8Ii7GoMQ7yjmIzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9VJnWXJm+yI8tbDkM2y/urrRT6WlSvBHufQjqJ8uwzA=;
 b=JQ26lKxZHvAjR6aRdqsOLEL7Rn/xwrBXzgQVMQdNLNsd6r+b84nT4TnPOGLZxyNzbQoqyDkCdGy7g6JE+i3B6HD0fRHOvJI9MP9EQOjDRlMhVT0IDSiVRlI9zBTM0GoephVwLsTpeVEZY3mH3am1p93o5aF8zFKljAgcLbPrG7kWaWuFzFH7WpYTXxaxqSMlte9er1pvS0KYSMtAmKbBISpYXjq7tdbMviBxjdYHa5u+YbA9r7F3BcjJq3xMvxSpP6M4mg3KDjPvyvAHjr7tVjgW/nox6vekkjYdrV0kMHQOsbnWvSrNLt5BKM6ISw6M/8LYAqi8WkYSyL0zDQSt7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9VJnWXJm+yI8tbDkM2y/urrRT6WlSvBHufQjqJ8uwzA=;
 b=fSDzamsslltSF7oU9kGpxRxhhMCdaMvPRvusRtFtoePCcjls+gsBKF9a3Z0Mdyr4hhRX77dMlZsqilC//QgdG8jBDYs1HFYDAMLB28H+q+agQuax9Sr6q5U6O+hInIWKCe8EgNr5ZuVYuV+3I7OuZB3GwTcZXoRWfUg0cd+Aa59kJZ22839z0GxzOuHj3IgGPpIGwd6aceKpQ7tUa2qeFf7WKNTbGrttwcxklCoZQFfgNW5sQ/lmE9Ci5k/vepZsSbZeM80pSbxZUPnyeO69fXKIidUID+3J9VdUExaSten1V4qsVHOfGdfHJl5ZSxZkXM3RmtQaTKrPkpNG4dJe/Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by IA1PR12MB6259.namprd12.prod.outlook.com (2603:10b6:208:3e5::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.14; Mon, 2 Mar
 2026 11:42:58 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%4]) with mapi id 15.20.9654.015; Mon, 2 Mar 2026
 11:42:58 +0000
From: Eliot Courtney <ecourtney@nvidia.com>
Date: Mon, 02 Mar 2026 20:42:28 +0900
Subject: [PATCH v4 4/9] gpu: nova-core: gsp: add checking oversized
 commands
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260302-cmdq-continuation-v4-4-c011f15aad58@nvidia.com>
References: <20260302-cmdq-continuation-v4-0-c011f15aad58@nvidia.com>
In-Reply-To: <20260302-cmdq-continuation-v4-0-c011f15aad58@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Alexandre Courbot <acourbot@nvidia.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>
Cc: Zhi Wang <zhiw@nvidia.com>, John Hubbard <jhubbard@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 Eliot Courtney <ecourtney@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TY4P301CA0101.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:37b::8) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|IA1PR12MB6259:EE_
X-MS-Office365-Filtering-Correlation-Id: 060c8876-e29e-4099-e768-08de7850d9f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|10070799003|7416014|376014|921020;
X-Microsoft-Antispam-Message-Info:
	GGkWRjt5y6WSjIaxb1r4uyweovfZfvOkDNuoa/ITQ5J+TEWgmDySZ5ulBlvbOCwk2Zz8/D47+1lWiwZ7urbOWLIt9K1elYkOLdqnen9ZGqVkRgg+3oYzP/OkHsCWunSIRXDsJoYZY7rhVFY7hS4WNZASim546tVfgTNJqtqk5d27MIgzevog34O71rvWzd4jGpkn/Njv7vo3FblWUUE3gRAzR/M178PSAzmy4vJ/BNho6fznSsld0cyePWJaMsMRB9MjGLtbWbEbHb88sfPJt3bXewWCUhzkev/YxS/GFucsZAkpNki6c+r84bOXFb+WrOJt1WpXvGoQ7p/XuerHH2ZyLarkhsWyMGHe2UNs/HXOyzZb0bUcHclScPv5KCICiziqWyhpKH6oz/dfmw8IeNTFgDQCjzPuhA1J16xhReC7a54UHusrtM5BbzznOfbLknWFoeJBTBuMt7+j2TLHu/FFoyVyRJ6x4AbVH1WHMoAMosQsPBafleJhViFVqpqD9x+iqQqL0Le9zBGWAATrEtppAW+iPBglDFkuJ5HozCD+wIAt8qi0QhGlKRKT/SoVPU3xFwdFd0GcNGgJ6iiYDd7NSmJZo4znieWalmRDWq0yANQzFQo+qswuO6xqgIWXMav8CHyOuxzlmS/m4ufZuWkrkGWf+SUCHshnpoOMxVrJkmHviiOGlPJZaraBMHzM10FdRfKHKA8b/TilGVu/SzyMiFX8aQjjG5eLsTfjwmm6P1FJp/GfWacNcgmO3lBmkOXgCuVZjZ4JNkZeUXtCbg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR12MB2353.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(10070799003)(7416014)(376014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bnF0bGFMSm4wQ0IxaUk5UFBGRENlMDhRN2FiYmJoeFV1K3g5ajRnandhV1Zs?=
 =?utf-8?B?RmcrNUxjZUJTTng5QTg2Wk9YdUZaVUh4WkJPeWRYcWNUTTErb04rSW92cjV3?=
 =?utf-8?B?dTBuNXVUR2hxNU9wclZmQlRZKzhxRG1rdFE3eW03d0RFTXhLK3pPd3VjbVE3?=
 =?utf-8?B?NCtwcHJhYVBUanlqakN2UkNYdnk5Z0o0N1JEcVRCenVmRURoRUE0amVVd3Qv?=
 =?utf-8?B?aTRMRDRRYVo5aDVnTDZYaTFIUXF5aFBZTVUvMzFpRVl3UE1POC9CaUJoejdD?=
 =?utf-8?B?MjVYL3l2NlV3T3FIZkU0ZWJnZklGcTFLN0xJZTJvSVVZWWl4Q3M2dHB1akZW?=
 =?utf-8?B?R3pzM1RxZUVtdmw3UjRsejJiUmtQYnltaTdVSEk2YmVzaXdpa3JOc1dZRTZ4?=
 =?utf-8?B?TVMzMzFjYUNBV2NJdFREcWdVY2Z2dUtvejlFMThsOU4xZjB4R2NWZXJDYzJK?=
 =?utf-8?B?UmJYeERIMXRPRk5UYVU0Z0ZlTmZRSXhLZFl4YXJ0U2hZL2JncnUyYjNuZWdQ?=
 =?utf-8?B?bjBYL3A1SmFwRnVwaXdRMk1qQUw3Q01ERWlES25pMml0ckdVR0NmOFJwTTdu?=
 =?utf-8?B?VnpNdnV3MExnVU41UVJGa3RSVi8rSFpoN3B4Z0dHU1dRSksvMkxGbFgzRThG?=
 =?utf-8?B?bmwvanVkUmQ3ZHc4SnVRb0x3TUk3ek1hWHBRMjEzeTJybHdQNzlFcHNBSW4r?=
 =?utf-8?B?ZElsbnpnaERsdmhPU0Izd1Y1Vy9aSVdUajdSSkVnb3lYYm1wQit0NlYwb09S?=
 =?utf-8?B?bE5UVzQ3dHArTlkrSE1HdWpZYVYvUmM3c1c3TnVRQUk0Umk5WnozRDBiNHpm?=
 =?utf-8?B?OGg1V1h2b2R1MW80em9Cc1NIMC9IdlFuMjZMSWltbjIzcTVLQ2paUTYzdEg1?=
 =?utf-8?B?Zkd5SUFWaHpXV1EzZE5sUlI0Wll1TWYyUUdMcGI4RlFRVTlJeGdYZXp6TUgv?=
 =?utf-8?B?TVR5a3ZSdFpGNEdETy90bW5zeWNOdUExWW5tWFVnSG5CVTVzUjFFOXd4R0tV?=
 =?utf-8?B?K2krMFc5Um5MNlJYVjZQZU80SmMvUFpuQWdEQkU4VklHNndwaDBwOG4zMzJ2?=
 =?utf-8?B?U2c1V3ExMXIvcVRVWmtvNmpHbHdMUkE0dWZPby9zR0ZWQ1ROSklQSkM5UFMv?=
 =?utf-8?B?Tmk5R2NmdVNvekRPeXJEV0FpUXpIeUdNZUF6aU5YbHRpemdMT1ZhZzVvSWNQ?=
 =?utf-8?B?REplYVhvQ2FBbXE0TlRKT3VHbHNXTEtSV0V4WFcxcGhzdHJBYjAyUTd2VEFX?=
 =?utf-8?B?QXJwUnNSYUFJQ1hZTiswQmhCdnZuTUFhQWIwWWJYN3M1UVEzWmtXcVd6cVJj?=
 =?utf-8?B?TVkrVWIzREpVcGgzQzNLMWs4aE0vY1cyTDJtWDhEUFhvM1F5NVcvYWZqbC9Y?=
 =?utf-8?B?MVY3aFlDN3ZybncvMGhBZklzcDhZVzNQVEFudERyc0NKRm9UeGVpUHpWUEJn?=
 =?utf-8?B?TGFFaDV2TDJVcDltdVl2MittR3lTeERhVGY1eU9ZN3JMUkJtQXpaREJkdUQ3?=
 =?utf-8?B?VGRLVG15TmEvK3EyMm03WW1xNXlrakVtZVFQdm1iM29nMlp2NWhaaTBNNkE4?=
 =?utf-8?B?WmdBMjVRMTh0YTRhd0tFVUR3cE9uUTVzbGpCMjVQV002MEtHY2xsTGdZalY2?=
 =?utf-8?B?dEtrWTFIc0ZFNkN5Q2o2eW9vcDhacDljSGJRNC85ZEpiSXBLdTdyc2xHU3U3?=
 =?utf-8?B?MXhtY3N6RXpUVzdyTFE2TkFwM3ZPQ2xPZlRYaUwvQnVYaC9pQ0NZbzNCZ1Zs?=
 =?utf-8?B?T1E0MWtEL0dUNkVjRzdlV1R3ZmRDRkdFMnRUR0k0UjUvOTQ2cmNSTEFac2JC?=
 =?utf-8?B?Z0dtQ25XcEgrS3MxdE45dWlNK0JSRi9veFhDdWd0b3NCNDlGQkxPcGphQllT?=
 =?utf-8?B?ZlBQbHB4V21jYUtkVXliRDFpY1gzaDlGK3pmcHFnUjF0cEZXOERvZERqVEJ6?=
 =?utf-8?B?VWZ2ZjQyZWpoM0JJWENvWkVuZnFscGFSRTRIaUllNjhIKy9XakliTUZrK3RC?=
 =?utf-8?B?NHRxMDM4aHBvNk9rTE9VcEg1ZFlEYzA4K1h3amF6ODU3d0oyUUR1b1ZGY0dj?=
 =?utf-8?B?RkRadzg0YnlIZjc0aEE1WnNHNC9ta1luUFJVd09sVk1aTllJV0IreDlvNDlB?=
 =?utf-8?B?eGI2d20xVkl4R0VWeDFhSk1yWS9zY3d4ekQraFU5NjJuRmZyRzM3WUhGZnVh?=
 =?utf-8?B?Qy9YRnMvWkJEMlV3QmpSMXNBNjNCNm0yQVdCN0NSZzlaMkVDOWZkNlg3S0lm?=
 =?utf-8?B?aFc4ZFR1c1JzWVMrVzlST0g1UTIyK0FaYnJQQm5FbEUwK01hdWRFV2NYbjJa?=
 =?utf-8?B?S1E3VEFyTU1DUmoyQ3dqcU5LNFp5NkdaekJ6elBxblhaQWNrVE5rNFltVjk1?=
 =?utf-8?Q?dL6hKSOG3iJjMuY5T6hS2k5No5VeOXpsXe5mWbwc1t8Oo?=
X-MS-Exchange-AntiSpam-MessageData-1: 747rO57BUm0BwA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 060c8876-e29e-4099-e768-08de7850d9f6
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 11:42:58.5445
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SnsRHTtm/arj8IyyQXKE5/GpsEho8sxuXWDiKjTX6aUvFszFViZRBLPlQkpMSEc9erpjG/LDRym6AkzChLEQQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6259

The limit is 16 pages for a single command sent to the GSP. Return an
error if `allocate_command` is called with a too large size.

Tested-by: Zhi Wang <zhiw@nvidia.com>
Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
---
 drivers/gpu/nova-core/gsp/cmdq.rs                 | 7 ++++++-
 drivers/gpu/nova-core/gsp/fw.rs                   | 4 ++++
 drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs | 1 +
 3 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
index efbbc89f4d8a..3c2652be74bf 100644
--- a/drivers/gpu/nova-core/gsp/cmdq.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq.rs
@@ -32,7 +32,8 @@
             GspMsgElement,
             MsgFunction,
             MsgqRxHeader,
-            MsgqTxHeader, //
+            MsgqTxHeader,
+            GSP_MSG_QUEUE_ELEMENT_SIZE_MAX, //
         },
         PteArray,
         GSP_PAGE_SHIFT,
@@ -300,9 +301,13 @@ fn driver_write_area_size(&self) -> usize {
     ///
     /// # Errors
     ///
+    /// - `EMSGSIZE` if the command is larger than [`GSP_MSG_QUEUE_ELEMENT_SIZE_MAX`].
     /// - `ETIMEDOUT` if space does not become available within the timeout.
     /// - `EIO` if the command header is not properly aligned.
     fn allocate_command(&mut self, size: usize, timeout: Delta) -> Result<GspCommand<'_>> {
+        if size_of::<GspMsgElement>() + size > GSP_MSG_QUEUE_ELEMENT_SIZE_MAX {
+            return Err(EMSGSIZE);
+        }
         read_poll_timeout(
             || Ok(self.driver_write_area_size()),
             |available_bytes| *available_bytes >= size_of::<GspMsgElement>() + size,
diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index 4b998485360b..6005362450cb 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -39,6 +39,10 @@
     },
 };
 
+/// Maximum size of a single GSP message queue element in bytes.
+pub(crate) const GSP_MSG_QUEUE_ELEMENT_SIZE_MAX: usize =
+    num::u32_as_usize(bindings::GSP_MSG_QUEUE_ELEMENT_SIZE_MAX);
+
 /// Empty type to group methods related to heap parameters for running the GSP firmware.
 enum GspFwHeapParams {}
 
diff --git a/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs b/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs
index 6d25fe0bffa9..334e8be5fde8 100644
--- a/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs
+++ b/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs
@@ -43,6 +43,7 @@ fn fmt(&self, fmt: &mut ::core::fmt::Formatter<'_>) -> ::core::fmt::Result {
 pub const GSP_FW_WPR_META_REVISION: u32 = 1;
 pub const GSP_FW_WPR_META_MAGIC: i64 = -2577556379034558285;
 pub const REGISTRY_TABLE_ENTRY_TYPE_DWORD: u32 = 1;
+pub const GSP_MSG_QUEUE_ELEMENT_SIZE_MAX: u32 = 65536;
 pub type __u8 = ffi::c_uchar;
 pub type __u16 = ffi::c_ushort;
 pub type __u32 = ffi::c_uint;

-- 
2.53.0


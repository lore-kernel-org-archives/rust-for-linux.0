Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010006.outbound.protection.outlook.com [52.101.61.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29A8324E4B4;
	Fri,  6 Mar 2026 04:53:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772772814; cv=fail; b=fIssbzXHlaZBmCCE4tTuxszqfDsQz9a85SlOnmMn++YCK9v2uKVqa9N4ng76F1nVCjJq2PuPqhxEhbe7gRvxvWFb+glfj3hmD8ciTMA/UabDtTm4xm5i2jLdN5Eo9Kjy1XjsK8aFHeSK8vkTKK2EBET2S1WJdX5C0JAzE1pHdoA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772772814; c=relaxed/simple;
	bh=LRL4fKkbGTHsFwWvvaeGJsh7swRMMdyiejMZyngu24I=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=Dlb6V9uuwT9pnIMuIx+Tclan5S0xB32Ny6ZG+ltEZbwlrykqZ13rZF7ULXt/licUkzUINK63aDKTw67rIH+ICi6TyW/Luh7racQ8bDArVPLbFgLVzJHjMLMuuVUJ1jqLSfQaa1qDHqxm30mNYyuV2EXFIWeyUBlnfCbFpgIVR4E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=UxAwHRV4; arc=fail smtp.client-ip=52.101.61.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="UxAwHRV4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MP8bQ1UfFun2+zYMJO92RjhYjJUcQ7gmFRD2oxwNp7o2iDgl9BvYG6G5u4FcOAQV03K241eEXKX5d/zL0n1RuPJfGKCzyYalphfDerOHEuckUmEUXfNDjOVpmVs/cfvyOvGKC6H/cVUnxnu50rfmIJ+acA1+5v7G6IGYaD4UlHodj5LhSR5XcRqPpX3xd866vHGm7Xrk2zIHbU1o9X+yHwtoJnYdhbE2F6XoHwcnE68gPD6Tep4i7ZFBrZU52x8Q8C0wVeNAgoC+k8kFMtQQKCrRQxKqS1SAYKMeMgwLAkGANxxGSWB0qrxHWjk5C8NbN8pD63JZ+aXt1I0kXASYKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O15C/DBPYQlqJx++iId3qeGw7gKBKium15MunoMJq6k=;
 b=WuKh03Xbz9xXKIQftVKMCCpChwD3/rjKZhtd6NXALXSbFttydaFQFZQm5kc1dNaRKmqEa549GoA9NYVGQRg4Uk377t1tjobQRDBa1nGFBQW7LXvPaNqRIIi4b5ke7HiaugzHuOzVO4rDg6cn8vkShJ30+5l2cMmyy9CfcZXKZO7Gvh5S0mvtrIqo0JzrvF4Ej24UnXPKOk78eMir5RDDOe1SSE9Lysz3xtAYYo5ll3NxoL+EtowMVVEHvbSDl0T0Ylz3jPCe8+9zmIV1iE6Tjo/4V0No4gxzgAFR7wByD6q4+kLPiV2CKBW8tTIfHW0wsVkYfhM+HT7xSSOm7lvV7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O15C/DBPYQlqJx++iId3qeGw7gKBKium15MunoMJq6k=;
 b=UxAwHRV49Dn/OG7abvcMfNvNH9kdTFdWLRPHDbL6Z5kHFRihr4IJiKiCGZXu5Pxseer6CnHQD45BCD2wvFyMMS4qsIGZVneCRboiqiUBxj0y0LGXVYiBd/mVbHZ4iQUlk8yQuLtaxke5eAqdwNToblj51JrdRAyss+nhXxEgVTdJ8cuUiXDByduny0zo6cET2eJfpyEl9a/cvtR3RgXMSYrmgMD2WIi4d+KwqZB7Tb6m5uCDC010gvMV8QmnX+n8xMe3saPatIZuaFqZeKxV7BP4rcagvtHTHVmuZcaSy0jpBPxx7d+zqn7seFSHTewU2LLCljrI7yTv8YfLKt3STQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by IA0PR12MB7554.namprd12.prod.outlook.com (2603:10b6:208:43e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Fri, 6 Mar
 2026 04:53:26 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9700.003; Fri, 6 Mar 2026
 04:53:26 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Fri, 06 Mar 2026 13:52:47 +0900
Subject: [PATCH v11 10/12] gpu: nova-core: make Chipset::arch() const
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260306-turing_prep-v11-10-8f0042c5d026@nvidia.com>
References: <20260306-turing_prep-v11-0-8f0042c5d026@nvidia.com>
In-Reply-To: <20260306-turing_prep-v11-0-8f0042c5d026@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: John Hubbard <jhubbard@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Edwin Peer <epeer@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, 
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TY4P301CA0017.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:2b1::18) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|IA0PR12MB7554:EE_
X-MS-Office365-Filtering-Correlation-Id: aeb6648c-23bb-4099-cd04-08de7b3c4d9a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|10070799003|366016;
X-Microsoft-Antispam-Message-Info:
	UYmrQP+kbSmlJZgyj3p5JyptM8iHUsfnikqUrb2sdogeFi240R8zcCh5m6EzW9tTdTw5svTK3Rm2Zk2PghbPdh95sHM7NjzpVyRbdC/BiIkNKYnhZOezqPitNlkt2DmJoCtmMNxXy2SYKGCFbRq5mCrSaF19Q2hozNvTnJ8sESMRlwkse/jn58TFt88IdiFgdOzTNg6+Aq+XddlLXoZEMms6zFKF52eWTUwFMGxUGXCI2Egkrz9VwU+C02USh3GOvkkYrSmuSyTC2enM/iYoknzF/XaTBUlm/nJtMYUU9Jywis9lNh9rdFMkCAW60vZmpNc2KPXIYxWIqowJWdN/6s1VbmaFqsMh9nCyq+m/0sq+X/NN/mAOpAHxhuDuNUGECRHMr+Cv10WJdjHXRniZIBPBCAxzDDd4hiUTUbN2xkAv6NDRtM67jpghSMUqmZ7jAr4FXjwxkBcbkuDJb0WPFYKlOpSCQRbjepitwh3NklNHgIyKoEdBSeZpuqatTUZb1+Mi6VBVIA/xVROuvYOyx/h2X4eOErI5c4bg25lHMQrB3PjzsdwKT4Tm1ajmG5Oi7BVmlpS2C4xhT1rg2OhEyot1HnRkaeNuQOVybkoHDRjQ+VWFcZaWWrs3tDbWHAqv0PnNxMjjRyRU0v3anEQUmtTuVspUJT5jCSJf/uukheaqefI0/n3RH839MCIdKq31eXF4mqQg6Iu0RysVr7n8AaCwvrhqP5W33YbjNFza6aM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(10070799003)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eE9EMHhaMHZVenB2cEhYaGwvb25VMVdEYmdoNWR0MjQrcEcwcFY3SW96eVVy?=
 =?utf-8?B?blJtM3kvU1ovMUc0dFRXRFYwRENZUVZBYTJLZnpXK05PcHhhR29mTlpxK0F6?=
 =?utf-8?B?UDFNNGErUXN3bis0c0I1NzFQc2RzRURyQU9CM2o4bE5oMXBYcTc0U3g3SFgz?=
 =?utf-8?B?bmJ4Q3IwVUJKeERVaVlSOVFLUmU4RDc0aDViRHljSEx3N1V6czFzb0JHV3NY?=
 =?utf-8?B?ckJjYXI1Qld0SjZCVm8zcnF4WnNISms2ODRVVTl5UVdqOC9HQklkbVh2ZnI4?=
 =?utf-8?B?bmpEWm9PWmtKdHNPdm1TTW1lalllYktjbmFYOGM4V1FxMkdJcFRpb3VsenZa?=
 =?utf-8?B?L3N5dk0wZldwRW9ENklzOXgwOTQ5TE1LZm1JTEw4eFBiY3BpcDdodWFESVZH?=
 =?utf-8?B?eHJQKzR3eWJSMXNWS3NuVzYvNXVHcG1lVndPR0Y1NzB2U0FqbEozcDI5QWV5?=
 =?utf-8?B?RVk1MjNuMlBmSlphRXFyQy9kemROMDhKTElYZlh6RnY3MUxWZUdSeEpsNkxK?=
 =?utf-8?B?VGQ5UzluT0lreUtUcU5wQ2ZPRERWVGdvRkZWd2J4dENkL1d3a2taMFJudkZM?=
 =?utf-8?B?MHZYOUY2bW5Pa2V2T1B1SGtEak1kbFhzQ1N4WFZNcGhma1lKbE5BTER3OFQ5?=
 =?utf-8?B?b29kYWI4aWx4VSt1WDMvVlZxNWlaZlBqREJJWjRlcFBNazZPbHRlcFVseThu?=
 =?utf-8?B?czJBRGFEcXR5dU5NK1ZKRkkzMmd6MlRzcjR5TlFnbWZtMWtyTno1aDdteFk3?=
 =?utf-8?B?VEROSUt3NC9rRjZ1VFdYNVNzc0w3L2haQnZ5Z2ZzSHd3c1l5eE0wa3RBMFkr?=
 =?utf-8?B?OWJQNy9SRjYyNmxjRUpQTjNVRzJtdkViRUJiYlZGMjBjcjZDbTN2UDNuZlZ6?=
 =?utf-8?B?bWZramxmWGJWUVRUNnFGMDJncjJHU0Qrbk1lNnZCMHY2N0w3YUNac2hMKzdq?=
 =?utf-8?B?ZzZ5U2NJc2tDQTg5dXR2cW53L0I5R01kRWJsc0xsemcyWEw4K0hzMVp2RTNI?=
 =?utf-8?B?SXVXYVU5bGw3ZUE0blpQajBkWk1EVWJ4WnNMQzVaY0pwL3VZb2xYUE5xL2JL?=
 =?utf-8?B?Vjd4U3JvQkJtZG9pSEwwYXFYSGpjTGFwR3NoT3dFN0x5QWErbDZrUnBhWDY2?=
 =?utf-8?B?b2lkUUVEUm5SOE9pYm9OZ0hDa2JCMjl5eVZmdFg1K1pIRnc2UzlFVTA0d3ly?=
 =?utf-8?B?Ynp1K2sySTV2Z2tRSFlmSW1wVEdZYUtRTVozVEhzTitBcmhzTUdBbXhaZml1?=
 =?utf-8?B?cEtSbGd5dnV1QkxBS3JpdUE1M3JwZkhMc0Qra1J2TVAwdVBZZSszV1Y2dVdT?=
 =?utf-8?B?NkZLcFg3QU9YdDJ1TXV1NFYvTklUSGtNQlJDMUpNR2pwbTZZd0tnaWNXdUVv?=
 =?utf-8?B?T3hGNGsrT09oMG9XenZQc1l2TzVaS2wwcVFPcVFHWTVCc0V1cE9NYlRZNU13?=
 =?utf-8?B?bEZTYjI5WXlEV2RSVDFHMkY4bHh2RnluRzMwVmhnREZHRnF5b3ZXOVMzdG15?=
 =?utf-8?B?SXhKWGY5MW11d25wTFQyTkV3TmxpY3huSjNvMFNBcHFxNUd6RmFVdENxUmNr?=
 =?utf-8?B?T2t0aWVvamw4N1d6RkRqUWJpdXlMdHE2cjB0N0pzNEwwTVBQM2hJOUQxbTJn?=
 =?utf-8?B?aEJleGNlKzhJcHU2Y0VFbno0Qmw5MU82djBkY042VnNXZ1JxbDZzME1BM3FN?=
 =?utf-8?B?S3JSaDJzVEQxUjlUVEN5REsyeldQaHgvbVM0a1o1TlY5cDVBajY5ZU9VN2lj?=
 =?utf-8?B?WWUzTGFaRW9ONDVhMG1UU3JJL0NRZlBVY1psRER0Ly9uQTlzN2ZVcUJ3aGVq?=
 =?utf-8?B?eU1MNFoyMmh5WURWWWY2UnBYNlBkZUtjWlpFTDZBZmZNQ3RraUxuMkxDd2NF?=
 =?utf-8?B?UnBNenBVZGdKd2ZnVWg1aU9pcHhFZlp2SFZBNS9STHZhYXA5TnZtcjZrQzBn?=
 =?utf-8?B?N3dxbXZpR3lQSGx6VnBvbzhwL1RjU1NseVZBMXRsaWZOZlJMNFZxY1ZpYmxI?=
 =?utf-8?B?N0d4UXZWQmlhSzF6U1JoYTdzQ1N2UkpEaFI2OG5xTWowanhoMFNNNHNWYjRH?=
 =?utf-8?B?RUNVeHdmUE5MZGVDQ0tJZkEwdERtcjg0Z2Racm1RYk5tVHJxWWxQMUwzWmti?=
 =?utf-8?B?QjA1MjNRaGZQaTVzdjNDMk5xK1NYQi8zUDAxeW1paSt2RGh4RlhaK09uSk1z?=
 =?utf-8?B?R2pCYkljak9FYUI4NVZWRUVSMkRQeFpNOXFhOHdLME5VVG9QWTRsVTJtWXVD?=
 =?utf-8?B?YVdrWk5IcE1ZNXBzNFlQT1BoVUtJRTI1NHFmT25vU2F1eGlyUVBvODVoYURw?=
 =?utf-8?B?QksrUStGMHUyQ053RSttYnBkc2FUTmtlNDJSSWtXVXppbFc1dUNuZ2dUdlQr?=
 =?utf-8?Q?U7+vcY2X5u/XgMUTq90M8OhhXzJsvQOLF7F98aNTm18Wb?=
X-MS-Exchange-AntiSpam-MessageData-1: N+EBxQBZVycO3Q==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aeb6648c-23bb-4099-cd04-08de7b3c4d9a
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 04:53:26.4593
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bkPpgthSfLzBnewraCUC8ipz0+DKXodyQIqUFfkR9UmWMgK8m5zOP5aEXcPiWFEPg4CF37xctrl54EJ/CDHRhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7554

We will use this method from const context.

Also take `self` by value since it is the size of a primitive type and
implements `Copy`.

Reviewed-by: Eliot Courtney <ecourtney@nvidia.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/gpu.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 60c85fffaeaf..c14d411c6759 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -92,7 +92,7 @@ fn try_from(value: u32) -> Result<Self, Self::Error> {
 });
 
 impl Chipset {
-    pub(crate) fn arch(&self) -> Architecture {
+    pub(crate) const fn arch(self) -> Architecture {
         match self {
             Self::TU102 | Self::TU104 | Self::TU106 | Self::TU117 | Self::TU116 => {
                 Architecture::Turing

-- 
2.53.0


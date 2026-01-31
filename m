Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010034.outbound.protection.outlook.com [52.101.61.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE54934BA4E;
	Sat, 31 Jan 2026 00:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769821008; cv=fail; b=jxxEccOg+Ecl0QkqsXslubeY07uQMomlWg1/Xi1q7POQjC6RTpF1VhgcLIm1bVtdO4ushuYAcAb7iGqGMJAKZDWlMQfILBp4ILe3jGa9MA4b2AX5vW9cLXnCWCSkJeBVOZ15mhP7Myd3C7Ahr5Rjy1IocxIAzwLsD6hNTelT++4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769821008; c=relaxed/simple;
	bh=VOoui2ZaoFgn0HUORHzXB+BytMRlIWJWCbN25nERAo8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=q72dJbQ+ZgqF6l+oXz8kR1Yl8UiYbl+I1lAwx5/tfDryFsKd4+mwaGoNviv8TBzGWCgphAbk9fvvNIQJSSg1P3m2PIuif/YjuegBWQlMKhub8vB+c8WmngUeuhnt8lAiu4QI/wTntsopLNpdnBklcUWFczVt3WYWOlTvN0fSW4Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=MH9s4qxv; arc=fail smtp.client-ip=52.101.61.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="MH9s4qxv"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Sse+DprC78jChhiC7TdECHPT8qQYJKM+KIosR7Y5OzMYVHqSnwSINtr6zBGCRQJ9VLvWh95FPrcKsHvUgVeymTScgvtxPFP57pCd3C2aF5L9mEMRGr7kl5mv+xgT2jbkvHXBKjB7g0uS0VgDGES557hAIYF10McxY2ZBNo9vVpY1Aovt1O/p4zMWWPL5drH/grhRH+Ry/FucN1d7MxSjf5A3kX4GczCDGykOxiAtUnVuHREgMUeVdeY1+92nDZIXB5hyQebydkPy9e6+5eJHersVJNaoNknd8cADZYAi4/D/70jCZ9C+4lOSaElC08xQLyox2QuSesun8QUwDeSSTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=00uEbMeMLI/JtHiVKGAzi39oQN0eOEsNoLAOdLIpack=;
 b=fmlg77ZreCOXvA2wwEFq71fhnzvfdrWkcqcftzKRhosFy4+WjbXMViRn3lZywsYuS07yfI9YzQYhU67CZe6aT3qxMa3xgFqrwaJv6o6qySDKUpQY30pA3ObBTYSxFh50l3NpyERdYNM9CdeIRZqHgoG4u9vbjQODfZ98xN/92+9mesXCM63yHN2dKxaImdfWGxgD4GrtJ5UMOdElMDMmGeVYu5SuCw4XwC+xLpS7WoKs5Uga6/UKPgHNN2K0CVnBL2VrXPAeh1X3p//6teUGU6/n8bKjNM/JKPSjhBlMx+i+DEJRRys4ZQnWkUQLw2wcoLEKHI6WwJE3gpCugGjO5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=00uEbMeMLI/JtHiVKGAzi39oQN0eOEsNoLAOdLIpack=;
 b=MH9s4qxvqhXL60ofPLZXOqNQJR+kdRHopq988NeDeuBEu1BtGcLCXaBPOwrOA7/w08cLHM1ImdrA7xvAcaEFQNzM6IY92x0Eq+AKkqpFoi2Nh+dBQDl0J+0VKKnf8DJ31qFgO8DOUePsqJPVkwimgdNp8oLawHpO39TLQ2IZLwCqcc4BgWl7UQq29nRhVdUxecq5t4nvnDRYszByuprFm077S5B3hne9ftTzfQ1VfBOvVNGaUEG9bNmJTJlxbWXrTA9nKXM81l6Zmi+3LgyNbDbpLnHM8lPYvA2ZKQjwxdw8rp4OyQMVwv3goWKILoNcAP9acQtkHfN7dMWA8whXzg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 BL1PR12MB5945.namprd12.prod.outlook.com (2603:10b6:208:398::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.11; Sat, 31 Jan
 2026 00:56:38 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9564.007; Sat, 31 Jan 2026
 00:56:38 +0000
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
Subject: [PATCH v2 23/30] gpu: nova-core: Hopper/Blackwell: add FSP Chain of Trust boot
Date: Fri, 30 Jan 2026 16:55:57 -0800
Message-ID: <20260131005604.454172-24-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260131005604.454172-1-jhubbard@nvidia.com>
References: <20260131005604.454172-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0200.namprd05.prod.outlook.com
 (2603:10b6:a03:330::25) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|BL1PR12MB5945:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ac934b2-976a-464e-4674-08de606396b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?89IaasO1WDWQF/EndRFtkl6kElU6+FOnyHU1gg1vvmP+JCEQp3oNwBsnFumz?=
 =?us-ascii?Q?mYTQgtYMBmjWFiDSgYa+KVKcBsZji1wP5O/KeWTixursUx9Xk2WcWbxY9cby?=
 =?us-ascii?Q?297HjY6v5l9ErRAIg+89fm0yqTAV/zd2wfK5wYd0iwWXtz5xxWdrpHM167Xn?=
 =?us-ascii?Q?lRBdYqFfOyIx8DMlxIcVkB6yJloY9ZGtdlfDaa92m6GaA+H07dnYwCe8tm+F?=
 =?us-ascii?Q?6jpZU+6ZaCw3t4WiA7nhlm+cr/l0MSYeMeLIA5xo686qi8JsWbAYmfhhgsCI?=
 =?us-ascii?Q?P7dGhYcjqG9lPxe8zez/hit9bqY6J90JCxm+ki5/p/9w64rpsGN26wjs+fTj?=
 =?us-ascii?Q?WhcdfW+geJgazMneUp/P/SqE7nd/Dna6FltOtLyuoa/7RYaBjq2kD88F7p/W?=
 =?us-ascii?Q?D4Jhdwf9vZmRMi2Xy3uhHjhNzk+2ykaboBOiDJ9RJ5KHDD2CWedPYgq9NfSw?=
 =?us-ascii?Q?zyMDsN/CDiw1Jp25YEWlZpmjR+Wog7+Zue7ulIBnL1EiITE5V1rC4gvcT0pE?=
 =?us-ascii?Q?5s7A8hJpaEa4qiIM9S1gIPT4zp/6hiIT8ZCo/SWqCaRmHknRN+uuqBeSdOBM?=
 =?us-ascii?Q?LjcvYTAbRfGVnBsiWGXPRLUOb0pPy1mP65q9/F3mNGGsOmgEFyZJ0a1ouXY2?=
 =?us-ascii?Q?x1HWrnGhUB6i8GLcDZpx1UTZX+0BT7vPjEg/k129kGtHF1L+c/r8/BFnUBj/?=
 =?us-ascii?Q?eVnie6QDZE/qzkhnbsUMwHiGOa3CnmQEfwKe0B1bqsP56rNE5RtPfv7b/3az?=
 =?us-ascii?Q?Cei4HurOEV2Hokq04v4wJi4H+L1X7noGN+NBbgZMiQYpm3YI805TAXluPzlE?=
 =?us-ascii?Q?43LSAMgAg/+AsePMmpR9uWo+Fm0oG1FcGx0/pNsbEmTWrhQgBf2tXcTI+wCO?=
 =?us-ascii?Q?8xMp4x7oUFvzcJ9amZUndPIEE+oFFbahz2PcjVFBOTmLSQEYaZkLPOWmHbQR?=
 =?us-ascii?Q?BNJiNIdB11HgAMXP/xhRqXe3rkzDsKz8JmXqhcXRLO0WY7Jh3toF01CalxRW?=
 =?us-ascii?Q?tjOwLJF3M/r+XfJIl2JzHe2Q80h0c43EBAEqgYEKmgl71ku43uohkXh9rO0w?=
 =?us-ascii?Q?yyH3VrmlKQ4LxExHmhZUj+XSDCQA+i9bBtghKYRQM3jN8jWUCKc5/hHgPLxh?=
 =?us-ascii?Q?yTIxTEb7DL1auPQ+ULvLpKXHt+w+QFyLaLVQjXL2ATRZXpqt/zgOOMnD8m/S?=
 =?us-ascii?Q?iG9oDn/emJZbBQA+bfT/ExC6MS6FCEkuv/dmbU+Px6R99fVoaMEi5AfkLoOW?=
 =?us-ascii?Q?4TMsohdxlDfkNTIdp5gOjEkqj3KId/fWIxD6CcLwu7JC6UOzZ4pxYdYhu1P4?=
 =?us-ascii?Q?+MKyPvH5IrCjzzDB3ZcSGzZTaq+sxc2SCFn9AqdnsDfpMirFe6FLK6hp+5FX?=
 =?us-ascii?Q?x0BRX5RJUSmRelWf9hkG8yh6QphIp5NPQmbIUaXU2Fu141FjiUYExez0Mtvm?=
 =?us-ascii?Q?wV/K3Bx3ZEU3pseov3eqcBtOZMnWUoG9FyOjZu1iN+LJBp5S9C5QmKHNa3HD?=
 =?us-ascii?Q?TmNVp40MDLlQTu+3vKY/QksG3fxXKRg4TB0c6qMrF7Gj+YtpwIpO5PxODxwG?=
 =?us-ascii?Q?mg37yOa7jn+sNYPdLCA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7J/MquWqbRJaIzpRp9rXGI4jlHFldzVV/Rts/whvkNEy3pfGWEyNoYb8Gb5F?=
 =?us-ascii?Q?iBWVCzJvmUqUaxOZ9tnl5YCy7GyWSMIDj9x/Tzen3Q2UweY8iNsAIsAsAqrB?=
 =?us-ascii?Q?/DyelHwnJk5cwzmtd4fT6zJ5Z6Jj85U54vZzXfNbWWll0A4VRN1i5P9ScckL?=
 =?us-ascii?Q?MHLiUzSnwkSqjW2DHwQbeLTUR03e/L+chpkdZ8vEHDZ1/M69POr56/jf/sNH?=
 =?us-ascii?Q?JRQv+MjyKEuSqlXPfJHnIc5GmVrG7h7NZ/VF3YRUjIm79snCIytb71jgeP/c?=
 =?us-ascii?Q?gvYjeHbiSsGaWkf6IzfC5MsX4faO3Cs+Nd6ooPCt7j0stRYAvKhaKEUJPe15?=
 =?us-ascii?Q?MJQFozpi+C4voRDl6L5hMZTA/VY/21bStUsDHqbczYbNyUDBVJnVdXyTJypS?=
 =?us-ascii?Q?IhRkxV6CApMViLTTNtWUeSqttbn7Evs14+Y73CgnmNiJ5B8vXyAm50hB7Mpa?=
 =?us-ascii?Q?5vmzmRr3ETRgsLZF85g3vFap5MEAGf0rKI2HuXnlMqO/phJXyIHr5HtfBt0L?=
 =?us-ascii?Q?kpqGytA7e1b2e5NHxL2iFKOzSukTIEaRPGry4lWyIaTYWGrxUIKW7qdSpawC?=
 =?us-ascii?Q?IN2AuppOQJwfaEbOgPdnwGli5BEncdfK+bSd5c6zIeevqHw8rzVU/xwl49GD?=
 =?us-ascii?Q?KFECZ6yhE75fotjUgy319RSpo4X4leZ/gP1DOCUIj/07j4jM2l34anr4loOY?=
 =?us-ascii?Q?mqXD+56PsTWOw0DiHyzED36SJWSge18ExD8glJEOVNTo7M7LNzE+NseabENK?=
 =?us-ascii?Q?4h8sshP85A3OrxEfvM5sJs42Ux/Ho0tYWI8CfEqmgBvIhHrsKD46ZPb3nRbk?=
 =?us-ascii?Q?gB18kGaorWlAPeVXnfTf1f07gKRWHRAqDdrFDlAjbvlbyTyGAeQKRd2FFmU0?=
 =?us-ascii?Q?C9iKYZKH8WSjgIJsQ+/CcgLAsT5fkBOFusBK9cajI8QF7WQTswK6D2VEoDgt?=
 =?us-ascii?Q?BggV6jHTY/uzJV11XTL4AE0MpAQsAf8IvF0HxCtOBNicBYb+az4f9jSflPEz?=
 =?us-ascii?Q?DLapa0hvNwLi2YR/2YFv269dPLG8A0zGKs1ogCKuT1Ui84nXEA4N97KglQfg?=
 =?us-ascii?Q?JJW0DBjttGhkSyQqqi9hk5VG5PhUD2MYsB6tmK/blWdo/TrkjftJTD9a52PF?=
 =?us-ascii?Q?F4WErTXnkndQKwkvgUdZ8N1V0NkipUfKuelIWZni0BjqAu5S6CYkpjqH+NJP?=
 =?us-ascii?Q?WS/AwWQP1oauQOwmj57Fw1+Ys/MPmv8TmmAA8fDDyakGoxKOTNllPdgTvTNq?=
 =?us-ascii?Q?RUKUiPa71I69OOqQSXENb5IUc07hAFgeODylAF1zki4VVOTa1k5P0b1Uutaa?=
 =?us-ascii?Q?glaO6ntZb14mDZNChfqcqP7FVLugXYRiaxY9ODQtZmtiSPwONtNFJaquhb8K?=
 =?us-ascii?Q?Ic0tCxCnUIx2TmsNmzTXVP2+r5KDOo7dmBBZp5wnMxezkZ2DayHuLYkiThVX?=
 =?us-ascii?Q?yvsQGoA9oQT9MgUuBs3obae/BLxuBO3cvPkS4wdnyIMvdJJk+reWKsFNQ3Xg?=
 =?us-ascii?Q?fESCFaJaUeVNTx9ED4TOHknOwCZBO46zX2bvTaehehVa9AwH7orKM22XiR2L?=
 =?us-ascii?Q?2puWaXVSKE7shVLYLVee+LLq+czswFEcKafKw6wH3khrdDKCHNiReEQKruqU?=
 =?us-ascii?Q?LDQtDmQ0BvWIQAgw3GKAXcz7AVBriOlZA/S8xVCDZRNZY6b0611rmNbfGvzx?=
 =?us-ascii?Q?lOgcc4SnEbE7fuztxSlRZW91j2URkPcD+1tah88qSMSZzFF9RiITjyye0rGK?=
 =?us-ascii?Q?wiiV0z7djw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ac934b2-976a-464e-4674-08de606396b8
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2026 00:56:38.1375
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2rhtIXjUft92ABxDeoJuyDNZHTBXN5kyh55kJoBznvzypmLkWDUhRGCqKV4XXoZjPqjQROEzo7ICICrMnRbivQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5945

Add the boot functions that construct FMC boot parameters and send the
Chain of Trust message to FSP. This completes the FSP communication
infrastructure needed to boot GSP firmware on Hopper/Blackwell GPUs.

Cc: Joel Fernandes <joelagnelf@nvidia.com>
Cc: Gary Guo <gary@garyguo.net>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/fb.rs           |   2 +-
 drivers/gpu/nova-core/fb/hal.rs       |   9 +-
 drivers/gpu/nova-core/firmware/fsp.rs |  19 +--
 drivers/gpu/nova-core/fsp.rs          | 166 ++++++++++++++++++++++++--
 drivers/gpu/nova-core/gpu.rs          |  12 ++
 5 files changed, 191 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/nova-core/fb.rs b/drivers/gpu/nova-core/fb.rs
index 9b4407338724..3a2b79a5c107 100644
--- a/drivers/gpu/nova-core/fb.rs
+++ b/drivers/gpu/nova-core/fb.rs
@@ -30,7 +30,7 @@
     regs,
 };
 
-mod hal;
+pub(crate) mod hal;
 
 /// Type holding the sysmem flush memory page, a page of memory to be written into the
 /// `NV_PFB_NISO_FLUSH_SYSMEM_ADDR*` registers and used to maintain memory coherency.
diff --git a/drivers/gpu/nova-core/fb/hal.rs b/drivers/gpu/nova-core/fb/hal.rs
index d795ef7ee65d..eaa545fe9b08 100644
--- a/drivers/gpu/nova-core/fb/hal.rs
+++ b/drivers/gpu/nova-core/fb/hal.rs
@@ -28,10 +28,17 @@ pub(crate) trait FbHal {
 
     /// Returns the VRAM size, in bytes.
     fn vidmem_size(&self, bar: &Bar0) -> u64;
+
+    /// Returns the non-WPR heap size for GPUs that need large reserved memory.
+    ///
+    /// Returns `None` for GPUs that don't need extra reserved memory.
+    fn non_wpr_heap_size(&self) -> Option<u32> {
+        None
+    }
 }
 
 /// Returns the HAL corresponding to `chipset`.
-pub(super) fn fb_hal(chipset: Chipset) -> &'static dyn FbHal {
+pub(crate) fn fb_hal(chipset: Chipset) -> &'static dyn FbHal {
     match chipset.arch() {
         Architecture::Turing => tu102::TU102_HAL,
         Architecture::Ampere if chipset == Chipset::GA100 => ga100::GA100_HAL,
diff --git a/drivers/gpu/nova-core/firmware/fsp.rs b/drivers/gpu/nova-core/firmware/fsp.rs
index 80401b964488..edcc173c2fa6 100644
--- a/drivers/gpu/nova-core/firmware/fsp.rs
+++ b/drivers/gpu/nova-core/firmware/fsp.rs
@@ -3,6 +3,7 @@
 //! FSP is a hardware unit that runs FMC firmware.
 
 use kernel::{
+    alloc::KVec,
     device,
     prelude::*, //
 };
@@ -13,16 +14,16 @@
     gpu::Chipset, //
 };
 
-#[expect(unused)]
+#[expect(dead_code)]
 pub(crate) struct FspFirmware {
-    /// FMC firmware image data (only the .image section)
-    fmc_image: DmaObject,
-    /// Full FMC ELF data (for signature extraction)
-    fmc_full: DmaObject,
+    /// FMC firmware image data (only the .image section) - submitted to hardware
+    pub(crate) fmc_image: DmaObject,
+    /// Full FMC ELF data (for signature extraction) - CPU-only access
+    pub(crate) fmc_full: KVec<u8>,
 }
 
 impl FspFirmware {
-    #[expect(unused)]
+    #[expect(dead_code)]
     pub(crate) fn new(
         dev: &device::Device<device::Bound>,
         chipset: Chipset,
@@ -36,9 +37,13 @@ pub(crate) fn new(
             EINVAL
         })?;
 
+        // Copy the full ELF into a kernel vector for CPU-side signature extraction
+        let mut fmc_full = KVec::with_capacity(fw.data().len(), GFP_KERNEL)?;
+        fmc_full.extend_from_slice(fw.data(), GFP_KERNEL)?;
+
         Ok(Self {
             fmc_image: DmaObject::from_data(dev, fmc_image_data)?,
-            fmc_full: DmaObject::from_data(dev, fw.data())?,
+            fmc_full,
         })
     }
 }
diff --git a/drivers/gpu/nova-core/fsp.rs b/drivers/gpu/nova-core/fsp.rs
index dfd0ffe5a650..6a0bc800abb0 100644
--- a/drivers/gpu/nova-core/fsp.rs
+++ b/drivers/gpu/nova-core/fsp.rs
@@ -13,6 +13,11 @@
     device,
     io::poll::read_poll_timeout,
     prelude::*,
+    ptr::{
+        Alignable,
+        Alignment, //
+    },
+    sizes::{SZ_1M, SZ_2M},
     time::Delta,
     transmute::{
         AsBytes,
@@ -35,6 +40,16 @@ pub(crate) mod mctp {
     pub(super) const HEADER_SEID: u32 = 0; // Source Endpoint ID
     pub(super) const HEADER_SEQ: u32 = 0; // Sequence number
 
+    // MCTP header bit positions
+    pub(super) const HEADER_SOM_SHIFT: u32 = 31;
+    pub(super) const HEADER_EOM_SHIFT: u32 = 30;
+    pub(super) const HEADER_SEQ_SHIFT: u32 = 28;
+    pub(super) const HEADER_SEID_SHIFT: u32 = 16;
+
+    // NVDM header bit positions
+    pub(super) const NVDM_VENDOR_ID_SHIFT: u32 = 8;
+    pub(super) const NVDM_TYPE_SHIFT: u32 = 24;
+
     pub(super) const MSG_TYPE_VENDOR_PCI: u32 = 0x7e;
     pub(super) const VENDOR_ID_NV: u32 = 0x10de;
     pub(super) const NVDM_TYPE_COT: u32 = 0x14;
@@ -203,6 +218,19 @@ struct FspResponse {
 // SAFETY: FspResponse is a packed C struct with only integral fields.
 unsafe impl FromBytes for FspResponse {}
 
+/// Trait implemented by types representing a message to send to FSP.
+///
+/// This provides [`Fsp::send_sync_fsp`] with the information it needs to send
+/// a given message, following the same pattern as GSP's `CommandToGsp`.
+pub(crate) trait MessageToFsp: AsBytes {
+    /// NVDM type identifying this message to FSP.
+    const NVDM_TYPE: u32;
+}
+
+impl MessageToFsp for FspMessage {
+    const NVDM_TYPE: u32 = mctp::NVDM_TYPE_COT;
+}
+
 /// FSP interface for Hopper/Blackwell GPUs.
 pub(crate) struct Fsp;
 
@@ -318,16 +346,138 @@ pub(crate) fn extract_fmc_signatures_static(
         Ok(signatures)
     }
 
-    /// Send message to FSP and wait for response.
-    fn send_sync_fsp(
+    /// Creates FMC boot parameters structure for FSP.
+    ///
+    /// This structure tells FSP how to boot GSP-RM with the correct memory layout.
+    pub(crate) fn create_fmc_boot_params(
+        dev: &device::Device<device::Bound>,
+        wpr_meta_addr: u64,
+        wpr_meta_size: u32,
+        libos_addr: u64,
+    ) -> Result<kernel::dma::CoherentAllocation<GspFmcBootParams>> {
+        use kernel::dma::CoherentAllocation;
+
+        const GSP_DMA_TARGET_COHERENT_SYSTEM: u32 = 1;
+        const GSP_DMA_TARGET_NONCOHERENT_SYSTEM: u32 = 2;
+
+        let fmc_boot_params = CoherentAllocation::<GspFmcBootParams>::alloc_coherent(
+            dev,
+            1,
+            GFP_KERNEL | __GFP_ZERO,
+        )?;
+
+        // Configure ACR boot parameters (WPR metadata location) using dma_write! macro
+        kernel::dma_write!(
+            fmc_boot_params[0].boot_gsp_rm_params.target = GSP_DMA_TARGET_COHERENT_SYSTEM
+        )?;
+        kernel::dma_write!(
+            fmc_boot_params[0].boot_gsp_rm_params.gsp_rm_desc_offset = wpr_meta_addr
+        )?;
+        kernel::dma_write!(fmc_boot_params[0].boot_gsp_rm_params.gsp_rm_desc_size = wpr_meta_size)?;
+
+        // Blackwell FSP expects wpr_carveout_offset and wpr_carveout_size to be zero;
+        // it obtains WPR info from other sources.
+        kernel::dma_write!(fmc_boot_params[0].boot_gsp_rm_params.b_is_gsp_rm_boot = 1)?;
+
+        // Configure RM parameters (libos location) using dma_write! macro
+        kernel::dma_write!(
+            fmc_boot_params[0].gsp_rm_params.target = GSP_DMA_TARGET_NONCOHERENT_SYSTEM
+        )?;
+        kernel::dma_write!(fmc_boot_params[0].gsp_rm_params.boot_args_offset = libos_addr)?;
+
+        Ok(fmc_boot_params)
+    }
+
+    /// Boot GSP FMC with pre-extracted signatures.
+    ///
+    /// This version takes pre-extracted signatures and FMC image data.
+    /// Used when signatures are extracted separately from the full ELF file.
+    #[allow(clippy::too_many_arguments)]
+    pub(crate) fn boot_gsp_fmc_with_signatures(
         dev: &device::Device<device::Bound>,
         bar: &crate::driver::Bar0,
+        chipset: crate::gpu::Chipset,
+        fmc_image_fw: &crate::dma::DmaObject, // Contains only the image section
+        fmc_boot_params: &kernel::dma::CoherentAllocation<GspFmcBootParams>,
+        total_reserved_size: u64,
+        resume: bool,
         fsp_falcon: &crate::falcon::Falcon<crate::falcon::fsp::Fsp>,
-        nvdm_type: u32,
-        packet: &[u8],
+        signatures: &FmcSignatures,
     ) -> Result<()> {
+        dev_dbg!(dev, "Starting FSP boot sequence for {}\n", chipset);
+
+        // Build FSP Chain of Trust message
+        let fmc_addr = fmc_image_fw.dma_handle(); // Now points to image data only
+        let fmc_boot_params_addr = fmc_boot_params.dma_handle();
+
+        // frts_offset is relative to FB end: FRTS_location = FB_END - frts_offset
+        let frts_offset = if !resume {
+            let mut frts_reserved_size =
+                if let Some(heap_size) = crate::fb::hal::fb_hal(chipset).non_wpr_heap_size() {
+                    u64::from(heap_size)
+                } else {
+                    total_reserved_size
+                };
+
+            // Add PMU reserved size
+            frts_reserved_size += u64::from(crate::fb::PMU_RESERVED_SIZE);
+
+            frts_reserved_size
+                .align_up(Alignment::new::<SZ_2M>())
+                .unwrap_or(frts_reserved_size)
+        } else {
+            0
+        };
+        let frts_size = if !resume { SZ_1M as u32 } else { 0 };
+
+        // Build the FSP message
+        let msg = KBox::new(
+            FspMessage {
+                mctp_header: (mctp::HEADER_SOM << mctp::HEADER_SOM_SHIFT)
+                    | (mctp::HEADER_EOM << mctp::HEADER_EOM_SHIFT)
+                    | (mctp::HEADER_SEID << mctp::HEADER_SEID_SHIFT)
+                    | (mctp::HEADER_SEQ << mctp::HEADER_SEQ_SHIFT),
+
+                nvdm_header: (mctp::MSG_TYPE_VENDOR_PCI)
+                    | (mctp::VENDOR_ID_NV << mctp::NVDM_VENDOR_ID_SHIFT)
+                    | (mctp::NVDM_TYPE_COT << mctp::NVDM_TYPE_SHIFT),
+
+                cot: NvdmPayloadCot {
+                    version: chipset.fsp_cot_version(),
+                    size: core::mem::size_of::<NvdmPayloadCot>() as u16,
+                    gsp_fmc_sysmem_offset: fmc_addr,
+                    frts_sysmem_offset: 0,
+                    frts_sysmem_size: 0,
+                    frts_vidmem_offset: frts_offset,
+                    frts_vidmem_size: frts_size,
+                    hash384: signatures.hash384,
+                    public_key: signatures.public_key,
+                    signature: signatures.signature,
+                    gsp_boot_args_sysmem_offset: fmc_boot_params_addr,
+                },
+            },
+            GFP_KERNEL,
+        )?;
+
+        // Send COT message to FSP and wait for response
+        Self::send_sync_fsp(dev, bar, fsp_falcon, &*msg)?;
+
+        dev_dbg!(dev, "FSP Chain of Trust completed successfully\n");
+        Ok(())
+    }
+
+    /// Send message to FSP and wait for response.
+    fn send_sync_fsp<M>(
+        dev: &device::Device<device::Bound>,
+        bar: &crate::driver::Bar0,
+        fsp_falcon: &crate::falcon::Falcon<crate::falcon::fsp::Fsp>,
+        msg: &M,
+    ) -> Result<()>
+    where
+        M: MessageToFsp,
+    {
         // Send message
-        fsp_falcon.send_msg(bar, packet)?;
+        fsp_falcon.send_msg(bar, msg.as_bytes())?;
 
         // Wait for response
         let timeout = Delta::from_millis(FSP_MSG_TIMEOUT_MS);
@@ -392,11 +542,11 @@ fn send_sync_fsp(
         }
 
         // Check command type matches
-        if command_nvdm_type != nvdm_type {
+        if command_nvdm_type != M::NVDM_TYPE {
             dev_err!(
                 dev,
                 "Expected NVDM type {:#x} in reply, got {:#x}\n",
-                nvdm_type,
+                M::NVDM_TYPE,
                 command_nvdm_type
             );
             return Err(EIO);
@@ -407,7 +557,7 @@ fn send_sync_fsp(
             dev_err!(
                 dev,
                 "NVDM command {:#x} failed with error {:#x}\n",
-                nvdm_type,
+                M::NVDM_TYPE,
                 error_code
             );
             return Err(EIO);
diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 2ed0f6d8d19d..09e894aa7b5a 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -124,6 +124,18 @@ pub(crate) const fn arch(&self) -> Architecture {
             | Self::GB207 => Architecture::Blackwell,
         }
     }
+
+    /// Returns the FSP Chain of Trust (COT) protocol version for this chipset.
+    ///
+    /// Hopper (GH100) uses version 1, Blackwell uses version 2.
+    pub(crate) const fn fsp_cot_version(&self) -> u16 {
+        match self.arch() {
+            Architecture::Hopper => 1,
+            Architecture::Blackwell => 2,
+            // Other architectures don't use FSP COT
+            _ => 0,
+        }
+    }
 }
 
 // TODO
-- 
2.52.0


Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012004.outbound.protection.outlook.com [52.101.53.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55B243D7D79;
	Tue, 10 Mar 2026 08:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773130625; cv=fail; b=aBrzo7bu2FA6n0PZd9N6THF7aoS56HbfYSlGfBKt+63+NL+jifPRGyRk9bDTuFfk8XWDF7YPp8ujn8jBZ5tNKMXtex0rBWj9nT6bpzXkEMnu3jkf0N4lYriqGYvKa55Ml53qIKVd1YNhpdCD2IfoHupa8RQH6gx9tSFcGbN/8iI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773130625; c=relaxed/simple;
	bh=oT5Rf4+yI9uFn/X2JhBJFy56p4YLiqPmobze5Y2uxYY=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=F3sDSvo1wE57MU9kaWT5IiDu5MT82Iv+2PNVZJzSbNkAps97Lhq1CfFQWaQpO6fLu6FC5AU1j5OkNEMZz0LLquYJudJYEpGV30BE4r4YsQ3KbIg4cYKTVN1VFJSx2RiaTL0HZt0tXyK/BlYrJH2ilXE0+WYC812LYoIW2FidtI8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=lFJpX7mX; arc=fail smtp.client-ip=52.101.53.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="lFJpX7mX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uGjC3Ne3/Pw6+9Syn4sCzn5pfr4XxMRcTAdfJ7S0H/85XLe8lkpWWwRzyxb/zrwAkyP0ie5IazCVXc9QWB2nHoW0oGYmpTI6y7RKTERHkR17H51uoTnV4J5PQfHGARWq2pcrMLhP+UnQ8a0jaKQxDrKapt7K64jbbLGqV0m2OjIDCNXRUz3MFfOrTUQXRxDGJVpCxxHO21gggX5K8NgbznkwoZogXTvSY8F1le5uSVk+MJTIPJNAW80FcRft68d3pOtyAO8DGU4497Hu33hazGtQ2NIYCPnq82Div/H4vyz/dDVcIIp5yqd3zBg1Hd8+3277u0f9I48Xntsh15BR6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BdqambEv260iikzFGz7EvvaL5qF4ZK7MRAfGo9B3TAQ=;
 b=SJobKZD1H4U+4qhidSAlH28r4reguxJI19PXAtkp9RlGRFfz1kU64tgB9lC0Ndfl8BqeuFhmX1q7WtTVCo6ktttAu1U4XnjaZs/gmPC8olH/PzBlN2rTZitih4clUP+zeW9q0ipZN1uYEj0w4Ujeqpf8aCuxhiUyix8mZlp+k/AMiVdfMANi3vs/fPxK+X6E9ikdfXD++WKIp/ruPoUqsqFr4JguTvZIFVpPfAKJCsYvXAkUNfH7Em8xaFLeRtTag9ojWrecT0A8HY7ZQ1ltROHhc5vGnjH8kbDw2dB/gLaJO/cCkrqdm1iSZZkEhYMUxFWwO13fBvl458+ibSCD2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BdqambEv260iikzFGz7EvvaL5qF4ZK7MRAfGo9B3TAQ=;
 b=lFJpX7mXGOLpa+Tga9r7IJiPTxJlqelDGo6bycaSw4jrS6Df4+yJx6HOY1rk4fuq6/ktfnUh/xH6RUX82bkbqvCTTwNegJ+D9TiuuT6oHNBVh++breARsT362aSze2IS8hNapa9iuOoPl+zA3/WhdZHy6gglx0LZJO5/CY48+jmYikvXW+v6dpS5I/BToj6y4St5wUAfEeblL2+NloSPLGSzb85FJFtHpSdxv56AJ2BDIB/8EO8ke7se9c7ShJTkTslZWAX+aQDIdXqV2lRU1tC7n2EhPulAa77Jfo3dyzqrZ6TvlU5dgywoZZR3wwtiayR+S2WlC5vbXXVuI99D/A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by IA1PR12MB7614.namprd12.prod.outlook.com (2603:10b6:208:429::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Tue, 10 Mar
 2026 08:17:00 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%4]) with mapi id 15.20.9700.010; Tue, 10 Mar 2026
 08:17:00 +0000
From: Eliot Courtney <ecourtney@nvidia.com>
Date: Tue, 10 Mar 2026 17:09:18 +0900
Subject: [PATCH v4 4/5] gpu: nova-core: gsp: make `Cmdq` a pinned type
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260310-cmdq-locking-v4-4-4e5c4753c408@nvidia.com>
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
X-ClientProxiedBy: TYCP286CA0287.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c8::9) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|IA1PR12MB7614:EE_
X-MS-Office365-Filtering-Correlation-Id: fc45e83c-cc8b-408f-c40e-08de7e7d6764
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	aGCmKutfdmdGt6kUNHnX82WAxfVvPWOjL00FkKc/ywoNvDSVSIV6SfOrBNt1kj5DTBm9z6FGrXq90l7cCrfSS8s7iIWALPOnzm2iNmmxUlSkpCaM9bODnISPdePLxmrhot5oSD+9KozZCWIlW77g6IgMAREKe0aK5ZZqAjGG1Bcuq+QGGNgG5tsLyIqDrro5KKjSeabo4vvTxhqCB1IXPnYev2CVAVqMxU59kbiM/y4CFKPSPMARWU8Wl9P/snaWjmp0c7CYDi2w20XYp/ofn/FJ/9M+eRk+T0pVACuhNJHjzBUDzl8H1NH2owfnEoDgfo9jp6Gwt5fs254cWKakzhxKjpOGNLXuExbJd4G0EjziIddUn9BKFZ5yF2cV5lhCA+JPME30nb6FxXlhhC5zmJ7uCfjBhoIc+YEMSqZQa8OlSPiQBZMKozu6aWCyHnVNdTmF50NIBc+bxffytkvuFQFU+Kfjpn7QrsV6E60W369YxzvzQNJBb3wKuXgV9A9XtCopUpmumH9ZYOQJlN8CsUY7gMvxEHDCc0oxvADYVEjQlXqyIooGKizvs0Pppaus17Gj+ayalkNdwLxRuQaXgPCZWmFUZugE5WCq8ZxRU7jF3f4YzGAzQ2wlmUBC/lRikDlVXTFJGIzi2OPxUGz3NjU2fxFSefPBcPzTWSyw6m3cnJmsTbQQiNed2F0lwSDDChDAj+R25PdDvpxseNNNJH/Hw7V/L4afE0/0DrIHpM8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR12MB2353.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RmlBUkhlRm81dExtZ1pNR09nQ1BkWEJ5NTdHNzlmY0RRMlFGNjdQL1VVS1ZJ?=
 =?utf-8?B?WHZEWVFVUWRyeWZEMEZpOWkxdXFuM0wvSmpYUkM4Q0VhS1pDTzcweWdyb1VT?=
 =?utf-8?B?NnQrTU9WNVU0RXdjemZxdHJTVnNIY01idWxGaDUvUVpBOFROODAzaFFPWlNl?=
 =?utf-8?B?UDZXcjFqbVBiRjhNVnZlZG5sZlBwWUdSZDNFOXB6NjZGOEIrcUhkTkRGTEZu?=
 =?utf-8?B?ZlZnNTBLSTIyS25LdHFjYkkvVUdpQmg2aFEvMjIrQmNSQm1CZ2w0UXl4a3l6?=
 =?utf-8?B?VDBxVHhMams3V1AwL09YK0xJUDdiS0RGaFdCWXJ0b2psSDFTSC9tV0VsWWR4?=
 =?utf-8?B?RDdUbllCa1R5TDUxWjE4bCtvQkRmZ0Vkc3lOdGYyMm90NUZZNVo3cjBDU29U?=
 =?utf-8?B?V3g2SDJzZ0ZRVlZrRzlCVXVUU0lBYmxuTjV3aVNzVCtodTQ3NGwxaHZQR3Fl?=
 =?utf-8?B?ZUlPRW80Unc4TGxPak40MVRwcXgzN21PWXdKRWluWlhRREk4M0hnOXpMWTBE?=
 =?utf-8?B?dXZXdFZiSk9sdDNUckhHK21Cc1Y0OEdCUUJUZisveGpPWkY2MDJnbDcxMXN2?=
 =?utf-8?B?bm5aZU1xYnJ4UFJZditoRTNXb1N1bk8zdlBobEI4ajlIRkZRR2RnbmRQTUtJ?=
 =?utf-8?B?UGY2OHp1bDMvQUhGUis3K3A1YVNUU0dxd2IrMldILzRkWk9hNy9rQjY5cjE0?=
 =?utf-8?B?UkJJRVRod3NYa3I5MXp3R3F6SkFZYWgwOEdnRkNuSjZJR1dXV2xUV1FGKzRR?=
 =?utf-8?B?T0dEWlEzeGZIZWdUVGRnS01sWWJOZTlFTGJxbC9LZG0rK0habjRlakRGKzg1?=
 =?utf-8?B?OHFOUGhueDV0Q05iblA0eTF1cis3YTNpTlozK2RwMVNxVjhXZEJmSUdsU0RG?=
 =?utf-8?B?b2NuOEhRWWVFMnVaRHc4MzlnVFF3bUcweXJhVlNjOC9jcFhpY1VwU3BrSmlH?=
 =?utf-8?B?c0JDS29tTThJdHk3V3ZsZkRMMFR0bTJ4RW9la2RQRjZLbVBwQzJaRlJJKy85?=
 =?utf-8?B?MXNsN1pKU2NYZ2loUFJCdURBb3dmZThtUU8wY2tVS1B2SlE5anBheFowdGs5?=
 =?utf-8?B?UmtNVUtjb0MvWFJZUlMxMThEMEtIK1d4NmN1ZFRMc1EvZitTbC90dTZGcE5y?=
 =?utf-8?B?TnF2VjdjcWFkTXVYM3R3anBMUE5ENzRQMHlVSXFXUnk5RWxidVZ1VTZ4ZHBa?=
 =?utf-8?B?L0F3c0E2YUVpSFNCZ2JUZmFEZVJYOERWUjBETi84Y3k5ZzZkZWlYYnlWLzQ4?=
 =?utf-8?B?T2RKK05UTXZQR3M5bkI3aUFkYlE0andGdmpHZXErZXhhZmt6anloZC9va1Nm?=
 =?utf-8?B?OThlNTNtZVplVE9iSExkWHhKMlhkWS9OK2p6VFArRlhieUd1aC9NWmZLNjZ2?=
 =?utf-8?B?bmFvck8vMHhHYkJ3T25xMlBlclFzZFFiRUN3Z21FczJQbTlNZE90ZXRTRDRF?=
 =?utf-8?B?VFZXOWlLTGp1TXVydlp6TVcwKzAzNXZoVnNqaGM1dWlNK29TK3gzcmRRd05J?=
 =?utf-8?B?U0hnUkduSWc4R0dNL2VkTVdSamFFaWxET1lRU3pWM0hMQUJFcUQ1eVdpYmhB?=
 =?utf-8?B?NC8rMk1BMlJpMUFrRVV0ZVk4YmtUelJuSUZyaXNjUmFZUzkrSDloVUNTQXdJ?=
 =?utf-8?B?Z3lHbVhuWXVIWldIVWZiZDNkUXRDM2p6ejl1WDFyY1RSRGJtUnM0ejJkYjJl?=
 =?utf-8?B?blNwdVd4V1FrU0FmQ1BxUWw3OGVlN0R0bWcvMFNONDFPaGNYU2FwSmhWQ0lB?=
 =?utf-8?B?NlBOWVQyVzIxMkhrVnJPMnlyb3BsaXErTUhoZnFVVGJNMlJJV2RRNFc5RTRG?=
 =?utf-8?B?NE8vNkNLUHdHMitFZ3dPNFVCeVp6TnV5Y0tYK3p0ZzJlK2REWHprcE5jNnFn?=
 =?utf-8?B?TFRLeVZTdjRjOXZjT2ZRUW04L0NEdEY1VGNzdk5jUllzUU0zNmJzR2JjZkFx?=
 =?utf-8?B?RUNvM0NHZlk3QWlMSkF1YXNVcFdRd3FXcENDQXRFdWhmWWVnaFFGQktYRE5y?=
 =?utf-8?B?MjVkcDNUVXBRNEhpNkRhQWo2dk9KQWE4dCtBemZVeXNJYVBSbzh0c1IxQlBG?=
 =?utf-8?B?Z2c0WDBxajZaTTdTQnBZTU4xT2M5V0ZZNnlTS2lXV2x4b2NwaHM0MEJsUm1z?=
 =?utf-8?B?M2tJUXRuSzhSSXNjL09CTXhxanl0K3lycVlzZnBvbXN0MzFlYVpYOHlDNTBl?=
 =?utf-8?B?ZkZDQ0ZtWGFuU0E4cWxiOGlBR0xoODRNYXQ1Yno1RTNlTzk2eW1MZXFQUjNS?=
 =?utf-8?B?eThRSFdmWnNLNlcwclhYYXZ6b2dWN2VkYmxTU2o0WlpFR082cWtkdDZNcFFo?=
 =?utf-8?B?bzBzVkZnc2YzQXcvMmhreUI3VFZaeXZMclJ6Vi84QnJKVTRaQUFqclNVL0J1?=
 =?utf-8?Q?671+g4ESC2cCp2QowNVWbZcggH1zNAaT+PpT5/z8DPAPi?=
X-MS-Exchange-AntiSpam-MessageData-1: XtkSGwx56Da9iQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc45e83c-cc8b-408f-c40e-08de7e7d6764
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 08:17:00.6664
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PjsWuFyW0jZseSqcCrRrNtK9avwoDDYmGx8YhdCDtaiaHQmQ95VUzurFjufakoQIzzzHtAkCJ2NMBO8pGThUpg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7614

Make `Cmdq` a pinned type. This is needed to use Mutex, which is needed
to add locking to `Cmdq`.

Reviewed-by: Zhi Wang <zhiw@nvidia.com>
Tested-by: Zhi Wang <zhiw@nvidia.com>
Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
---
 drivers/gpu/nova-core/gsp.rs      | 5 +++--
 drivers/gpu/nova-core/gsp/cmdq.rs | 9 ++++-----
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
index 174feaca0a6b..a6f3918c20b1 100644
--- a/drivers/gpu/nova-core/gsp.rs
+++ b/drivers/gpu/nova-core/gsp.rs
@@ -112,6 +112,7 @@ pub(crate) struct Gsp {
     /// RM log buffer.
     logrm: LogBuffer,
     /// Command queue.
+    #[pin]
     pub(crate) cmdq: Cmdq,
     /// RM arguments.
     rmargs: CoherentAllocation<GspArgumentsPadded>,
@@ -132,7 +133,7 @@ pub(crate) fn new(pdev: &pci::Device<device::Bound>) -> impl PinInit<Self, Error
                 loginit: LogBuffer::new(dev)?,
                 logintr: LogBuffer::new(dev)?,
                 logrm: LogBuffer::new(dev)?,
-                cmdq: Cmdq::new(dev)?,
+                cmdq <- Cmdq::new(dev),
                 rmargs: CoherentAllocation::<GspArgumentsPadded>::alloc_coherent(
                     dev,
                     1,
@@ -149,7 +150,7 @@ pub(crate) fn new(pdev: &pci::Device<device::Bound>) -> impl PinInit<Self, Error
                         libos[1] = LibosMemoryRegionInitArgument::new("LOGINTR", &logintr.0)
                     )?;
                     dma_write!(libos[2] = LibosMemoryRegionInitArgument::new("LOGRM", &logrm.0))?;
-                    dma_write!(rmargs[0].inner = fw::GspArgumentsCached::new(cmdq))?;
+                    dma_write!(rmargs[0].inner = fw::GspArgumentsCached::new(&cmdq))?;
                     dma_write!(libos[3] = LibosMemoryRegionInitArgument::new("RMARGS", rmargs))?;
                 },
             }))
diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
index b631daae5642..90179256a929 100644
--- a/drivers/gpu/nova-core/gsp/cmdq.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq.rs
@@ -475,6 +475,7 @@ struct GspMessage<'a> {
 ///
 /// Provides the ability to send commands and receive messages from the GSP using a shared memory
 /// area.
+#[pin_data]
 pub(crate) struct Cmdq {
     /// Device this command queue belongs to.
     dev: ARef<device::Device>,
@@ -508,13 +509,11 @@ impl Cmdq {
     pub(super) const RECEIVE_TIMEOUT: Delta = Delta::from_secs(5);
 
     /// Creates a new command queue for `dev`.
-    pub(crate) fn new(dev: &device::Device<device::Bound>) -> Result<Cmdq> {
-        let gsp_mem = DmaGspMem::new(dev)?;
-
-        Ok(Cmdq {
+    pub(crate) fn new(dev: &device::Device<device::Bound>) -> impl PinInit<Self, Error> + '_ {
+        try_pin_init!(Self {
+            gsp_mem: DmaGspMem::new(dev)?,
             dev: dev.into(),
             seq: 0,
-            gsp_mem,
         })
     }
 

-- 
2.53.0


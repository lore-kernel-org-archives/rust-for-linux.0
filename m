Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010057.outbound.protection.outlook.com [52.101.61.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 327D93542E7;
	Sat, 31 Jan 2026 00:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769821015; cv=fail; b=GWxyEXhz9pAV7+TdR4tPYRGN3uVj9E0CG1IbUFutmsicOGDP1SuN96hG9bbJvVs3eCl3lkm79RFhWIailECttlCQBJAc9clwmH64fCgfNYqUErpEbdcu8MvvIhQL2Pd5iJKefPC0hrgX4sdXBP8yRroQoJc2tHeexd305mhKX/c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769821015; c=relaxed/simple;
	bh=SPDMqE75HHO3FwiBy74MQO+wSDapimGsg/MG4tCGQts=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=FVJ1BzMCJo7VgeTNZFuDvcqPwOIybb+bprqNhGos2r/RHjeqTXFXeTLgVN0YUbBr4OS9lHacaIzBmodR5rt155woqT++0mPd24yN/P/znYKzyqYy3m7lvyv64PhLGM4tC5EuhlvjwlENXlb8IthKJpqaAYjVA8P9PLaYav64Q8A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=WQh2osBV; arc=fail smtp.client-ip=52.101.61.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="WQh2osBV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gD2Tli9vkDo6MDMS6DPpl2h4UtuNWfeEzNvjn+tdLbHlBynH0GjmA654RvPhi6bFrpoNxahQKUyxR+U2gHQOHMyETUAz7xNhJ5QsZJaxEye/1qQeQ6pXEhGQaVsbbvaJvZhSkEfopqwntZE8l6Ju50SSttRaSuSptUZyomdkbg9dTut3VTJj38UoFozNcWmSNFHrFsoTz4SOW+shSxA6eoANU1ZwNZP6dUNO5i5w7C2YlslQbV3GaXdF5HbBss8EOjEgYqknUsGM7cci8m+DprKBrnxmtQdQcQi5WWBi9g9+SwmL7DjLImkDDu3I0I5M0zQ7SFqAgpvrFAlw1v5MEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/JQTK89OC82MEFNC6WQjAwBEagL5B2wQvx1RWTMEH2U=;
 b=gy5/CI/juAg/C7/hM7T6UaCUfmxE1nr4FJ8nkJss1KrP9O+PmP8bpgWiO6vnWQ/9V26KDhiKk/EFp4oZcBf5idkMTdGT5vkfOBFUd3AZEZH3b1Mzo/pmjid453QxYqKlZCNyYFf6OpQUKUspHR46QJBGU/TvuvydS5LWfUpDnOegxf3ngtpQXY0KAxi2ubmOXNEZcCbc+u+Dp/hdpw61aX1V8XWpgbyP/oRBtR7/jTseapGhp+2kPppc8enlU1/W2L60r+gjpXdhANXwLxTy7rTC1W55D+bK7GXxIwoNYjAUFU08MQABD7Mi9/p/ChIcEbAnUJS9Tllc/XcsxPgN7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/JQTK89OC82MEFNC6WQjAwBEagL5B2wQvx1RWTMEH2U=;
 b=WQh2osBVm5XguRgmztsPdZa0/MObVHNpuUzcvIjp4gL1xK/qKsr9Tx3U+jfTxIC+I3NXQZ2QOMuzdslHJxUQhw9l/axS/HyHkMfqf2ZBJIWSsouTYnDWPlj/ToJoB6BeeAenbiE7Yq8nFQ2y5c1BleOQjOKOtAEGBedK5AdY5xj/Vwo/b9ahht6jKZUwU6VUI/F93aRVrN2epLLS3JP3XQHKQdXzuRf+TRlEiDJERh40Koqpj3rMjvyMjcbiYwsBWWJh8NbvAyR7jv/tRsWAQiIk+RRQ/8ryeGpL7lrvDAX6FQrujgoyCoxrK84t3JzVe9FOEuywru8QseT1sYLlHA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 BL1PR12MB5945.namprd12.prod.outlook.com (2603:10b6:208:398::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.11; Sat, 31 Jan
 2026 00:56:49 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9564.007; Sat, 31 Jan 2026
 00:56:49 +0000
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
Subject: [PATCH v2 27/30] gpu: nova-core: Hopper/Blackwell: add GSP lockdown release polling
Date: Fri, 30 Jan 2026 16:56:01 -0800
Message-ID: <20260131005604.454172-28-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260131005604.454172-1-jhubbard@nvidia.com>
References: <20260131005604.454172-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR04CA0021.namprd04.prod.outlook.com
 (2603:10b6:a03:217::26) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|BL1PR12MB5945:EE_
X-MS-Office365-Filtering-Correlation-Id: 7967071d-9ac5-4e29-395c-08de60639d66
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?d4YbDbZya26a61CesO+0x31HCWLVxcQlyUmIYmmIggYfhH1y2TZ6lXbaVtEX?=
 =?us-ascii?Q?U2WSryB1WAj9J42fbJoJwYHH6/Y17dx0gmdtUQIlxhxXgAXNWhxIUPtVkdgE?=
 =?us-ascii?Q?ajxv/fWypD+CasDwTbnAiqi5q9hFxGBMzk3Y4bGSOoHCnEr9S8PB8rg8wr72?=
 =?us-ascii?Q?ldz8choKtY/OKbKB+EGqYQDk3rInOm3EBbSfWmVsxtqbyaRcfDjJxcXZXwzX?=
 =?us-ascii?Q?sVNQIaHle4M3z2dpU6I37yMozgfBBBUq4ck3PfXSKxSEat6/P5R0mh9DgcED?=
 =?us-ascii?Q?E50FXjC0qCyn/biM9A9jyzsBP+RZv0bC67WRLpsKmgzcPoSwWkLekNfkDBaV?=
 =?us-ascii?Q?vIzAJ60vFsREAMCwppCmrOFdOQ94jl0JB2H9+9EBL+Xw6gwo1cGYa/ZZ+GyN?=
 =?us-ascii?Q?aKB4V3D9V2tlhvzIMGUy78md2ay0lxX7mpS0uLlPzvfkoJ/IDoM4iLqS60Kg?=
 =?us-ascii?Q?OL1lGfHm4Jwz1pLC+ULg908Vzj6NKSLti0NaeT/7gJt4B0FxAE+5dXdogaSV?=
 =?us-ascii?Q?R2j1Qe+H4dR6tCs4DqkaGUJfx0fFNu1Y8U8YyOwoYu1h0XSJ8b+3Asaa+XZh?=
 =?us-ascii?Q?UbjkJrId9WFYpPAPME4mUna3Cu2UUSgSIB7X+OfV4LBBpXIZV/yzBEbqrmhh?=
 =?us-ascii?Q?jJujwk+ewpS6Nrb7xiJb5bxntnLwCjrf9+VuOQKkvTCDlJka9fYgO4bztcem?=
 =?us-ascii?Q?Sbyrwyn0LD6fnkpwORq2B1asYk5WpHAVhPTof8a6l8dXfIrBOZI8kTtud22W?=
 =?us-ascii?Q?Beaoqzo7XpLATjLEBX7ehyB+mEviS3nhgWh8IhGcRhvp6tgebqJs8raWZYEw?=
 =?us-ascii?Q?GSoUs/oO0ZZtqSCOw24oc/97aWR0I5+1krdn3WSF3hmqPGvYimn56UTAq9Jn?=
 =?us-ascii?Q?C94/RyCEo0nWJzQ01Deq1RgmT3mQtOjpMrncKmpCNNBfDVipE+9j/q+5OExZ?=
 =?us-ascii?Q?lJLbi+dB36SskjBN/AirQRSimFNYgv/7+9glAFopA9O2OYh06j7o+rUK/Sga?=
 =?us-ascii?Q?BYFOXRrzQnzc95ezJve6dkG9c86zOtqnfC44T0GwJj3ESvNgzVUAbu7G2PKV?=
 =?us-ascii?Q?2x4g+KHWZxcnBCTfJi1QT6AY1qB/63rfr6S4zh4T8FUvyONHw+M13phxEpBi?=
 =?us-ascii?Q?QFD5Bm3Vhbd7uUcOsIk0DtV10YGsQC2CkLgPPtCWFkQUIBjjKdJJuNjmS3ud?=
 =?us-ascii?Q?iDnkhA+OsIQPv7q3Nmg75TginijHHGq12Ek7VZAP05CMRGwlQpjXVqa0f60B?=
 =?us-ascii?Q?z3Et1yJ2Dk0tJXWEpuHoIpii5rMDKHxWD4q2BtuFZaLpmv2PdfTfb098jn1t?=
 =?us-ascii?Q?7fFOUNXHX9ENEZSqqMviK1SuiHlGxT9PRTRS3ODX1fIJ1layDYH0akbKwUyt?=
 =?us-ascii?Q?tJkG0Yn/NnRJD9dw924ePE5ywB8IszcvHDdtY8ZtLSTxb7Cv8uEX/spEhiWs?=
 =?us-ascii?Q?YYNaMflAsGeAB33YthJghVnO2jWBULaBPVszp1txiInyCGjmcL71ZthCfVsv?=
 =?us-ascii?Q?epsuSMJGodC8CNIeJHljpix4ikkgOAVOUlZyq5OQXe16K2YFM+Ttw9DUWQTl?=
 =?us-ascii?Q?9cIRGRy++o83s2ujiGI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0nQbaBSIa1DDvJerlHAb+DM9V0tr/3aRZtBI/VkqAoqS4Mi0IAPjI4eJHcoX?=
 =?us-ascii?Q?hyrzsuIScMMoiLD/QTGcLr0D2cCUHO6cczPFmUHcb/Wl0JcIJPl6rvWYbvu5?=
 =?us-ascii?Q?vVrdlD/3a6yLe2IHgKBw7hjNnF4pbP7cQV64GYm0o6LeRGuTYUJzejbOrip5?=
 =?us-ascii?Q?o/9hA4vumeCuu08Skc6udsXreHPaeMCvI/JB8ARtLaWnKiyiDBemKXM3rpaE?=
 =?us-ascii?Q?UGAEedfG+ysrbWCc/CY2fQ12vvQg8rKUAMrC8UDtkrDLhVPeGu51MD62S4Xe?=
 =?us-ascii?Q?Pnyo3BjpVKuji6FFckSBBlR5T4puXN1XcXQtJ3k6/bSiJJMH+wN7QOw8GqO/?=
 =?us-ascii?Q?CaIGpSH5N5fEplv0yDvAMsdGTqtWM+wNrvI+FYBuFOHZYCsqzVABI3BbSUVn?=
 =?us-ascii?Q?7+dSWvqzQSF16BeiFZ0GdAnYAe2zo9K1+sCJ3K9RPLTOOVZEvr2iRMj/Bxky?=
 =?us-ascii?Q?OBDzG5GKfUtsojvZRA/sUQboIflV0IsP3AJOXRBq1VJg4JruJC84oVoUfBb6?=
 =?us-ascii?Q?OFeT3RUUim7CF4v6+ktXQGfzpGkUGyF8+GZARypVOEpxkzgWMNrDB6bR6ra7?=
 =?us-ascii?Q?g4Ha6d9ObMC61j4tvEM4HkbT+JF/c6tAOTe6X8jxSztLfQUb1OtPhpG2TEOP?=
 =?us-ascii?Q?ZbmLViiSbljTafVrakIB9NHmET87KGIEk7ffaPyiK0BmFCAESo8pvruCdO1J?=
 =?us-ascii?Q?5r0IV7+4kOoIRp9kY4YBa0pAdusxAvACfkyIzWNxWvaeV9fOM2YgO1zUcbBe?=
 =?us-ascii?Q?JE07g3PNMJNi3A6SGQN1i/zDc7fy10199YTTZYCEpgab1pvLmmpXCUA3fHZL?=
 =?us-ascii?Q?XxNidWtakclMXvUzUMFnZKt3tz5zdhhYGryApIF7wTPXJqSpTDCoeZk/4kSD?=
 =?us-ascii?Q?agi8P1loyrJkzlelXrMd8YIb+IItRzPdIDekAQR3bpjUQZ0DBtiPnzMTFphZ?=
 =?us-ascii?Q?XtCADe0lrdbL2NrxhPd9LS7N/j4wUb1CgnwaTk9FBLOEnHkqYX1j5inAT8MJ?=
 =?us-ascii?Q?pCWvhjE7L7dpYwHbm2V4qydOaFFfy/z5kdK1n701Vx0ChLhpApt/U8jJugR0?=
 =?us-ascii?Q?/zLr4SQLPDkevid4uBxjeQIMP19o4aT5tra+QhEoFMiRuwmuUBkvmPOf16sZ?=
 =?us-ascii?Q?vitAhAZ2KUXDsxQJgqz3yVjOdL4N9Exc5U9ojBg6ukVwwph4DuvO27APv7SR?=
 =?us-ascii?Q?8CmTXv2XfYG1ukkA+EiYr6xQ/SP3IS0VPxTewLSEPOu+D9JGEu/CNQ25FWKh?=
 =?us-ascii?Q?CmXhicaIIS4hqb0wy7iyOnAIRdjNKcI9s0WvKaTErXdfVv0bnQ4ONBVraZj8?=
 =?us-ascii?Q?aXgi+ro4Xuy3mPR0DZjemyr5eYFCWp8q8ZQ7ZXJWRjmVYq7BfDrbhpyOblRe?=
 =?us-ascii?Q?3+mfjnpDOMrhSnR39Wdlbs5iEn6CjsyVxI64b45z6H8OdOpkkSEdbT5hDmzj?=
 =?us-ascii?Q?/NIrMu1Yzfeytd5tt1bJ5+ZYOcIeqPKuf720yI6ru9l+h1fqKf7vrlCFIYZl?=
 =?us-ascii?Q?5KNoPY/TarF9d++LLJmQzIlzKEzvESfKan3SvBUpXFybMec8jpu/YrRgmgfW?=
 =?us-ascii?Q?fW/z11mmYLcbUIVNPYGsdUQh3msYDcGpzZI+BDfSWEYaEthjD3gJsHznnscN?=
 =?us-ascii?Q?I4J0PD2ER/aeBBJHhAozP4ZAdFdr36AgoBVUfb7OrVhzt08q4Z814hwcAZCZ?=
 =?us-ascii?Q?tPLJkzHHBLyH/ttu1gE9n/EOQEGUg3eIskB+ABI8+atCRTGHxKrtJOQyBEA3?=
 =?us-ascii?Q?g20nH7YTwA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7967071d-9ac5-4e29-395c-08de60639d66
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2026 00:56:49.3548
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CgNgorgcyO3rBJ4TkdyWKCyFf6Ibg81XDRe+KHR+p5tVv1Vz88+WCCUXoPwSBMCh+dwn0jFcmyrg4N6t45jfpA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5945

On Hopper and Blackwell, FSP boots GSP with hardware lockdown enabled.
After FSP Chain of Trust completes, the driver must poll for lockdown
release before proceeding with GSP initialization. Add the register
bit and helper functions needed for this polling.

Cc: Gary Guo <gary@garyguo.net>
Cc: Timur Tabi <ttabi@nvidia.com>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/gsp/boot.rs | 88 ++++++++++++++++++++++++++++++-
 drivers/gpu/nova-core/regs.rs     |  1 +
 2 files changed, 88 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gsp/boot.rs
index b6aa6dcec28e..178e319d48e1 100644
--- a/drivers/gpu/nova-core/gsp/boot.rs
+++ b/drivers/gpu/nova-core/gsp/boot.rs
@@ -15,7 +15,8 @@
     falcon::{
         gsp::Gsp,
         sec2::Sec2,
-        Falcon, //
+        Falcon,
+        FalconEngine, //
     },
     fb::FbLayout,
     firmware::{
@@ -154,6 +155,91 @@ fn run_booter(
         Ok(())
     }
 
+    /// Check if GSP lockdown has been released after FSP Chain of Trust
+    fn gsp_lockdown_released(
+        dev: &device::Device,
+        gsp_falcon: &Falcon<Gsp>,
+        bar: &Bar0,
+        fmc_boot_params_addr: u64,
+        mbox0: &mut u32,
+    ) -> bool {
+        // Read GSP falcon mailbox0
+        *mbox0 = gsp_falcon.read_mailbox0(bar);
+
+        // Check 1: If mbox0 has 0xbadf4100 pattern, GSP is still locked down
+        if *mbox0 != 0 && (*mbox0 & 0xffffff00) == 0xbadf4100 {
+            return false;
+        }
+
+        // Check 2: If mbox0 has a value, check if it's an error
+        if *mbox0 != 0 {
+            let mbox1 = gsp_falcon.read_mailbox1(bar);
+
+            let combined_addr = (u64::from(mbox1) << 32) | u64::from(*mbox0);
+            if combined_addr != fmc_boot_params_addr {
+                // Address doesn't match - GSP wrote an error code
+                // Return TRUE (lockdown released) with error
+                dev_dbg!(
+                    dev,
+                    "GSP lockdown error: mbox0={:#x}, combined_addr={:#x}, expected={:#x}\n",
+                    *mbox0,
+                    combined_addr,
+                    fmc_boot_params_addr
+                );
+                return true;
+            }
+        }
+
+        // Check 3: Verify HWCFG2 RISCV_BR_PRIV_LOCKDOWN bit is clear
+        let hwcfg2 = regs::NV_PFALCON_FALCON_HWCFG2::read(bar, &crate::falcon::gsp::Gsp::ID);
+        !hwcfg2.riscv_br_priv_lockdown()
+    }
+
+    /// Wait for GSP lockdown to be released after FSP Chain of Trust
+    #[expect(dead_code)]
+    fn wait_for_gsp_lockdown_release(
+        dev: &device::Device,
+        bar: &Bar0,
+        gsp_falcon: &Falcon<Gsp>,
+        fmc_boot_params_addr: u64,
+    ) -> Result<u32> {
+        dev_dbg!(dev, "Waiting for GSP lockdown release\n");
+
+        let mut mbox0: u32 = 0;
+
+        let (_, mbox0) = read_poll_timeout(
+            || {
+                let released = Self::gsp_lockdown_released(
+                    dev,
+                    gsp_falcon,
+                    bar,
+                    fmc_boot_params_addr,
+                    &mut mbox0,
+                );
+
+                Ok((released, mbox0))
+            },
+            |(released, _)| *released,
+            Delta::ZERO,
+            Delta::from_millis(4000),
+        )
+        .inspect_err(|_| {
+            dev_err!(dev, "GSP lockdown release timeout\n");
+        })?;
+
+        // Check mbox0 for error after wait completion
+        if mbox0 != 0 {
+            dev_err!(dev, "GSP-FMC boot failed (mbox: {:#x})\n", mbox0);
+            return Err(EIO);
+        }
+
+        dev_dbg!(
+            dev,
+            "GSP hardware lockdown fully released, proceeding with initialization\n"
+        );
+        Ok(mbox0)
+    }
+
     /// Attempt to boot the GSP.
     ///
     /// This is a GPU-dependent and complex procedure that involves loading firmware files from
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index cfd9d6f0de07..fc325b90feb0 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -284,6 +284,7 @@ pub(crate) fn vga_workspace_addr(self) -> Option<u64> {
 register!(NV_PFALCON_FALCON_HWCFG2 @ PFalconBase[0x000000f4] {
     10:10   riscv as bool;
     12:12   mem_scrubbing as bool, "Set to 0 after memory scrubbing is completed";
+    13:13   riscv_br_priv_lockdown as bool, "RISC-V branch privilege lockdown bit";
     31:31   reset_ready as bool, "Signal indicating that reset is completed (GA102+)";
 });
 
-- 
2.52.0


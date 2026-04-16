Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012030.outbound.protection.outlook.com [40.107.209.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70CC519539F
	for <rust-for-linux@vger.kernel.org>; Thu, 16 Apr 2026 00:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776299211; cv=fail; b=do3+7ujiuJDHw8fi2Uh7wtONSN7VwZ/TRK1LlD/+w9NNxCCMYx5g8h9RfMIXuMiHZDk94gQcJGC3yBfR6AnE/UNgJepEfFfuzUdj226ovVafLZGTb001tdaQPpl8fVWDRalBX2Ic/amp/zsM4rqBXXF+afMSDe+3Qv8rdKK7oNg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776299211; c=relaxed/simple;
	bh=k/rUagfYaAmMfTxffJW34ApSjhTt34YGcRLtVG648rU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oN7OfNPPgoqi7qPAGWuKyHWOIrYs+XI8oGq/aShxbwV3XM6XHPY53+JleyvqwoM+g0ojfJJ8ZT6fVW1+xCFeovffDBwrviQ3fFRzpTbDB0BsNDgJoPMmpcHcSc+VqhzBKgLNalrJDX8XQ97+a4ygqKnlx9V1LV4vAvkrocUg9RE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=pSao51Bf; arc=fail smtp.client-ip=40.107.209.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="pSao51Bf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pfT4CyDnAwdfVOl0CRELNcPf/Juwvb3B3QDQ03ttYoqhfaODWAnZ2T7rqAT2Swh4BzGsyW5N9Jiei4xWZQyFZK13k2iDJkZKdDFHNudNDqpFkPyHTuiAG99PFg/OO8/OE7bYJlVrF6jvcaX4DLKp7UtVze//H7S2qZbDiRvvRD0HAc4SrepDGVk8iC7CM8m/oDRndiBrYY5KoG1SjMmTNUuvda1zWS3zZoIwFSRs60hfMd3nGB4eATar/E0PNqiaovwgDqyYLfWridR6xLBZeeTQDXTD8Sis6+0H3TIgJHMklgCB07W6fqlsbPuHa4aCfz5xJrew/JgdviiY+AsYPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aRuZ5oM3Hp/ayqwRX9GjIkelUmWf9NZOJ/uEi3a55Cw=;
 b=y+N+Y+f0844IBGmmXPnyw07Eb6b4/eIpluCj6JbSirgx/he7zVeWDXNGgzsRCeohWfdkh/WpQvOVuQ0s/q6SPEevS3Yop9k7cpk3Q5EbX2Lb0To7JvCC4gjPJBZyJqm+tXoaNhXAIjjsWiloltqbD/oznRZXGG5iekLPe/7D820krS+SdiVBuzzxvCdGChpA74eCVMrjI4SOMF/qI+M3GfK6QcQ7A1TRcUCDsR9+RN+DDq43/3o26APmmbXLA9qVH0vxLGsoYQvk3LFFETvrCW6pqYcwRw2U6EE2pN71PkCi6/3J48QJhKOPDNL8zwrlGsMeUwBUABkvlLdzeDGVpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aRuZ5oM3Hp/ayqwRX9GjIkelUmWf9NZOJ/uEi3a55Cw=;
 b=pSao51Bfb0jJSFZ2btobuwHTV9ucZdqS2DkVmgCQtlOE/GGmBUs0Irc1z2ihM+00weXijVbLhsbVb7EgQTzw9ASmirYyhQgS2M6FUlCtL1l0lGXLGhfP6FQU1ciXKCdzYbkLTl0gV7DFZkLv4Y1DU1qVdo4YuZT71VhGoDD2F45c/QBV2/j/mlJvDSwzbCGx8wDmf8SaiBm+YszYy2bVRC1oNBWjlELh/1Ncj51PCWc5Se1ZSYuELJ5hdNJWt3GArFMFNl2afleN+t2mhuIhtCnVTwbOQdEVza0fw3UKg3IBLByjA8z3hgZr9obOX4UYZxWVR9zjVOPu4MQJaWM6rw==
Received: from SJ0PR03CA0038.namprd03.prod.outlook.com (2603:10b6:a03:33e::13)
 by PH7PR12MB6979.namprd12.prod.outlook.com (2603:10b6:510:1b9::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.21; Thu, 16 Apr
 2026 00:26:46 +0000
Received: from CO1PEPF000075ED.namprd03.prod.outlook.com
 (2603:10b6:a03:33e:cafe::7c) by SJ0PR03CA0038.outlook.office365.com
 (2603:10b6:a03:33e::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.51 via Frontend Transport; Thu,
 16 Apr 2026 00:26:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CO1PEPF000075ED.mail.protection.outlook.com (10.167.249.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Thu, 16 Apr 2026 00:26:45 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 15 Apr
 2026 17:26:30 -0700
Received: from ttabi.nvidia.com (10.126.231.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 15 Apr
 2026 17:26:29 -0700
From: Timur Tabi <ttabi@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot
	<acourbot@nvidia.com>, John Hubbard <jhubbard@nvidia.com>, Gary Guo
	<gary@garyguo.net>, Joel Fernandes <joelagnelf@nvidia.com>, Eliot Courtney
	<ecourtney@nvidia.com>, <rust-for-linux@vger.kernel.org>
Subject: [PATCH v3 2/6] gpu: nova-core: do not consider 0xBB77 as a valid PCI ROM header signature
Date: Wed, 15 Apr 2026 19:26:15 -0500
Message-ID: <20260416002619.900779-3-ttabi@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260416002619.900779-1-ttabi@nvidia.com>
References: <20260416002619.900779-1-ttabi@nvidia.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000075ED:EE_|PH7PR12MB6979:EE_
X-MS-Office365-Filtering-Correlation-Id: 32dcd38e-5f18-4891-5d08-08de9b4ed786
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|1800799024|376014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	xcA9YOomfIJ0VrWVZSXTVOPuuSmqUaCBOyHn+cx4NWyamtShNwCV+u1BBBzqki4wUT1QhtlMoJ91iF57zzWb0Qbn+rWyvniDOR8glGz2A2r5sHpeG418R7PSzL5HUslzMdkOGnXgh4AcguLaoJXsK95vHrgVDX+4tOqYy/ENq4455wN5Qe4KI5ouV6wVkJsdV5tLKh4QoybdshtOoBqr3PhqElzvYsxW7vhn1V1SsDhr76C7yvkAR9U2ksThBEklFHZOwIq3ZdSziN1Amf5jeaxxHEa3BLbRLXYZt8i8w/B6kAPB9BjKr+cO/6+i/oQ0FSCuPE8oWccxjAex1NJvsvUGOMIlYhDgdF5aVvlmZuM+lS/o1xj2LqetlIC52/F3fTRh92xngiHkhckg+od0qXM4YwmJ6qguUxUZgLvERWXV3K53eo2J9j0q/2RXjxihLy+9invgWpq7v+YrhkgeYq9UXZK6GxBJY7vdBw15jB/LoZ5UZXq7NPohV6xLP2n7VlfwDOEeOUV098yANdi7KFTErWu37rHqkIPKIck5/2fClx+1BFkqlJZGviNwXkuyCRwonUVrmI8fmov3JADALwdBhTerRvDeqJqJoQOsQTU/OBnBNSXoC14R69a9eIB2q7fFcvVB0MUbi3zHFXqvwDpkkenyMVaJ7EU9KnXuOtfcGBGbT/ASHraojF/CYNkxbUhtEBda604pDA8l0M/qhmxbJY+Lq6EOCKkMB+/hkYDlnus9iuobtJ4vt1p9xixEVjrCw4hlhpgTiv2/vzbpLg==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(1800799024)(376014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	k8Fc/XGVAiPib+/epWMXIeOdophbDN1+5qmedWG0u5orswKtY8aYdeS88mU/CXgOCxBPuekGKY2F3biSaX52kF3ZvAnjvMev3+c8Q2VOADZAV8YBn95T06xTyJCpBTveharoJHYmPJoBCSXtR13WJx2j1YvN0L8g9LQpObYtNwb6eiRQcKkHQN8bx8Pvzo15p3gDXZyo9T2ezGvFvBdFnmCPcXr79TnA/HuCjSeWudZq6LZ/Rlfgb12je+TZ2owm+sjw57/ikMXocKY+OnNoH+oqukgUTRJ43ptmufHv6Dd3knwlZmS/INV3rKojZasSU0SzA8lJNEZDoj4yyQcNVZXw7hUkvdkzioCoxpybDgIrkoeZ1LJSYs/+0qcz4wuSdqN5Fs3K3cXcLs58UP8M0KNngEfYz6hEFx1G0drbAqahksJGkUiLtCUQ9xS0/zQh
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2026 00:26:45.7924
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 32dcd38e-5f18-4891-5d08-08de9b4ed786
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000075ED.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6979

Nvidia GPUs have some PCI expansion ROM sections that have an Nvidia-
specific signature instead of 0xAA55.  Signature 0xBB77 is actually an
internal-only value that has been deprecated for over a decade.
Nova-core will never encounter a GPU with that signature, so don't look
for it.

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
Reviewed-by: Eliot Courtney <ecourtney@nvidia.com>
---
 drivers/gpu/nova-core/vbios.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/nova-core/vbios.rs b/drivers/gpu/nova-core/vbios.rs
index ebda28e596c5..e726594eb130 100644
--- a/drivers/gpu/nova-core/vbios.rs
+++ b/drivers/gpu/nova-core/vbios.rs
@@ -491,7 +491,7 @@ fn new(dev: &device::Device, data: &[u8]) -> Result<Self> {
 
         // Check for valid ROM signatures.
         match signature {
-            0xAA55 | 0xBB77 | 0x4E56 => {}
+            0xAA55 | 0x4E56 => {}
             _ => {
                 dev_err!(dev, "ROM signature unknown {:#x}\n", signature);
                 return Err(EINVAL);
-- 
2.53.0


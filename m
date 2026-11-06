Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.126.82
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793962063;
	b=Wnc0zK6uk5g8DfgjtqYqi/KQh0SKeXoyCCtdq7vToAdOuwBCWYdU465nu//Y5912bn9f
	 0nz9Mxzf/rs1Eg6xsKC8JywQxUHHONLQi7X+n2X+M9ojcdeJY3ae4VXhSBLBNNI/MVG1q
	 CWEhLYRfurmXZyG00wLXjBaK+PxfbamKbzuGZjTkK0spiJGv2i9TtYNpVYZZsnDFggCqJ
	 VgK3gHzWaUBAxMg5O1X2yJXSGFmnTaiuv4UCVrP72/dx3DK+eNdq7wXpAGAbyoZdIZLaa
	 OUlK3sb6l+Q1dJoqoe5VaYBisoH26M31DjDARbVDnqlexoqab7Dmr/RfJdOVLBQCfJA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793962063;
	h=DMARC-Filter:Received:Received:X-MS-Exchange-Authentication-Results:
	 Received-SPF:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:Content-Type:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=hy9gFYTveJgCHC3VkCJIkxsZGmNRezdUbbJ0LlXZWFc=;
	b=B3FrJbujE3sK5RCTbT2Vwaa0DRJ58h7l2MexRPsTD1kydyfzNMoNN5rCcBYKg5oGUTeI
	 lS7qgATzX60ZyLgSB94+WI2xvNcIpzo6VZ7zF1XnXqgrC24p8ZwCSpCb//wbgbyBPlNPv
	 L2dKDt9x6AmhODc/6FkKBoU6fZQcQGbzolzD3rcRiLbRYS+iQpzYDqIwowQG0mRc8STY3
	 2yjsGItrrht8zVOkG98up47x0Vuzeal5miuJBWmA7v8mE3eAABnaQBdoxgwkaTvGK2hme
	 o9f6bXxybsYNE/562qSqJtJAFHcf1P5hR9WJ64p+L60FrpWBBiDiQQwScq04e92+Ghw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=cixtech.com;
	spf=pass smtp.mailfrom=cixtech.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.126.82
Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11022082.outbound.protection.outlook.com [52.101.126.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A06E606D83E;
	Fri,  6 Nov 2026 10:47:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A06E606D83E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=anJpVoEJrufsgR4I+z6XUtvv7ROFEYQoG/bDAABz8/2FNnmZr1YozhFppmYK62N9sIHJ2rcvRxPZhUgY+Yk6fSjyZAu/alTdgJC6mjiuLIDyZG4aoBAsZ0/G9unC1C/9N00Q+1mvvbQpJFjKwL+Df27rVF7MCQDQYC4jl2SIykisbGzr86UqctpOiec2ogynJRllUOIgaBVvds5prpUYXMJljGdUB46xJ8hVF6mnmSH89RL88HZ0ZySxq54TbkpPao5czksa1GOIGwZ46cxXhEIgNeBRSgYAoYnRdfJK89pH4pyrQKC+t6rwVgjqvkgnyqmaAysNsq43jXDBfUgUQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hy9gFYTveJgCHC3VkCJIkxsZGmNRezdUbbJ0LlXZWFc=;
 b=AYUrg2jhOMo67IkrGBo3SAy72YLOYYApfNohJZjkZt2PpbPTedtoDyKNFZU/lcDTDXbxgiEHj/E/RStpSNhLQMCASfkyDS2XLQ/de9w6qDWfqU+JdWSJw+5Oaw031DEJvAtPCiLIOsmpRya/5WtS+AGCUxNOP27EVIRAaDMIcZ4rIwuzhGS28PBevSFCjtLYRvl7ojeDuVrGwN+Hhn24/Po75i92Jepd4K/PSSPSF9csYxA3fBo/IE43k0oOEJhPUxBo1M9sV4pqnWJtx90Hpx99CcYT9dSteWbPEzxlqPkKcrxWhvg3raCyBTgtrWDUR/grO2lvFP36vIq8E26n0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from OS7PR01CA0207.jpnprd01.prod.outlook.com (2603:1096:604:24a::10)
 by TYNPR06MB8782.apcprd06.prod.outlook.com (2603:1096:405:3c5::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.4; Fri, 6 Nov 2026
 10:47:37 +0000
Received: from OSA0EPF000000CA.apcprd02.prod.outlook.com
 (2603:1096:604:24a:cafe::a) by OS7PR01CA0207.outlook.office365.com
 (2603:1096:604:24a::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10 via Frontend Transport; Fri, 6
 Nov 2026 10:47:37 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 OSA0EPF000000CA.mail.protection.outlook.com (10.167.240.56) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Fri, 6 Nov 2026 10:47:36 +0000
Received: from cix (unknown [172.16.64.42])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 93E134102E60;
	Fri,  6 Nov 2026 18:47:35 +0800 (CST)
From: Cunyuan Liu <cunyuan.liu@cixtech.com>
To: boris.brezillon@collabora.com,
	steven.price@arm.com,
	liviu.dudau@arm.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	gary.yang@cixtech.com,
	fugang.duan@cixtech.com
Cc: daniel.almeida@collabora.com,
	aliceryhl@google.com,
	p.zabel@pengutronix.de,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	cix-kernel-upstream@cixtech.com,
	robin.wang@cixtech.com,
	cunyuan.liu@cixtech.com
Subject: [PATCH 0/3] Add initial GPU support for CIX Sky1
Date: Fri,  6 Nov 2026 18:47:32 +0800
Message-ID: <20261106104735.1651267-1-cunyuan.liu@cixtech.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSA0EPF000000CA:EE_|TYNPR06MB8782:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 88339c9e-e3bf-4202-0896-08df3bf35f43
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|23010399003|1800799024|376014|7416014|261009223027099003|261028144727099003|261026121527099003|261102123227099003|261022105027099003|261022075727099003|56012099006|3023799007|261021123027099003|261026140227099003|261021121427099003|6133799003|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	XZAYsGl+v9Z9v0l+pl7qQVSILbPz7T6t5AwvfqZvzxXfTXRevxc/enOxuVBHsiH7KMnU/9WkKVPXso1IBRSSqlb/jiCNgaAj4Bt4NQ5+vaJC0kEazs0LOgiagHX8XNBmY7BElVwSfvBN0K407ojYAEvRg3LFuWzKf479/1SyjPFdPySFw75n9SMeg4ACt5zoaajoHGrYCz1DeS9PjBAsjW50jiTBcn15x1tj9iOpxCcgaJYrg1AoH2PupZojFE81fB6/MDiPwNOPSgtnZKv8ly4v68f7IGxhrqA1bge3gzGxVmX3MSuacJ3q+xorbzIKtuBhV566j835AA0J4g96Pe/Fg1EYRJLLQUXxtOvGiGmDSHLa7N8OK/O7dZ9/O7g8NWyZrj28yLMFBfhI6qlsXAfOgJzp6hPsQfnP5S73lWj4oMs0t1IaW7qWKzBiOEu1vXmVbPPRBDvsvz6MJ2okWynT5WqNqFs51gjQiJejAkm36uVnmakmwWuQDK71Ax4D7EpuRWeg8eiP+NMfq9+zXigmCOmUUbxHqDcGa7MU+P7IXM0S0c7XiDkXG4jntuFqNDiXqehK0AjWUA4um0lvoY6egWhItEeltmLMgpafEtJOQ4ofN+/5XuQ/2neUiIXPFG+yQsnAUwzmoJaQb7ovcxpPMdVe0+EVXss4vRjjjeRJZRyx/KteU4l8RQO+1YMk
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(23010399003)(1800799024)(376014)(7416014)(261009223027099003)(261028144727099003)(261026121527099003)(261102123227099003)(261022105027099003)(261022075727099003)(56012099006)(3023799007)(261021123027099003)(261026140227099003)(261021121427099003)(6133799003)(10067099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	6HU+iO2agx8RonEIpQnK9YZdgd2t5ptWTBfrTU1uH8ssunP925RRSXYZv5aScBuAy4Al19v7NjQCiHHsdWfFHxK45YbmaBZCxb9Gp0QDuTDBvioprzQqe3D0cFS+0FI1gF9ADvA9CLry2m6fJXzQZdB+x+Yilqhq2cZ27AB0Gx2S4GvH9GZs70XBVTcL+0haxHL0rK0SIUTeXxt5h6jcx4JfqTY03ENSO3+CjYh68AgOLuZJfolLYWCfaWNiUO4/6jQgMTkEbt0jQkfasfLclPww6SbA3+6WrdVHrnFkao030Td8rvgRIKiC5RLvby9hhCdqmubOaEVy4CnlLmcxQL3OZrLOMGX0dbqyN3i05XbC3SqslU6uN+v8xaIXTWle7MTbMssR2KmT1RDG4ff0S+1jUcK+JCsViWTAK3I3TlHcD7DQiD1/i2A1imYMutND
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 10:47:36.5656
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 88339c9e-e3bf-4202-0896-08df3bf35f43
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	OSA0EPF000000CA.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYNPR06MB8782

This series adds initial support for the Mali GPU on CIX Sky1 and
enables it on the Radxa Orion O6 board.

The GPU requires an external reset before the driver first accesses
the hardware. Add SoC-specific data to Panthor to perform this reset
during initialization.

This initial version keeps the PM firmware default clock settings and
skips devfreq. It does not read OPPs or request a performance level.
The firmware sets the default GPU frequency to 1 GHz. No devfreq
governor or GPU cooling device is registered.

Configure the system-level cache before L2 power-on using the settings
from the working CIX Sky1 driver. On Sky1, devices on the MMHUB bus
cannot access the system-level cache, so buffers shared between the GPU
and MMHUB devices require a specific system-level cache policy. Without
this configuration, the GPU display output is corrupted.

The series contains three patches:
[1/3] dt-bindings: gpu: Add CIX Sky1 Mali support
[2/3] drm/panthor: Add initial support for CIX Sky1
[3/3] arm64: dts: cix: Add GPU support for Sky1 Orion O6


Tested on Radxa Orion O6:
  - Offscreen rendering with pixel readback
  - kmscube
  - glmark2 at 1080p
  - Runtime suspend and resume with a retained EGL context
  - Reset-worker operations
  - Module unload and reload


Best regards,
Cunyuan

Cunyuan Liu (3):
  dt-bindings: gpu: Add CIX Sky1 Mali support
  drm/panthor: Add initial support for CIX Sky1
  arm64: dts: cix: Add GPU support for Sky1 Orion O6

 .../bindings/gpu/arm,mali-valhall-csf.yaml    | 51 +++++++++++++++++++
 arch/arm64/boot/dts/cix/sky1-orion-o6.dts     |  4 ++
 arch/arm64/boot/dts/cix/sky1.dtsi             | 16 ++++++
 drivers/gpu/drm/panthor/panthor_devfreq.c     | 11 +++-
 drivers/gpu/drm/panthor/panthor_device.c      | 15 ++++++
 drivers/gpu/drm/panthor/panthor_device.h      | 25 +++++++++
 drivers/gpu/drm/panthor/panthor_drv.c         | 15 ++++++
 drivers/gpu/drm/panthor/panthor_gpu.c         | 14 +++++
 drivers/gpu/drm/panthor/panthor_gpu_regs.h    |  2 +
 9 files changed, 152 insertions(+), 1 deletion(-)


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.53.0


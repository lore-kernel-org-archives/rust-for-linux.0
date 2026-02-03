Received: from CWXP265CU008.outbound.protection.outlook.com (mail-ukwestazon11020114.outbound.protection.outlook.com [52.101.195.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42A483242B8;
	Tue,  3 Feb 2026 16:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.195.114
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770137680; cv=fail; b=OOOJ0QOh+l//l0c7woUfDVV66n1HLCHZq70x2hWwbZOfeWVXUw1MNqy+0sYlBwRa4wp6q32Eung21SIQavURiYyzAPkFkDb8bv+Gc9P2oQnpZVcH2iWlqMi+tT2AdlUnacqm/GR/EzCvvkKKvJDWyE78KH0j7p8VXUXWRFiCnhQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770137680; c=relaxed/simple;
	bh=LtkqBOa8QfRHdacXNvyHG+Teeu91GRCsYRcc5adeIf4=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=LmIpHD0WzMsmXvcdy5PrrXMsX+QP0LMXSOfndRyrTWYQ9GeCMZOWQTUuWohthc1NY2tZtt1vmTClcMP+8VN3l7z7XShwzExl+ozgbwFxNOfrDp0F6mlP8qSVh4WuY7RWjtgClzuhyqDFI16ViW6E67rkcpwFb9vbiqKqHeGmNwg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=JnxO/OSx; arc=fail smtp.client-ip=52.101.195.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="JnxO/OSx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KWdhyNEaqioG4m9gI53pJiCJr/sixH9mjw1tNCsSYLD8FaWIwIrWaIs1D2fYyyEZxJM54gINNrX2ovZn2+Kv/BvY9dq0o/h1R3G4Yg3jqCiq3AbrRgoTLH3uccjTb10SGqiukVFnaMdG6WbhrjiMFWRaW7MvuET5JMPk/71oL1P738HO2o31wSUVNAihAaoYyySQgcJneC92hof7wJ3herNyR7k9dbZ8ET2GHojX8rmk7a1hhrkuYaeUqY5kIbVDP4NyR24lBm5RkWZjjsgi/x46/ZeCoZ3K1R4yAro0tYilETz4pKIhaKTtoXTUa0R20yfqFzUZlZt67eLTumOAOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lJRhWH7n4hi0NQUgHF4asCX++DqEDnIlMpOIluKrS1Y=;
 b=tvxp0pzlCospWt3P3JO9V3v00LgxaanFPiXKVc5GiuyWHx7LdG7ItBL3VfsBXsuoii92fyd5v1YgXwJVqcp021qes77ycetH7COrImeu26F6+LZMjOmkcz2xJdlq1VwXCT/Tlq0FXHvfkMndngbhG2OTmgimNX+Hs9fBbygT4js9GxxeJYUI6ton35mv27AF2r+arxDz3GHamfwZfcT+0cTiNQWXB4fvRaWFqLpU7Neax5jJDZecS+2aLICTqDixM1I6E+uvWySbMszpTcwjRWFVvN8bPq+QeozO3rr775iMnKDvO83hkygeufpk9p2SmRYiicSYvGQZpADDNsaWUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lJRhWH7n4hi0NQUgHF4asCX++DqEDnIlMpOIluKrS1Y=;
 b=JnxO/OSx7xPRJ+OAhDeydTiaiDpp9dCEK3T5+qLLveJ0yImipyqjsFnmsnyAXi9aSfyMbG4QXa313Euq4TX38yMx1njfoxkDFHKWvXui0fNc1bey6xq0ZbS2ndQNw2JTkB5tSJmGuRsC3GA4qDGDfSO1Mi1wkcVhzetXNd4kBYM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO2P265MB2719.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:140::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Tue, 3 Feb
 2026 16:54:36 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9564.016; Tue, 3 Feb 2026
 16:54:36 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 03 Feb 2026 16:54:35 +0000
Message-Id: <DG5HFQ1JHRA1.QTLZFE4GDZT8@garyguo.net>
Cc: "Jkhall81" <jason.kei.hall@gmail.com>, <dirk.behme@de.bosch.com>,
 <joe@perches.com>, <ojeda@kernel.org>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4] scripts: checkpatch: warn on Rust panicking methods
From: "Gary Guo" <gary@garyguo.net>
To: =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, "Gary Guo"
 <gary@garyguo.net>
X-Mailer: aerc 0.21.0
References: <288d4aeb-af0d-4d50-bb0d-7a046abaaf10@de.bosch.com>
 <20260203152542.45017-1-jason.kei.hall@gmail.com>
 <20260203184933.23c92f8f@nimda> <DG5GBHGZV86X.2XKAU6WLWCL7Z@garyguo.net>
 <20260203193240.68bb136e@nimda>
In-Reply-To: <20260203193240.68bb136e@nimda>
X-ClientProxiedBy: LO4P123CA0339.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18c::20) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO2P265MB2719:EE_
X-MS-Office365-Filtering-Correlation-Id: 00536386-2d1a-4a54-06ee-08de6344e9bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|10070799003|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UGYzVDVSZ2JBaTZxaWRzclduOHVlNlE3WFh1SnBFdXBheW4xRWlPYlFRbHlw?=
 =?utf-8?B?b3VIWDJTRnZwb0F6S2RRNk1JS3kvN1ZxckdxTEQ5MGVSU2N0SHkveE9Cenh1?=
 =?utf-8?B?YnplVCtIRGxyTS8zOVFOYko5VzJVeW4wd3N0S21jeUowa0VPc1RtWFc5a0RE?=
 =?utf-8?B?VE8rcnpYV2JUdWZOa1JqeitHWVdZaG5jQnY2S0g3WnRHK2FSdGtjMFdnL0s0?=
 =?utf-8?B?ZHFkVzJZQkVsRDl3Zng2NmZZV25QYXl3UW5Gc1BBT1lpMDVvdHB2bytxUy9Q?=
 =?utf-8?B?RHB5T2tNR0NFdVhQQW1FRGh1dVFWSUNqdjJGZWM5Q085MXJtbWpubnJ2SXMv?=
 =?utf-8?B?QzlZNVdFTGlLRW5ISGtjaHlMQjlRMDI5OGZVY2NrODdxaFo1aDJBMXBNbmlU?=
 =?utf-8?B?VEdJM2paWUJ3dDlPOXM1N1l4WVI1WG4zdCtZZFdzRm1pVmkrYVh3Q3lJSXBH?=
 =?utf-8?B?YmpITWxlK1hESkZQa0FJOVBKdy80Z0paNHIxNnRscjU5UUVFZVBxb1RvMk1S?=
 =?utf-8?B?T29rUXNOa1d3TGw1L0hoVFE1dXcxeWZaU1U1eS9kU0hMWThmSkFlUWJGeGZI?=
 =?utf-8?B?aU1WM3RYMW50QkdvYnpnS0VtQ3N3UmlKRFVTV21MSXRyV3JuSkc5TjBKd0Za?=
 =?utf-8?B?OEhNYXd6cC9zNFBrelk2a0hUelF5bmJJT0VvMm9DRXh0V2toRlNFVnp5OFZL?=
 =?utf-8?B?UURHcTN1Vkl5M3VNWUFqSWpSUVB3SlNFdlBlMlFBZmRGRk1lU0lFVWJvV251?=
 =?utf-8?B?cC82MHU5UXN4UDdKaExibTg3clRjN241emViK05BeEpLcWpFWGpwNjFXZ2dw?=
 =?utf-8?B?c3FaUVN6amJQUzBkUlpDamdJaGxDMFdRSTNlRVc5OUtLMnJ3cmVFaVRlUjVF?=
 =?utf-8?B?TkZhVU9qUWJZT2RVV1VKRm9Ob29rRGVqVFFTY2tscmx6YzkxYVpTUWs4K1Bo?=
 =?utf-8?B?KzFDUkdSVzFZVWFCMXhHM1NQRFgzenFrQlJUckRJczRkK2cxK3FvWmUvVEFS?=
 =?utf-8?B?UXBITlFWOXMvYkllNTRka21TMFRuT1Zsc3BUYUpxZnUyTStPSjJoa3h0S3Nv?=
 =?utf-8?B?UTBZcnBEbU9mMEthNExMUUpFYTRzdzd4dGJDZ3RKb1paOXFGT2hSKzY1Nm9J?=
 =?utf-8?B?Q05ZbFprUFhTTUdmQ0RGbmVKOEpiQnoyNnlqdGZTTWFNQVRaUTlmWE54d3Nx?=
 =?utf-8?B?bTJTTllENE55THJTclYrMUplV1QvVkRpdGlSTEwwaG4zdWtpVTFUTGVLeThF?=
 =?utf-8?B?b1c1MVVWMUR0cURMRXZNTzdEdHlUMUlpQTRrZmx0djJLZFM5N1R6SklDMFhJ?=
 =?utf-8?B?bE8vWGVmTmtCNlN4YkFUS1MwaXVJRXZoUDJPZnl2M2J0ZEFSSDdQNmZ1NWFl?=
 =?utf-8?B?RWIzMnR3YytsUmJldTMxRkZ6aVpGc3JDMHp1NGJVVkUxR0ZhazJXRHBPdjdj?=
 =?utf-8?B?cVF3TW5yWklBNmVqeWsrUWt4MkovSG5YYnRCZzQxVnJobGI2cjRxRm4yOTM3?=
 =?utf-8?B?djc5dzA5bHUrOFZ5UG5uS0JFSFYvMEpBWUhLMnlja3VkUUNPUzM3ckdtbFQx?=
 =?utf-8?B?YUN3WGZkM09Jb3JKZnpsZGNEcHpucS8vOE9rdXpQczh1RzVyckZYSXhhYUFt?=
 =?utf-8?B?SWZqdG9LQ3ZZNER3eVAxKzhoTWpydUNST0NncGEwcUNmaU5VZC91a0RhL0Nl?=
 =?utf-8?B?Q05yTndjeUdhRzBmemthK0hubElTMVRBSis4NXkxUzA2WFNNRURzeE5JamRw?=
 =?utf-8?B?YkpSRHFnMFJ1c2Y1Nkl1NjJKTVpoakNMSlVhWkpNNkxmWktqRTNkcmphSitS?=
 =?utf-8?B?MHA2U0ZDakRyUFdhVnVEUU13UlVBUS9yQUlVaDJEZThSZ2V6YklEUndZalZG?=
 =?utf-8?B?cnBYWTJhTHdQMWp6OTFPNk9ZelhaM29BK2tWZmhOWWRiQjdVSDEyWkZiamRR?=
 =?utf-8?B?WnRwYWhONmdVZGh4RzNVZ1lBTlpOeWJ1WStjZzVUOGFISUdFMDhxZDZVanRD?=
 =?utf-8?B?Tm55VFYwcVNDaFRubnlmTEZHR3h0TVVjb254bmE4WXlOSkE5Nmp1U1dvVlBi?=
 =?utf-8?B?WWFTQjhjM20rVSttdU5BZmU5Yzd4UUczWEF4eWhaWHkzOE9hSWtWd2JPZzU2?=
 =?utf-8?Q?L5as=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(376014)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VzRzaUloZC81ODJQTGdwUUFSRi9NUzFnc2RzN1dvYkNCUmlWUXd2ZGJOT1pT?=
 =?utf-8?B?SFl3eStxb0kyZTIyN1BGMzZFQStWWmNGR1BoNE9sdXFRa0hUa01ZZVpxTXpw?=
 =?utf-8?B?ZXl6T3U4aHlWekR0UVJRa0RKVGUzR1EyUFUwQWFDeUdMK2ZZUC91TkE2cHVY?=
 =?utf-8?B?VGZaU3B1KzM3bzJaZ1FoVXZBeVdTZG0rdHcwZWlOQWtkZTM0K0RLYmV6Y05u?=
 =?utf-8?B?WGZGbCt4NzNHQ29tUktmSlZSbWFHOFRyT0RRR0pSMlZSaVdqOGRubmdtb0dh?=
 =?utf-8?B?bVBiSHZ1VmdZbVN4N2R1RS80cUJOTW9GYk9FakNiU0sxVWVteXA5VWtaK2h3?=
 =?utf-8?B?a2dLVXNFWmQ2alR0SjduNU04a2RmcU1LZ3JDcXRDc3Q2Uklaa2lIVGxQVndy?=
 =?utf-8?B?U21RVTlrcXhEWUhrY1Y5NVFodWt6S0Z5NTJneVY1RTlVR2s3eTRaK0l6WUc0?=
 =?utf-8?B?UWI4MmxsMDc5ZHhCS0FOVS9lVHdtemRabzY2bnhLQ1lIMDBlUzRTZjZ1OUZU?=
 =?utf-8?B?QVVWK2NhTXdubmM2VTI4UytoRjRXVHNwVDE2dzNoYzRhYmIxS2ppZzczN08x?=
 =?utf-8?B?QnBGRkdDODJzQW9RaWVaT3FRZ2o0OUdEcG94NVZld09GVi95SVpNSkhLM1dS?=
 =?utf-8?B?UlJPQlNQSWpIbFNnVGo1QXkvRVhPdktPdCtpRXZ6aEU5OE93R3FQRkswV3JV?=
 =?utf-8?B?M2F6aEJra3F1d2Naak55K2tVRDZHb1cvUm9kbmFZN3VqaXdUTG1aWnlhY0tm?=
 =?utf-8?B?b0M4Z2lkYkpwaVl4Q1F6N1Z1ZWZCVE5sUElPcEJrTjBHK2o1UFZpNUVXb0Vn?=
 =?utf-8?B?cHpvTTVsUHAyclhGQlBaOU5nc0U5R0xPcUZERU1jeEtyTUJLMTdQQ1FodERz?=
 =?utf-8?B?cTQvRDlKWlA3bGlLMTRnRXhlcEIvdEY0L20zUWhtL1ZsOTdJUGY2UzM5b3h3?=
 =?utf-8?B?SzBpTDQzdjdpcS9mTUpQVGlyS2ZoYVI5Z2tUczJXMjVjZ1pkUDMzSEFSeTky?=
 =?utf-8?B?eHc0VkZLYVpJK2NKeG9WUDlCN3VwRlhFSFpTMHNFNkNBeTdhTXhLeERSTDZU?=
 =?utf-8?B?N3E0V1BuMTBwTHVzMlBTNitVazdidVNVT0k5NUhUMzZ2NXc1bHlOM3BkV3RH?=
 =?utf-8?B?U0JBS0hjck5vdUFWN0xoQlBEdHBRdzArdHhLLzl3aWU2MDkrbXNoN2NDY1pl?=
 =?utf-8?B?WmlNRE5USEFnRFkrQ1hUaFpaeGlTL1FiKzhZcWpZeEluTTVReHI3d3VvZzNk?=
 =?utf-8?B?Q2FYQS9odW1rT1ZLZDl2ZG5rRFZSMnBXcU5HWkg5OHNyWkxYaDdXQ1EwazdQ?=
 =?utf-8?B?ell4UGx3VmNQUFg2Q0ZLSFI5dTJKS0RXOGxaZzRvSHo3ZGVTbkZPdGNZZEdq?=
 =?utf-8?B?SUh3c1VTeXFCKytZMFFrZW1FcmxRNk9QVkZxYjhnUjFmdWJXK3pEUEpQSzAz?=
 =?utf-8?B?K3d3L3BtenBmR0tIaEcwZHNDVE1xbEk3R1hoUUdSQ29RUEdOWXdxMmd3UG9S?=
 =?utf-8?B?aUlHbkp2VDZkNE5XelgraXkxOU16bC91M3JyNU9xSDQ3c1RBdlJHaU52ZU1D?=
 =?utf-8?B?VnNETmNiaUVRbjBORFQ4S0wreFZJSDRUQWtkMEZmVDI2MlA2SkRnbjUxOTYx?=
 =?utf-8?B?UjRqMTB1Zjlva2dTQ2RGZXFCMDI0Kzc4aC9jZlAweTRCbE5hSjlJN0k5Z25K?=
 =?utf-8?B?NitlcUFpQUZrUldJZzZHcy9NYm13cUd4M0JMNExxd1hJOHJxZ2NiMXZkKytW?=
 =?utf-8?B?T0p1Y0xTY24yMythY2pGSHpQM1Q2ZnQzMnpVMFk4bGc0Z0lMNVlId0Y5SGZl?=
 =?utf-8?B?RTE1eUgwbHp6NEJqNjNqMU9zMEYyak1paXJ6M2RQSk9nOTVDeHEvUXkybERI?=
 =?utf-8?B?Nm1TbThFQ1hzQTJuT2xPd1grZWlGcVJKM1BWU1dMYytkZG16OE05NUQvZzFX?=
 =?utf-8?B?M2FlZFlDeXRIdGhLV2V3T29uYWRIZnhIRmlMektoTHIwb1h4UW9yaHpKcjVM?=
 =?utf-8?B?ZExsaHIzK3JqU1BtMFd0NlZoSlpXQXAxUWtSRWtOTGdKdW9zTk9mbmVvNlh0?=
 =?utf-8?B?b0xyenJUNng5NFFnNHRZeHhKSWZDZGw0NzVEUmdSV0Z2M01KMmpJN0ZlOThM?=
 =?utf-8?B?S0JjWmZMRjhqUGVaaVU5aEYwQnFXU1ZMRUxJdlNiSXh4NDZVZ3NHYzA2cnBH?=
 =?utf-8?B?YXdXdEp1VDV1MnBnQXBQWmZtcE1SSm9GNGwzQU94MTFtY210K3J4b0V0eDVW?=
 =?utf-8?B?NTJZbVNhZzVSbDRHdzh6TnIyZld6K0R3Y2R5Q1A3ajdFK2NKRmYralBZSVp2?=
 =?utf-8?B?Q1Z4OVU5K3JtWk9rbW9Kc21yL1d3enlVZ004K3BCUTg3aFlHVjZrQT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 00536386-2d1a-4a54-06ee-08de6344e9bf
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 16:54:36.4888
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OInCrD1Hrg8LyprRVMEqpdqrNMEQ0qRgzlXq/cfcF1xCkjyknVJ0fl2OVtZzdRCR9T7ultaL/yl7Jnf5jLc6ag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P265MB2719

On Tue Feb 3, 2026 at 4:32 PM GMT, Onur =C3=96zkan wrote:
> On Tue, 03 Feb 2026 16:02:02 +0000
> "Gary Guo" <gary@garyguo.net> wrote:
>
>> On Tue Feb 3, 2026 at 3:49 PM GMT, Onur =C3=96zkan wrote:
>> > On Tue,  3 Feb 2026 08:25:41 -0700
>> > Jkhall81 <jason.kei.hall@gmail.com> wrote:
>> >
>> >> Nice, emails sent from gmail get automatically rejected.
>> >>=20
>> >> So, Dirk.  To satisfy your concerns the current 10ish line
>> >> code update is going to slowly, after many more emails
>> >> written in nano, mutate into a franken-regex-perl beast.=20
>> >> checkpatch.pl is already huge.  I'm not a fan of this=20
>> >> approach.
>> >
>> > Me neither. I wonder why we are doing this instead of using the
>> > unwrap_used and expect_used linting rules from clippy. This would
>> > catch the problem much earlier than checkpath since many of us build
>> > the kernel with CLIPPY=3D1 flag.
>>=20
>> Because it's okay to `panic` or use `expect`. checkpatch will just
>> warn you once when the code is introduced, not continuously in each
>> build.
>
> That's interesting because it implies that it's okay for people to use
> them without "// PANIC..." comments. That sounds problematic since it
> means some instances will have that comment while others may not.

My personal view has always been it's okay to not have it. It's a burden to
developers to always have to write these. In many cases, `panic()` or `expe=
ct()`
calls are needed because you have something of `Option<>` and you know it's=
 not
going to be `None`. The C equivalent would just be a pointer and you use it
without checking for NULL; we never ask people to justify why they feel it'=
s
okay to dereference a pointer.

Sure, if people would like to justify why they think it won't panic, brilli=
ant,
keeping doing it. But I don't want to make it harder for people to write Ru=
st
code compared to C.

>
> In my opinion, adding a clippy rule and using "#[allow(...)]" in the
> places where it's acceptable to use them makes more sense. This is at
> least more consistent and doesn't bloat the checkpatch file.

`#[allow()]` looks quite verbose, and also you cannot apply it everywhere (=
just
blocks or items).

Best,
Gary


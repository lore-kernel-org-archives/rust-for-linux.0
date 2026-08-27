Received: from CWXP265CU009.outbound.protection.outlook.com (mail-ukwestazon11021098.outbound.protection.outlook.com [52.101.100.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D9C737C933;
	Thu, 27 Aug 2026 14:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.100.98
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787839234; cv=fail; b=mT1sJ0rMxadz+UKSQt4ljHfIpDop46qbWQWsGeIUzXjPuHufE2EFQC0romJXnGfH8saSPoqIh+PMKC3PwpAQboad3lJgX231nhCjbO9MPVbuEpdVyJERs3Htj+enE+1l/QbrZuJ0sDTv/wrYNRG39gOCp9/8hLQVx9Kl0FxJct0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787839234; c=relaxed/simple;
	bh=HG04JkH+8UBijHBrWtWo5g43bNm0RJQb27//atJO/hg=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=hY7yF+FVstG5b7kCBt0zPw7C9RrVEq+C+TkWDPvy0hHpOQ7+4DNYIzyYN1BxgjOMsgrwecesmcBcPCN0mmCXXoWegqlKuqowaDvB0osI12hRCsmS/GXPzGNp8a/NsdUS1aid311KCjgQ0uenoxjx/6dizNcBpKRQDDDUpVpYgXg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=lM8OkSHN; arc=fail smtp.client-ip=52.101.100.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="lM8OkSHN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Cfm9glCDK8Y4Qwq5g/mP9bedaxmiBL7Qct+6bq4Ax2DoYhfwVJHWdKQugVdVTx5xCCyKylWG6LXPKIdIizHjBfh8sWTPQcNRbm/Uo0KiEOYLUDHYHyVxROxE7i3TStfklAWir5MMQjFgDbI1ID2taCqSYgHJ2bfNsRbvxES7y+YKm0pYq0ZBMtVffioInEV7HflEcl1SIhpRGaQD73FuCynHG1Z540a7YAU4h88vshbAt9padFTaLQDVo68hXjwZg0SGBJi2I4+EduMEW5DRp3ZLk+fn5/auC1mi1AASwKmNdVVDerw6WM13e5enbaCUZFiJviUp79HYUWEPHS8umQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1Wiz1LjdC3LVMvvb827LanbKcdTRrZ9ImwjZxX5wjTc=;
 b=yjbHrtf55LIZLEGJy91eFlULjzKJL+MlklUBXeiy4Gy4H1LcpdAwGMPCaka+0sYFBXlJhmtLFNgyBAYsjH2pX0hw0izsqlHllSoJPvj3d/CDTE8XZ/ZXPSw8dOKYrHrzeHZkS99YRC5OrCCLkMBRpOqQHVsJ0pe8vT890uFd+TFQTBMCxVcDXRQ+en1kiQImsFsYZvcSSHBZ4EeU69RfB0sdL1FuSZXMBewogtXa8J72ix6wq6Z6yX2W0N8ov1ugTSEFaN2I+3SFf5SP1GaHAsSSFERnxrgaFTjYjecfnIlV2UhI52qyPcr8QOrb4ZVe2s0LSoAlWeswZsl4fj+ueQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1Wiz1LjdC3LVMvvb827LanbKcdTRrZ9ImwjZxX5wjTc=;
 b=lM8OkSHN7Qaq99S4oLbsKRfNgF7AoVaOXP0GFwc28jLkNUxK4ar6n6/f5Zm+OKs866RxSfxpgnGSM/OmSJDLK1OwVWWy/TWswkF+u7e82znCMBAx2cSYsKcZY3FUFngkjLoKpAWDXzAosIhaRPG1Q0xwR6XNdWZ5Eb+fFHe5RjE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ab::19)
 by CW1P265MB682732.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:2a1::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.6; Thu, 27 Aug
 2026 14:00:25 +0000
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1]) by LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1%4]) with mapi id 15.21.0360.008; Thu, 27 Aug 2026
 14:00:25 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 27 Aug 2026 15:00:24 +0100
Message-Id: <DKZS41GKXR5R.395XZFYW06WSZ@garyguo.net>
Cc: <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] MAINTAINERS: add Alice Ryhl as co-maintainer for Rust
 [ALLOC]
From: "Gary Guo" <gary@garyguo.net>
To: "Danilo Krummrich" <dakr@kernel.org>, <aliceryhl@google.com>,
 <ljs@kernel.org>, <vbabka@kernel.org>, <liam@infradead.org>,
 <urezki@gmail.com>, <ojeda@kernel.org>
X-Mailer: aerc 0.22.0
References: <20260826132729.3281308-1-dakr@kernel.org>
In-Reply-To: <20260826132729.3281308-1-dakr@kernel.org>
X-ClientProxiedBy: LO4P123CA0103.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:191::18) To LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:4ab::19)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOAP265MB8560:EE_|CW1P265MB682732:EE_
X-MS-Office365-Filtering-Correlation-Id: 2344bfd5-ab38-48f9-4400-08df04438b29
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|10070799003|1800799024|376014|10067099003|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	Eir14UpRO99TVK765ULG55zuUwjP2bHgJuDGs4xiPNtv2mCx8i/VRxZP598hE0uKDOl01BUBANcT3cW/Wf8qadlDS3uRlm9wDXgkDdKWYu2nGgxTfOtMqbWf7IHb6FLCnhG/e0NoHgdAiRoU4qvRYz8u8xtZj4hQcxvtjntMdahDSoh6EtFhp9HjMqTkOJZm+JMpYzIRFHPVHsDSHZi3DXSR51OdcUzn0QEIYxWVm32NyjHQn1DwGztUJYfr6XgYmIahZmXFnd/wRfBYSCfpjSMGi+dptZTaMQTvYzASiqSau9MeM8fWgF6DEOTBxpvTSnE9s9V+G4N6WlOBpNUHLhS5Q11YoemuQpmnWxvrhCad2mTrP4bXTrPcaC3ETlb3JN/SPW1MEOp5N44rs49xQPzzqVo7E2m3oE6k4Z/l9DK+JF0kAiU4Cp3Vw3oZO9h3zRMYIkpTsO1mWBYRUtRDfXqYBiwPbOCk0BxAiIymytaanbNG8XB+lJkxjDW59FyaQdc+t43Orjyp/EYg4MZkc12S+6bRxrqsoSLLXrj8ksOo/9w1+Zfdiq+ZdbU+zLF0u3OB6WxhvhgwylKe5EynpfAViMYsEOyXAQIwTOoOIkb41xZvhCSQgeETa7XtUqJiBcg1MHn2ABi+xCtMheARYh8SXehmox8H/LQUOalspwA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(10070799003)(1800799024)(376014)(10067099003)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZUNYMm5zay9QMml1bnUyR2YvT2hla3VhM0ZoQWRpOGR2OExpRkxFbnVYc0dm?=
 =?utf-8?B?N0dpY0hHK254ajRHRHlGVkM2NTJkVzl0eUVsMlcvSFRiaklVOGFKYjB1MFp1?=
 =?utf-8?B?a3JCM3JqMW93bURKQjM0UTBmdm5mTVpLMEU5eXFtQ212MzFDTkFFY2krU1hT?=
 =?utf-8?B?Z0dXQjNtMHVVVWJnYU41YTV4U1k1R29JUkppbEp1cnkzQ3JDWmwzZlc0Q0gy?=
 =?utf-8?B?b2JkSVd2aHJURE1SSlBSQTA4VjdkdTVicEVmVHZWeWxQeWJkSCsvSk1mdFZR?=
 =?utf-8?B?TmZaV3hZWG1kWE05bDhpemhsdmVvcFpDRnlKTkF3YytiQmRwMFA5dDVTUVpn?=
 =?utf-8?B?Um81MVJzN0dvWFlrZlJENmtDTldIZjNwNFNHTEVwQWZNQ293WG1vTWpFZlYv?=
 =?utf-8?B?TUtGVnJuTmhjNjNqVDFFNW9FU3d6c2tXeFBFZnc1RmJKeU5Xa0J5VXZGdm0z?=
 =?utf-8?B?d1F6NXdlTGdhUHRTcUFGQ3dZY1NudVZNZk54elRPRXpDWThLcEthRXE3ckg5?=
 =?utf-8?B?ODdFU1VHT01jQ1ZLZXJ0UHk0R0R4YjRsclhaQ2tGK255YkVTeDBBZGlOeXc5?=
 =?utf-8?B?eEZWVjdVeVFuemRDS0ZlREptVUtoaVQ0b3ViTDZtdG5zTXR2S2hnN3p6T3dh?=
 =?utf-8?B?RGRsOG9tdUkrR3d6SjgrY2UyUXlmb1lhVXdjbTk5VE5Wem51eUlqcXFzMU91?=
 =?utf-8?B?QStST2ErQXRPK2Z6SzhkNHFITE5JMmo1a21OMUpQZVBwME4vUGhSblZTVGw1?=
 =?utf-8?B?ZVZLWExSRjFQczlJSEsrRWlXYmVBZjNTYzR3eWFLVUg5RWxWT3BxekY2bDl0?=
 =?utf-8?B?NTFFa3d2VFNSV3B0VHc0cVV3V1AvVTZkMlU0eDhGNTZBWGRMVkhNM0lKWElv?=
 =?utf-8?B?TlhMRi9nK0Q1bk1MZUcwZjg4U1F1YVdiVWsrZGZyZnNCenZFTC80VjYxaXpX?=
 =?utf-8?B?NWRlWTJ5YUx1NzlheTBSeDV4WjVYRVlnRDZDUTJlbzMzc1R2T25sNUJFcVVF?=
 =?utf-8?B?bm0wYWI5Rjd0SXp5RzFIRVJGY2svOGkwaC9UcnBMSno0RWJWZGViWUVZZlFP?=
 =?utf-8?B?N0NRWldPTGVmYUhTWHY2M0xZelBGaFk1MG04U2hZbG8ydEhjaGp4QTJwOG9C?=
 =?utf-8?B?RTFSK0JOYks3OW9oYlZJYVdOS0J1TkVSVytrNmdpa3E3d3hJSXdJaUhYNmNH?=
 =?utf-8?B?emRlN2VMK0k0Y3ZQakxVY1ZqNU5lei85R1d2YWRvM2taTy8zNENMVUFZT0dL?=
 =?utf-8?B?cGFGZzBVcXRCZlhLdWREd281NDVwOG1JbWpHV2xTcDZZZDNxQTJCdlBXNDZE?=
 =?utf-8?B?R2pkZVNMVDNrR0k0UnBKY2ZoME85ZFNzR3ZXcXFJYWhKT1VMRFlBMUhDNG1q?=
 =?utf-8?B?MVFPNFpzbGhGZ1ZONlpRdGlCQUY4THN3MFVpdURVSU4xMFN0T05BVHpBK1Vj?=
 =?utf-8?B?c0k5QVRWZlNwalFtWXFSamhSaHVqeHh4d2xpNnJoRXoxYU1icm1meGM3bG9P?=
 =?utf-8?B?UE5wcSt5TWFGRFlOYjZyTU8xVW9VTE5BY2FNMnFLSWJqMWt4cnUxQVNiYTRv?=
 =?utf-8?B?Y0twc0kvKzJja0ZXMURXOG5TdlR1cS9zL1pmTFlEUkY2cjhOVDVwZkowU3JR?=
 =?utf-8?B?ZEJoNkR4NXU1SjArM3ZJbzlyV045UFRIbEF1bVZXS3lSd1hhQWJWSGRVdHVO?=
 =?utf-8?B?SVdudWYwTEp4YWt5UWZKNzI5cU9DRGtHZS81eDNlZTg3Ly82MzcrS2ZzTXo5?=
 =?utf-8?B?QU5aQ2dqSWN4alJLNjM5OFduM3NXSENjUURUZ0tKUWl5Ymt4Q3o0VUcvUTkw?=
 =?utf-8?B?NVJCZkZpZS93TklmNTE2RzRFTFRrTEg0cjduYnJEVy8wekhZS2diSHdBaTlV?=
 =?utf-8?B?NUU2MVlBU0s3TkFqMDBXTG9lWmtYQnFxdHF4VDdwTFRtS0dPcC9NSjVWZFlB?=
 =?utf-8?B?VThuaitjMllEWFdTVHpDRCs3MXpUYVBtODBXUXBySkdBb2Zvd2EyT0ZHZ3I0?=
 =?utf-8?B?S2VEblF4RnVmWUNYdzJUSnhNWW5WWjdDZlYyZlVEMnp4STE4alJubzc5elF4?=
 =?utf-8?B?cm5JQnlad2M0ZHBXZWRzUWxlMFFaNjc2TW1ITTBjUldTOU9qSGhoY1N6SW05?=
 =?utf-8?B?Yi9Xa3ltWkJJenlOT3kvQmVGdHJyOEVnT1E4QWkrUmpaT2xSNWhPbjFRTlBs?=
 =?utf-8?B?Z2JjZFJpbHc5Tmg5czlvd3NqSy9DZmt6RUZpRUNXMHc1dDliTHVlV2VZVlJy?=
 =?utf-8?B?S05EaFBETHNxcmtpQTFHY0tISmpmQW9zdXQvdU50QzhOLzVTYWJXbkV5WlE0?=
 =?utf-8?B?NHFQMGVsdnFMNXBGMTAxQzRpa2hWSDJodzBwcWEyUi9ZQ0kvRk1XZz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 2344bfd5-ab38-48f9-4400-08df04438b29
X-MS-Exchange-CrossTenant-AuthSource: LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2026 14:00:25.5178
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +JSAQnFYlsQQq/AudR4mb4jyJiScydYYx+SKDTa71UDFtRg2wNGOmcWdBK4bioBd/VVwasRsJEsKP8lMNmtKyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CW1P265MB682732

On Wed Aug 26, 2026 at 2:27 PM BST, Danilo Krummrich wrote:
> Add Alice as co-maintainer for the Rust alloc module to share
> maintenance responsibility. This is also a natural fit, as some of the
> alloc code overlaps with the mm subsystem.
>=20
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Acked-by: Gary Guo <gary@garyguo.net>

> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)


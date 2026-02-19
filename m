Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011044.outbound.protection.outlook.com [40.93.194.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4594A221F15;
	Thu, 19 Feb 2026 00:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771461880; cv=fail; b=d2NtBZKdOkJv+hmPFb24DuikjWW5X3ANw5DL1PE+pqQ46Px9QJK7QHwUzw0sDhik2EOjriIA14FFgfNL82r+FH+GbNKDX1L+JLJEjHOokNtcf68+/3kPxMC6RnvE1WrM32jXwkRaoGuyJZPjoApRW+4eeqDmhGC3lL5wtol7IQs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771461880; c=relaxed/simple;
	bh=0X+qTE6aJLGg1MsNF2MWP10qPHLCXunrS44hOUh9514=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=j2DK/ib7yAYyMHy6S13hkbWh2SMPtdHoWYH91H7/MIu8r5VAFOTmd5N6m8RdHDw9mwi+3JRNv8uSVw0HKyjNkhgmeQOmZljjEj4rYqoj6UEhB0a7fFjUP9+fjpY+cYN/uG1QLPKB1WHO+uKBwgD6nOlCisLSZkPj3fgDtiSaVAQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=nb6KhTTH; arc=fail smtp.client-ip=40.93.194.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="nb6KhTTH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lmf2a+WysPIaDi2aqX65LoAhCjwr5pEP+YE4rVoITM05TXHI/E5FZgMkzuAYQdOVOGuMSyH7Ny/hLkkKzVZDS5TTS8orbwyQTm3B8gu9wXoH7oWDzcRYKYzTIRJ3IN86yfgIg8wPKOucR0s55d3TE1Ex1M4t/J5h2T6i6cvohqSKpw7ESd1JRZx5fJk0s+TQWcAuB1McYYV4Ebpow7+BwROgsGOawqQjKCoNhWFPLUGoIFOQtFxnafFu0X7NUVvjm782V41r2KBIpOjTaNfUYwWcrDsmRg71i4eLn9un37q3jzB1bj3Vc0KocVGCJ3s7Kl8E8EO8CLNHmH/KM6sp4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0X+qTE6aJLGg1MsNF2MWP10qPHLCXunrS44hOUh9514=;
 b=H78/1wKm6fpaEqwSMWA/P5bDkYPlD3drRfv5+SJnUHBc9W8b1HikdraqCYDlgE1ke+th78qR8y6rfcx+JcHyxoWu+7CoszCClVhDhgljmQ3UMY/zpyWT3LZrCdLQrTot8Qb/7KnbRcc14ZGc+9ky2pWqx5+5ws4viUlcMSEPbeewQHEcf4xKlVbnFCO9y1MdqoMjK9jbYZB17oqtRV9p+LBLEVkLiYw7IADZ1RUYh2Om0zSUCFPti38UhCy4B1sdjxuMqwcy0Tk/2FxZsWI6NJ3UgXGe510SsAXJOlJvMj1IxpYBq1yr0wnKdNEj7qEWNIOgis4F+9UrGQO1PBTBBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0X+qTE6aJLGg1MsNF2MWP10qPHLCXunrS44hOUh9514=;
 b=nb6KhTTHYCSO2oCyYjoa42XRTLKMbAarmAHjPJYkhhdUc+JtiO2x3gyucwXhIYotcJO5+4Aq4wlkXPxW9mLrASMPEWhkh2g8zOyDuQ4TJPn0KLxhGwCL3v7I02vXcTs//Ur8EQo/VACtE85DemvJH2vf1RJalZ27WSq0h5ulxcZtyBoTtXZI0TT8MdI3pa5AxFEQ2JVL78ejBSC8HehEFUgjv/Mwl6roxblmB6u7OHHruD84wry3ACDQOgW3bzw1ylz2QUZ9YCeLLV4aAplDtRRaLMhCXTIkJz6e4EeQmGNVzeWRbDXdbcwYDW92i/39/NmgsnVEjIQGAFxYEqbeaA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB3997.namprd12.prod.outlook.com (2603:10b6:208:161::11)
 by SJ2PR12MB8832.namprd12.prod.outlook.com (2603:10b6:a03:4d0::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Thu, 19 Feb
 2026 00:44:33 +0000
Received: from MN2PR12MB3997.namprd12.prod.outlook.com
 ([fe80::73c6:e479:9b75:b2cf]) by MN2PR12MB3997.namprd12.prod.outlook.com
 ([fe80::73c6:e479:9b75:b2cf%3]) with mapi id 15.20.9632.010; Thu, 19 Feb 2026
 00:44:33 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 19 Feb 2026 09:44:28 +0900
Message-Id: <DGIITNWQG26Q.VN7FUL89C5D5@nvidia.com>
Cc: <linux-kernel@vger.kernel.org>, "Danilo Krummrich" <dakr@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "David Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, "Miguel Ojeda" <ojeda@kernel.org>, "Dave
 Airlie" <airlied@redhat.com>, "Gary Guo" <gary@garyguo.net>, "Daniel
 Almeida" <daniel.almeida@collabora.com>, "Koen Koning"
 <koen.koning@linux.intel.com>, <dri-devel@lists.freedesktop.org>,
 <nouveau@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>, "Nikola
 Djukic" <ndjukic@nvidia.com>
Subject: Re: [PATCH v10 7/8] nova-core: mm: Select GPU_BUDDY for VRAM
 allocation
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Joel Fernandes" <joelagnelf@nvidia.com>
References: <20260218205507.689429-1-joelagnelf@nvidia.com>
 <20260218205507.689429-8-joelagnelf@nvidia.com>
In-Reply-To: <20260218205507.689429-8-joelagnelf@nvidia.com>
X-ClientProxiedBy: TY4P301CA0066.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:36a::19) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB3997:EE_|SJ2PR12MB8832:EE_
X-MS-Office365-Filtering-Correlation-Id: e345a86d-c2da-4572-9136-08de6f500c1b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|10070799003|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Y1VJSXd4NjlKLzd4b0hZLzhwNE1tNm8yNnVaZkY4OVhYNWh4SGhBeUN6SDJp?=
 =?utf-8?B?Y3RmUkFrTG1UVzg3cnFnTDg3eHJ3eDlUZldsYW14ZG5SaW5NOVd2VkViOEJn?=
 =?utf-8?B?clNlYjhVMDl6Szk3ZXFlQ00zYzdwSmliS25JMjduQ1dzOHVGa3RFcDY5SGxr?=
 =?utf-8?B?V3BWZTBaY1QrRk1tb2gvYXdwK0tJYjJhNmViM2RPdlQ2OWptL3hHS2xjdVhE?=
 =?utf-8?B?eDl0M3JkNFNLQ1JNSk9KL3BQSXcya0tINkh0czkvTjB1bldNamhFTGRrdEZr?=
 =?utf-8?B?UWFwajh5a1BZcXpIMVc4amNKN00vaU5WL0UwKzMyTWkvZ2dNTWtYamNBZFhQ?=
 =?utf-8?B?UWRwdXFHaXBncGFOemhpaDk0SVU2QVdESjdaRHFkNEVxOXVnSDY3elZDaUdo?=
 =?utf-8?B?VHpCcnVXRmovVEF2VE9jTkFzdnJCS1RjUVBrNEE0cGFLSnZyTTdzdGtFYXht?=
 =?utf-8?B?a0xlakhqNDBQM2RpcUFzamprOXJ1b05jNmhmai9WYzN2NitiZllJQ25NNjNz?=
 =?utf-8?B?eWpmLzh2amxzd1pNbkhLcDEwMmxsd01tVDN6TllORWYvWGZhTkNZazFlOHEx?=
 =?utf-8?B?cS9peEU4ZHhOQTJ4S1dnSVRpY1dmcEhzOVhTY0xQY21xb1dEOTBqRXZDSEl3?=
 =?utf-8?B?Z2xjSXFRdDhEOWJKS2crazREelY2TlBlYWRyaExPWUFRc3ZPeVBiUVpqVzdo?=
 =?utf-8?B?bFVsbWMxM3V6YmlldDVLdlc2VDNqcGtDSWJ0NU43MHUySUVLamYwQ1dHaUdM?=
 =?utf-8?B?NHNYOGx6S3liR0l1Wnl6cmhkSUkyOWR2OFF6M0dxc0VPU2NJdHphTHRqVEFm?=
 =?utf-8?B?eHdpd240U1htQ24vVXlURzV0TVR2enFsdk1JN1ZHWlltM2JiYkN4TVBqTUQw?=
 =?utf-8?B?UXdYc3RycFNtb1BVUXUwMWdjSzR0dmtrOHVTWlFKOTR2enBmS2p0WmhxbTBI?=
 =?utf-8?B?bjBlVzNQSHlMc1FTN3FRaFp0MHNGc1dBNzVsRjNGYTh5UU1ZNmF0akIrVStv?=
 =?utf-8?B?cHhySTIycXRHYXNRWHU5dXZISDIyd2R4RHk2bEMyYWlsSCt2K3BOUjgrNEE1?=
 =?utf-8?B?WjJZWkxtZFFyZ2RjWUs3bVQvTVM3YUVKOTArSEpwbmpYaExrNmRoU01DUWcv?=
 =?utf-8?B?OW5hbFdFb0tBelV0dVFCVXBQUWwxQlZJUUVQOEZGdmtEWUhvR1AxcGhsTS8w?=
 =?utf-8?B?eTFVdFJIYUNZRHJTWmxuY2tHZWNDcjZYM0wyYk9BOFRvZFFpZFVHNE43QVVp?=
 =?utf-8?B?L3NuNnEzaU41WVM0eEZDRjNQWjRNaS83Rm1yalpFU3Y3RUU4VjZDWGluTHB6?=
 =?utf-8?B?cWFrKy9BQm9ETXFEcWFUYi9aT2FnMlpTWGJEeUF2QlJ1SkdERE1Ba0kybzF1?=
 =?utf-8?B?NUlrTzc5M1lKYytUZjlCMWdldVlQWllvZHhnTWpZL3prL083dE02bkYrQWNF?=
 =?utf-8?B?dk5MN0RqUi84amZGRklzZ244U2ZTQk1DZUtFdmcwM3VrUVZCNEJSUFdzMWUw?=
 =?utf-8?B?SS9GL1hSdWIvZWh1Vy84QU4rMk5Ja3BIYXgxMXVLTG9xanc2Wmc5Z0poWHNv?=
 =?utf-8?B?M0hoaHZmbmw5ZXhUTmZsbU8vK1B3NGJmTG8rVFBhdTgzWk9mMFV2Mi9HUUU1?=
 =?utf-8?B?ZFdwdExKdzlsMWFsVHhaT0k2SjRqWWdPYTlDYnJFWWwrTFpZdFRmV0ZsOHRl?=
 =?utf-8?B?ZkNGWFdmU28yRjFQSy83STB0WmE1RzVvbEtvYjRyVG5FRU1CRnVRWXdxRjNz?=
 =?utf-8?B?aTFSaHg3OWkvOERJbTRlaFRlaWl5eXZ4VFZ1VjY1QzdCVUR4V01NZm00c1pJ?=
 =?utf-8?B?ckF5YXZxc1lRV1l0NDhtcVZDK3N2MjRxa0QvOGFPUkFNdkNzYkpzd3JTUEk4?=
 =?utf-8?B?UnhuYnA3bVVLQnNMRjZDOFlFTDZQOGxOVFB5OHliTkRwbWZSall4Wmp2czhx?=
 =?utf-8?B?bHh3aHlZQm1Yek9wYzFqYlltNUhCZFhsdnBCY3l4TzNOMTQ0ZHd3TW5SVkpP?=
 =?utf-8?B?Y3NpTW1UQkhvYzVHcVlOV0FraTRRSjUyQkV6Zm1pRFIvUWVpdTN1emx2cm4r?=
 =?utf-8?B?UGlqVjUwYW1qaWQrdmNBa0RpWlVKZWNtb3RxYUp0WlljeUxicVlPL0R5U0Uy?=
 =?utf-8?Q?Ptgg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR12MB3997.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(10070799003)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d0tlK0Nxc1BlZ2NYdTYrUm5ZL21XK2gxNTRPZTRGNVVvZXdSbWgyZXJtRVRW?=
 =?utf-8?B?ek1WS3BJbG5hV0tMRUJEK1BPWi9XWHJibjc0TmZMYW1YcERLdmk2Zk9OUjJq?=
 =?utf-8?B?NTlWS3RzU0RGZGplVEFhLzZwcXBzOHpKVTYyamhwOHVSb0ExL2lvR2hId0Ev?=
 =?utf-8?B?Y05BS0dNT0FNRzI5amhuNzdBNTc2ZDhjMlkwU3ZLUDdxNWp6NEtLUWx2VTZo?=
 =?utf-8?B?K2Roc2o1Vzdmb3cxR0xIV0hicVAzL3FkZVhTUGdhckNZQTVmdUJ2VjVjOUFG?=
 =?utf-8?B?b2grbHphUk1qencwbXVUU2Q1dlk4dzRudGlNejIxQ2hWRW1YZ3cyY2JyaXRC?=
 =?utf-8?B?S253NkxZYUtoRUtMdWwxdzFjbndkdjN3b0gxMXN2aFdCbk1sR1JVWVBmVU14?=
 =?utf-8?B?Vm93QjdsS0xyaUxLNCsySy9SSFFPMlRyZkYwNTQyOHhEL2ZmaStWRElhQTlJ?=
 =?utf-8?B?WjM0QzF2RFJXSEtnZmpTS1BseG5qNWpUdnFsWGViU3hIcDFmU0o1VWZsQk85?=
 =?utf-8?B?a0Y5WlVoMy9xdkNGempYNE1RVjRqZ2hzeHV3c2JDbHZDVGx0VEZvR1ZrUDU0?=
 =?utf-8?B?aXBicEdOV2UzeThEdHV3bko2R3RNL08ra2oyczhiNy9aTSszWDc5U3IxRmRq?=
 =?utf-8?B?KzZ0bllOa1p0N1FIRnlubnVWb2szb0RveDlyS0NIYW5tN1k2RjFYRnJ2a2JS?=
 =?utf-8?B?azYrclF2bGk1WU0zQy9QYlNKYTlCalgzbDM3WnVvUXNyWWJmYmVERDRrakFC?=
 =?utf-8?B?MU9UcG10M3dpdDhFSDBQMHh1b3dTeEU1NFF1SXlFL2tCNjd6TVV3UWFCQ25M?=
 =?utf-8?B?MmlVaVd0aEg5ajlqYTBQQ085aGJjK0JHRnk2ZEZIcktzbnRNeDRGSEcyQ3gv?=
 =?utf-8?B?RmZ3YmlCMmZhN1o0U3Z2anZsTERiS0hXTEtSdklJTGJ3ZzJaR3dXcFJ6VHU5?=
 =?utf-8?B?MFRsbURQODVnWWsrTzZUTy9CbldZMkZkYlczcW8xeTlzTnl2d1MxUHdYeG96?=
 =?utf-8?B?SmVqTjRydlRrbHdXTVN6TzN6TWJOZm00ZWovQkMzS3A4UUljM0l0aXJJbng1?=
 =?utf-8?B?b0tGTXB5V3ZQUHJkVWdnWXl0SCtJbzRweVhjMUhVd3h1Vy9rUkk4TDNyYTJk?=
 =?utf-8?B?UFVPbFMwQk9MQmhBNkNKWlV6OWdOM1ROVXRlVXdORHhtcGtqWHJqTW9IUnRx?=
 =?utf-8?B?ZjFRaFlkWWxoMkhoR3doK1RXaUtId0g0RGl1Z1B5SVphdUFPSU5jSDFOSng5?=
 =?utf-8?B?VE1Yb0hseE5TbnlsVGlDWmxCN2tIOGM1TkcrK0pFRE5RR1kyNjBJWSs3dFFC?=
 =?utf-8?B?QitZcDhBNC96SjFvL05GU2dqMUFVdldRaS9Qc0x6cW52cnJuZnd5L3F6dTBP?=
 =?utf-8?B?aFZic0NKei96aCtMWkxPeGNDcWZ4Yklwd0w5VVdaRUg2MFJxSnBFL1lMOENJ?=
 =?utf-8?B?TkRvNXVJZnZtcmkvR01tSlowZnJ5bm1ad1o4L240elp4MFQ2WnpMY2RScWZM?=
 =?utf-8?B?V2k5cGhYNmt0d21ZSFJya0ppOC9zZENBMnBBOGJWTm1ZYlB3ajhubVFCblpx?=
 =?utf-8?B?MnM5dldBd01RVGJJb00yeXl6dVYyL2ZXaVZvR2xYSHhaR2RzVWV6OFNVUExO?=
 =?utf-8?B?cTZoQ2ExZWF0YndwcmRhOFRPS0xWcU1QZjFTRGVsbkQ1S002TXVBYUZBc0lX?=
 =?utf-8?B?dmtGYUFzb1kwNDFvMjJQSU4wVUhZdi9SbGJoemhWbEd6bFh0MXM4T1BmRXRK?=
 =?utf-8?B?KzFDcDhZVGdTalFucDdiV3JsMUd3Q1RDYWN5Rnl4dDF5SkJQd1BYeHdVZFE5?=
 =?utf-8?B?bVFtL1NRTnVKbkdTbGU0Nkk4UXVQbC9lMVZiUWNaZnhuemlTcnE0dDFiMndN?=
 =?utf-8?B?VUhuVnl1UUpFV3hDYnhwYmhocDBlczNjNHJraGNaamVHcGtiOXRsUjBkRVMx?=
 =?utf-8?B?ZWhJMEdSWDVLUnVKSXkrS05wbTJ2OEV2T0dHWG1sSjNoQXBZOGplTmxpU1RO?=
 =?utf-8?B?M2hKZHlVZGxwQXlVNU9UdmdCa2d3bjkrWk1xV3FqOGV4SmpDajFvN1dtR2w1?=
 =?utf-8?B?R3V3by8zajVTNWtGMEN3M3pYb2hiWUI5eEVGK2xTamRYVjk2WUhmdWFQcG11?=
 =?utf-8?B?UGdSVnh6V0pmZXJxR3ZaUUxndDJDb2VvSlJRT1dTZTk1MFlRTlh2VlhjVnds?=
 =?utf-8?B?STZBWXZ4eE9weWdkVjRodXhLenBNQlZFZVJKLzAzRkV2a1ExOFFmZjhGbGg2?=
 =?utf-8?B?N1BVNnhWbW9raENHZzJmSlllWXR1TVVHNUdFK0NiNlBTN2V0eCtmMFZna2ZZ?=
 =?utf-8?B?ZnNhSWlFY0FYMGRsT01jZ1lraGZhb3NvdzhaWWhIZ0pjbkJpQnhRcTZnQnZ1?=
 =?utf-8?Q?rRuCfdsHaK2QOgGsthoYkIgfhgji2TPLLAI/pqVZ/6Hv0?=
X-MS-Exchange-AntiSpam-MessageData-1: OgCJMl6+TPZxUg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e345a86d-c2da-4572-9136-08de6f500c1b
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2026 00:44:33.3734
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8OwETIKyURkyAVRp+rqDcodk8tK/09GXA5JAwImZLu1156EDI85jRH0KZG7UFtHgrL88xLt+RQfC6QcAlxciWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8832

On Thu Feb 19, 2026 at 5:55 AM JST, Joel Fernandes wrote:
> nova-core will use the GPU buddy allocator for physical VRAM management.
> Enable it in Kconfig.

Subject prefix should just be `nova-core:`, as this touches the module's
configuration.

I'd also suggest to select `GPU_BUDDY` in the series that actively
starts using it.

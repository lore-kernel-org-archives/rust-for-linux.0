Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012064.outbound.protection.outlook.com [40.107.200.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25CF521FF2E;
	Thu,  4 Dec 2025 14:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764859587; cv=fail; b=YH+mLqukj4xwOVKMjPPo06Dvscq0jNnCk5PsMNYUxesq5FMUWhla4zF5y9UJbke7ZJ5FOSdmoDFVgyYpfnUtRzs/eAE+Pcnntb9ohDfKTWNqt5k5wKfVOEfEMK/iDPz3NwNFgbAIjbSeLn7Qs6ipQB/8huHNi8Fsxnipyn7BQwk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764859587; c=relaxed/simple;
	bh=kk51XeBBAaDdnaV8ptzW9xBDtM5Wy5ysTvTMz/9MXbY=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=D6lg+8QDacS9alQtIOW3pEwsxqc2uyIHcv6nGXd8HvfgfSwdlQhsoJCh1nLldNp5uVQ7Ofgl4ViSL64+PUy2yQdgeekHuq7S3y4lgiREJJSWuHW6eGuVUVEDTUtdS15jiMUfkorwVM++rNQqM9+/ja3W2Ryn1jWs372w4otZ0O4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=TnaGHeiO; arc=fail smtp.client-ip=40.107.200.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="TnaGHeiO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QprSA9iuoAJeWRN+T640AcDEbnWleNnQRQzW2u4VHiAwHD7+FdVmXPmbgkRwIXqT/ITMrBrptpJf7Eqd1U98h8+CdRSXmm8a5H2jg9NaZ+qYfvgJhAhdobxpV2QIJQIidwEuvde/5s2d0eFIvDMSykxtnsmUoU8mpzjB0Uh4XnXWI7A3Xv2QpAF09QQmeWZ9Bed+cfWM/k+NTftAuLFF49juSquXtdesXb7MuAwQThmFAN6iAO/eArVViRacSNfdYcg/VDxEHxiZCq5Co6vy3EAlO4q8HvDyZANOhrc43y3I5d0NV06qGUfO367XZ3Pf3vUILe/jw5obA1FUk13I9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rWyd5PCqQdwCiakf6DGb2HU4rayv4eji7CrdKfws6MU=;
 b=qJ9N+hevH1sH57mhzIe/ATamuR89m7njSASOP1fCjsKDBsb9S2nJKAO1FzK331koVpy9Bn+VOS/g7EHx+1tzWjLTISoVLPUMwqHbSA3Z0Nl4AAhVtffSkRl+O+Wy3o0aEe6ieDTqv2qLtBwqxNqwtIWEISJTB5AIX39XvjRxAAra/XpZD/YtfgY2eYvzM6rWaeIVl8Jnnpt0OeiXgpym4kETib808xMK2ynik2gddLsmcmweRjzsXzTDNoq298rnKegOy2rtKLj1Fz5ml9sLigSbiKCBS+v8ih2HGAhB4rvpQJ9+gIgorXTmC4b6Idb/Lzp40GM/1koDZ65nb/tkyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rWyd5PCqQdwCiakf6DGb2HU4rayv4eji7CrdKfws6MU=;
 b=TnaGHeiOTtW9wUH+sMr9+MMb5UOletLkCaUYjBx6YoiGPW/1WmDrWGlJQZB0k6EWRbkoHp4ThVrEZJgBgN9aTof1jdN22eZk+F9MITSzumVZfYRJVy7vk++xNkIHyPzx4xHwgVTvZpM5RNbkivZIwczvT4yMfF8yaI4J4LE6tYTB/Gg1qH2uSL+LYuKCi2oEt6qD4to+vqxbU+ID7tWUwDybNNZer2KcgoVxwIGwXfgNjVjmr6ZBqIlUZ8Jj4beCGj17vKCmNLuN5fUtFNkWiL7KGk4sQkbHAAjGfAMhJ5Cdvu72+/u3bD+C4c1eKiFbHZ6vskeJaShZtvi6bGuCgg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DS0PR12MB7769.namprd12.prod.outlook.com (2603:10b6:8:138::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.11; Thu, 4 Dec
 2025 14:45:08 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9366.012; Thu, 4 Dec 2025
 14:45:08 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 04 Dec 2025 23:45:05 +0900
Message-Id: <DEPIHBWRUHYA.39BLL36OTCO2D@nvidia.com>
Cc: "Hsiu Che Yu" <yu.whisper.personal@gmail.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Yury Norov" <yury.norov@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Danilo
 Krummrich" <dakr@kernel.org>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3] rust: num: bounded: mark __new as unsafe
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>, "Alexandre Courbot"
 <acourbot@nvidia.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251204033849.23480-1-yu.whisper.personal@gmail.com>
 <DEPHSZUPUJBB.2YEABTJ7OR86T@nvidia.com>
 <CANiq72kYGE_mX=rXu=SXAgdrOisELbvqyx--QuBZEc9dNQ6ucw@mail.gmail.com>
In-Reply-To: <CANiq72kYGE_mX=rXu=SXAgdrOisELbvqyx--QuBZEc9dNQ6ucw@mail.gmail.com>
X-ClientProxiedBy: TY4PR01CA0027.jpnprd01.prod.outlook.com
 (2603:1096:405:2bf::11) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DS0PR12MB7769:EE_
X-MS-Office365-Filtering-Correlation-Id: f39c6058-eda7-472f-523d-08de3343b864
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|7416014|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UlBhWTRoelJIalIyRFNObnVWZjRmVlRVWkZEblF0d0M5S21NUzFEcGN1Ull1?=
 =?utf-8?B?N2NIOERkSG4zWi95eVROOHRSYzlvZEY4bDA0U0xrUit3STE3S2hzeWJENkx1?=
 =?utf-8?B?VXNsaGQ2NHdtRExuMEtBWmtrMHJBZ3c2SStMaStHVkZUSUlWZ2tVWFgzakFS?=
 =?utf-8?B?UnNyNFcvVTJ4c1ZVS0ZVY2J6OE8vUGRWUE5Nd0NNUHhSN3gyZUE3ME9PSjZq?=
 =?utf-8?B?YU4zT1lHNEtVU3ZiVkRqbG1XL0xVRElDejYzaVp5dnpOZnBKQTZGWnkyN0Uv?=
 =?utf-8?B?NlFYK1lsV1BmNTFWOWpXYU1ncE5JYnZnSks0ZVlUVnJpKytjRTV4RllOc05I?=
 =?utf-8?B?clBNZ05FYlF4Z2FtSnc4WUFCSEdmenl1WktjN0N2bXgvNlJZK3h3TmN0MFlp?=
 =?utf-8?B?RklkVkptTEdJWGcxcWtrU2phVlF2WVJDMXYxREpMUXI3dnBoVXZiQ3RzWXJM?=
 =?utf-8?B?VlJCN0hjMks0VGIwUm1ISitwcVhBbDB6Y2tNUXRqSWJjQm15cWtUNnVwM25o?=
 =?utf-8?B?VVFEZElXdHJXUGsraWpsbmdtWVcycURUTVRlL25KTXZtWWYzdGJHZVBsZFlw?=
 =?utf-8?B?MnhxaVd0TGZBYytLK2k2QVVEd3E0cXB3amlTNGVZd1lBYW9MMzhWUUFHc1RW?=
 =?utf-8?B?VkxGWi9tbTdncnpWSkpNTmsvNVM4OEhQSm93YnlpL0N6NXpubHdLR1RLWVBl?=
 =?utf-8?B?NVptNzl4dHhFUkJGamJRbEtiWTF5YTNnYklzUmVpT0tCL054RTJiaDdWSEZw?=
 =?utf-8?B?S3JGRURCN0UxWEJFMUNFVG8xc0l4cEhuUDlsZC9yeVVYcml2aUlkQ2lCWHJ3?=
 =?utf-8?B?TEZyZVN6Yk1HODhCcGtoZXI4d2hBaUdVTS94L2FHUmdFSWxsalVRNmlDeTdT?=
 =?utf-8?B?NjlZemhaMXpPbWVpODBISmxteTNKRmpORitVRmhqdzV2TFllUGt4NHlCdkpi?=
 =?utf-8?B?MllweFBhdTkyZzFXVit4cW1xeFBzOEpIdHYyZDZoYnBrRncrTzV1TnNndnU5?=
 =?utf-8?B?ZXU3R1dZcEJuL0l3dFhmdlFZa2RCKzlHNHFLOHVMbld0aTF6QU5ld1J3MW5U?=
 =?utf-8?B?dit5YnJNTTl1bUw3bEFJWnBQWW9KYUF2dUhWTXlzVWdkZFc4WHQ2cUtWdmd0?=
 =?utf-8?B?U2ZpVnFVU3RlUStZT24yb0MxekhHUkZJR1BmWXM4TGRUbWxUa1dZVDlpV0Ey?=
 =?utf-8?B?dkJadlRHSzM1SG5vYkEvT2puZmZxcUFyZzVRVm50MTBibERlSEgxYkp0cFhJ?=
 =?utf-8?B?Z2doU09vajh1QlRKdFZUUzFaaWp3c0dSYk84UlBuL1UzeTNidnRyNE1yNTcy?=
 =?utf-8?B?QlR3cnpTTGNUMlVEUVpsbTJNcTd5dnB4YXZSSktXa1hMSGR5aWN5VUpEcnRH?=
 =?utf-8?B?QjFmbk0vY20wYkxyZXJvVS9yK2ltWS9KRENzL1lwRk1hNjF1YzhnVWd3Sytr?=
 =?utf-8?B?c0Q1bEx2cUNTbzdXdTJFT2hmVGptV1JTSi9weDVJZlF2ekZ4OTJZaXJ5SlRW?=
 =?utf-8?B?NDNVdzh2OTBsNjgwYkJNaWpneFRaVEpHOVFPODQ1RGhtRXpNZUJ2d21WbnU3?=
 =?utf-8?B?N0phdjFVMEw5SXJuL1RkN3QwcjYxNmFveW9aZ3Q0YTJielRhdGw2WGw3b3dP?=
 =?utf-8?B?cCtFRWpRTTVibE9IZWZTMHFrWUdaQlNXYmJVa1ZXaURUNjE2VUpBV3pFWG1G?=
 =?utf-8?B?cVRYWVNYZEpWMDBiZ1lPeXJzQ2I3YjFMZWxJTGJLUHlkYm1lZjRiZDJMWUxn?=
 =?utf-8?B?Sm9JWGhjSWZWV2dnWnNHMHRtM3JJb1drOXBSWDB5Q0FHWWlSWWlLN1JSVzlq?=
 =?utf-8?B?TExYUjh3T3BXaUxNVDlnM2VVMG1hZUxaOU1xVVJ4OGY2b0tEMWM2dlFEMzJH?=
 =?utf-8?B?bHd5WFh0OUs5NWdlRkxodVp4V1NkT3k3ZVluTUVONG1oN3hYYlcwdW1VSUpY?=
 =?utf-8?Q?SBRkVV1ZzVNyht4FAUOuSnI6jEz3ZHWy?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7416014)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bVNLcmNUYk9OemxqZkVadmpSYU9kTWRXRW5aemJNL0ppK2VHNy9Kcm42eldm?=
 =?utf-8?B?bVpmc0REelRqWlIxMHpnMHJFUWhKNDNPVDc3cExqMVNTNTdxMFcwYlBxZWtj?=
 =?utf-8?B?YWZHWVBPSXJVMEJrVElKb0VIc2NvcHlaSWlkNnhhWjRXKzFCQ1NjS1ZyWkJ1?=
 =?utf-8?B?SnJ4VW80QkpmLzFBSjM0S0tualdET0dLSmhPMjUrRGxoSzUrMU9tYXFwODZJ?=
 =?utf-8?B?cjZidmY0dzJCbnRZRk1ELzJvb0MxaXE0bzBsQnVyaDJwYW03c2c3dUc1dWlF?=
 =?utf-8?B?V042SERTR0FkQUhXQ0NZWVdBNVNsSU90cFo3a2N0ZHFYbzBXcVNTd0dJVi9S?=
 =?utf-8?B?Z1duS2pkcXYyZnNzZnRwRXB1NW0rQ2llWnUvWkIyU0pLdWdOcUZDdFN6a0Zz?=
 =?utf-8?B?cTNFbXNlb25WYW1CTmtWc0RYUEpKb0J5MWtxamhheWlaYkhhQUNBM21ZWGUz?=
 =?utf-8?B?NjY1V3JzZVMyellsVkx1MHR5RitLQWdVbnBiaFhZdEs1NlVwbzVuWUZRTU4v?=
 =?utf-8?B?UUpqYWFaclhuSDVXVG5hdkV4cTc0ZXR4VGw5cUNpZENGVFhGVkxsQkhmZEJC?=
 =?utf-8?B?OWZjMjdSeU9NeUtXKytGcWkyZWN4RmRQK1ZrYU82NzhrbGg4bUVFRzEzTGJL?=
 =?utf-8?B?aU1ETFEzaFNVdWRiTmhnUDErUTZqZGNFRUFqWWoxeDB3T3F1cjdCRGV2dFVz?=
 =?utf-8?B?a2RzYjR5czZwVDE3WllqVzFsNkJRL1l6NTh6M3RQdjN0RjUzSldtVkxPYXlX?=
 =?utf-8?B?cmVoKzd5WEJ0alFXU0VScFVyWGo4WkNYcm9xZVNDZ25rblpaaXg0Z0NPYjNa?=
 =?utf-8?B?S1FyOTNtRS9hNmVLTEoyTFZjYlJGY1FyeHhmQ0dXNURpZkh3TmZ5R21pcWhl?=
 =?utf-8?B?ZFZITit5VzhTU2RGTUY0NitKQTJXY1JoSDhkS1pza1JFZFdGZG5nT3ladTd5?=
 =?utf-8?B?MTZSQ2ZGem1yUUQxRWxrd0drdVN3ODJlQ0Zyb010cFJ3VXEwYlJ3VlBhTzk3?=
 =?utf-8?B?eVBHNVlXZVd6Y25jT0Fwd1pjekhsZXlUZjVkUkFGa21PbWtIVDBXWXV5VG52?=
 =?utf-8?B?aGxLOXlqYmVwV3I4aTMvZFM2TUZQd28rdUpET3FjSGF2WHpLbERHSmQ5SjRE?=
 =?utf-8?B?SWlrNzNPMHQzRDMrbU03MG5RNldXUmNSc0NveEphYXpMNUlBbTJuVGNaaFZv?=
 =?utf-8?B?UGplZXF1UGpEc2tzakVoZkdWVlF0dW1XTUV1aitqaFdDZFZtMTI0bk95SndD?=
 =?utf-8?B?SWJwSk56d2UwV2RFdmkyWE1kQWgrZ3drRU9PZ2NzQmc5UndJMk5xc3h4NHkw?=
 =?utf-8?B?cVVsQXpTUVoxZXQvd010bGEvMHhiVWlzTVNkRmVZclpCSWYrenhTTTVpd3oy?=
 =?utf-8?B?Q2o3Z0FTRENPOWpLcGxpMHdxYm9ZZG9wUkQzQ3E5Tjd6M0dZYk1jWXpkUGt2?=
 =?utf-8?B?ZWtJNkxWWkNrRDEvWC9IS3hNRDdiQ3pZczhvZm40RnBxaWt4MXJySXJiTGFG?=
 =?utf-8?B?bGVSTUFXUndPTXAxZGdNQ2U3SmcwN3A2ZzZCRVZIVGg1dTJydXF2RzNsODJI?=
 =?utf-8?B?VUJJSzNtVjVLYmg2b2pCL1R3a1k3MFhhZGhoN2FaMGtHY2E2NWdaT3Rlb1Ba?=
 =?utf-8?B?ZEFlQlpTbVBLbHdUWEVPdmY0eHk0b05yYUYxaG9NNERRNU14OThwYi9EbXZE?=
 =?utf-8?B?N2J1MklsVFVsK1l3YVNiN1hPUE13YkxDY0cvbHBkbzlaUlEyeDcyT2wyTWNv?=
 =?utf-8?B?MVBVU20xUWwxWEtoUVFMS1Ayb0VHN3ZXYW8zdWRVVmZ0dmFrR3RjTnRsOEN2?=
 =?utf-8?B?U04xOS9NdzBpd2dRUEI4ZEdtT3R6dUZZQ2JSMkxOYkdPQWNXVzN0N0ZFZFlX?=
 =?utf-8?B?TmJEK1B2YXJrWnBsY3dvb2ZyVit2bVV2ZmttTzRGd0Z2WHhQUGVlVmFxMjQ0?=
 =?utf-8?B?OWlOalVaM2I1RzBacktMUzI3VVBkQnUrME5QQ2RlcFRDQ1F5NmdjMmJTZjUr?=
 =?utf-8?B?SG5DODEzNHBHU2Q5TkJKbFBIWVkvM1VpSWpmR1JmUTlrT0RJWnFXRTlCbVRo?=
 =?utf-8?B?b1RoOGdZZlFPT2hXd3BtVExiRVRQalN4Z3dYaTZZU2k5SFh6YzRsQ0ZvbjFL?=
 =?utf-8?B?VjhmYm9iaVROa093WHdhMjk5THlKNm95YW54ekR3QW9nWis5SXNaeGl3L042?=
 =?utf-8?Q?oCJDj37fUmLYQiu9pVr7Z82g7skp1e9sq7rQYr63Fj88?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f39c6058-eda7-472f-523d-08de3343b864
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2025 14:45:08.3705
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aM6NN4UGNmz1LTZIhvwcIeHVj05hd8lM9RYXwi/q7tKdD3SJaEQtb2x9jSkjMeLX6tXuzUNptInf8aUSXEpO/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7769

On Thu Dec 4, 2025 at 11:28 PM JST, Miguel Ojeda wrote:
> On Thu, Dec 4, 2025 at 3:13=E2=80=AFPM Alexandre Courbot <acourbot@nvidia=
.com> wrote:
>>
>> Miguel, do you prefer to take this directly, or should I gather all the
>> `num/*` patches and send you a PR in one go sometime later?
>
> Just to avoid forgetting later, which ones do you mean? i.e. I have
> these in my radar:
>
>     [PATCH v3] rust: num: bounded: mark __new as unsafe
>     [PATCH] rust: num: fix typos in Bounded documentation
>     [PATCH] rust: num: bounded: rename `try_into_bitint` to `try_into_bou=
nded`
>     One in [PATCH v2 0/7] rust: build_assert: document and fix use
> with function arguments
>
> None seems urgent, i.e. they can be added to `rust-fixes` after -rc1 I
> think, right?

Oh yes, actually I was thinking about rust-next rather than rust-fixes,
but that works as well. My point was more about taking the mental burden
of tracking this off your shoulders. :)

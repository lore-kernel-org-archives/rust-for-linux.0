Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011018.outbound.protection.outlook.com [40.93.194.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47B0D326D57;
	Mon, 15 Dec 2025 05:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765777768; cv=fail; b=cHD3shg6wWok20UeWpWLN2dJs0gzA4/k2TavC+N4XfU8ZNhKK/8XqDGDLUZGpWUrBtBI3ggvuXL2jmPC2ZSRXfufsvnCgr9Q/7KrM+fPLWzfSLRXsyFmIzczlv5w6VzHeK4DXdoX0pAiyHRJt+K2GS8bCfADOBrcwn0KRJP5maQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765777768; c=relaxed/simple;
	bh=CVvdxmmioBD5/zFfL2bOrEo1q6Tj8CqvyZ5IIiYx3AI=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=J6zNWUOlozD76/4r9tuTXDXuWX038L5JLker9zKzvuzg/yEau5WlPAspa7hykf+gbWn9tLeruDQJTY0VrqwMkJxnk2GlfXzCgfYEdoGXjDW40X77CWsLvLAOb5mqaO0Vg1OwF/nqjnB7W/Ckx1LK/Kpd0j5GU0K02O5r5zWaLXc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=osCWUJx0; arc=fail smtp.client-ip=40.93.194.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="osCWUJx0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TDNqo4rvLrgfJVq4Z1cJ12xInEQbukX/ZOJiuJLyjl3mjfwzS9TfOoH04xf+7mHhAa6xmj3am+zaAJEd7tTj9TfhnyP6D8TQUyonSUGYVLbERrdn88A6sxgTCBRC7tH+w/RAUqaVOlT1s4AL69Sjh/AJslPmRFWJ3w1dU6tIefQqdwYUz0aELNOL7AGAa8gEu10tzsTRKRIhqPVZMY9D5IAA6UDEpGjuwPXqEBKISGjRrSXDKtgTJQYgbdArKI+HBiNdGPk+mWsJlRNZj0sXdDofbM1Wor4k1PRIb6NiMbn9SaRH10qqTWR4xFDmhbOZ9zIogkRsa8+qo34G1OyBcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R4sFjwTioeJinVT32YRM2sBVZl+frgAsKMvgXeoW0hM=;
 b=U6ZFkauD50jkeJjLU1KAWlJWMQtB6LUI+zLlWBZwFwkdlN+M6GNkU/BCsuGnTcNTgeMInyQ1dxre9IgC9LJavoErs0jzATBklyPEAo1YXQa4fX7e0Ofs84mnl4jsnoF695RGslKHAUdSUoA1I0UylBQQW4VANVY9hJQOLbrO8FIRdtU8LHYc+IABABbvwMwIpwtt2IZanBKPxZeY5aR2IfX4dOANW5JOlv44TMQ8EAseM3eL4ki+9J0/H2qFcV+rCkz5jg2BeP8m8ysHZL3yHTvL1QoYiDxitj3OsYDbl7Q8+qjjZK9m/GlxvLb7xgT/LPu7VfMpxCfxr31z12kDmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R4sFjwTioeJinVT32YRM2sBVZl+frgAsKMvgXeoW0hM=;
 b=osCWUJx0aAictc3oyEYY40y6mQADEEeZc7j4yLFUMnJOW1/nqGCQWM6G9R6C2FyWnDHhoAQ252ALxIoVm+xUilvTEy+RPedtYfNXIsQp6DlS1PxPN8zD9B4LZxwtSt9B7hTLyd5XhN9n66bOsX1ZwCKHpSYWyqYhQyfDeB4s86JmBDMoCF/t0hYyOvCY4LAyPF9QPn5AdFQABSDL5PzgHWm3K3W4KofLm1OU9yPCeP/GZF/l5mRayBwGjalbYNgyVCok20FaVG3oQ6bzPPrAp6LeVyQ6BrqtgqLVR1qsxMJFpWVQaevZKi4BRIxs337DyQO+z1DupVWfH0h5kMIZDA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH7PR12MB6935.namprd12.prod.outlook.com (2603:10b6:510:1b9::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Mon, 15 Dec
 2025 05:49:24 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9412.011; Mon, 15 Dec 2025
 05:49:24 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Mon, 15 Dec 2025 14:49:10 +0900
Subject: [PATCH v4 2/2] gpu: nova-core: gsp: use () as message type for
 GspInitDone message
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251215-transmute_unit-v4-2-477d71ec7c23@nvidia.com>
References: <20251215-transmute_unit-v4-0-477d71ec7c23@nvidia.com>
In-Reply-To: <20251215-transmute_unit-v4-0-477d71ec7c23@nvidia.com>
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>
Cc: John Hubbard <jhubbard@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Edwin Peer <epeer@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, 
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TYCP286CA0239.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c7::17) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH7PR12MB6935:EE_
X-MS-Office365-Filtering-Correlation-Id: c55d3dfd-12ca-4122-57ed-08de3b9db385
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|1800799024|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OWpiVERUSGlCVFRyeDB2TVVFb1krTGxVYlNuOFB5UlJuZlptUGh5VHdTeHZR?=
 =?utf-8?B?d3ZzNHJlNENVODdxT09mQkRBZEEvQ0drd0tPalQ4czZmVm1VK3VuY3c1eDhW?=
 =?utf-8?B?UmlZZmF1UXFoNXBCNTZjeStBYnhuZlhzR2d2QjA0d0I3SGpJeDUxWW80aFJN?=
 =?utf-8?B?bjhQYVVUOEY3SmVCTC9Sb3F2MkVBaWEveHEreDM1QnBlVHhjdy9qWEVMT2pz?=
 =?utf-8?B?Z2FjOElRMXJDQ3E4WllJSk01Z0ZlV0xEazc5OU1uODJDc3ByTy9mUngvd0pD?=
 =?utf-8?B?aHNPT2dRY3RzMGJwWVBuQTNkR2FWOXBKQVh1NmpoZFpaWWwxRWZ1aHJ3OGZv?=
 =?utf-8?B?N000OVdkeVdQdGtZelVreDY2ek1lWXFVK05BcXBWV1drSVcvSmJTdFltUDNH?=
 =?utf-8?B?a2RVR3F3cjNNc0ZqSFh1K3JwVFh6U3c2d1lvdE5McTdHUGVrRXZvNDJxeTlX?=
 =?utf-8?B?dllRakRiSHlQVW9aYW1CREE4dXJwWC9xbm04ZHkxeXovcFN6TmNDQlZPVUtV?=
 =?utf-8?B?aDBobTkwUnd1N0VOU0d2WjRZUE5oVFRPeDVCU3lMNTdCcjB2ejdNc1hLU3RR?=
 =?utf-8?B?TzRnM3oxYTVKQTU0S2lsMno2c2p5cVY2WFMyeEU5WjYyQkhpNTNad3JGUTdQ?=
 =?utf-8?B?YmQ0OUpUSTlFSHVreGdRSDdsYU9uVkp1MG40Z1F5MFRVN3VoeVplSFQ0MnN6?=
 =?utf-8?B?MUE5RGRwcXdnUnpYdkxxUmJHLzIwUUlUeXZRc1UvRE51QU5FNk1scmhjRmFr?=
 =?utf-8?B?Q0tMaUIyaHZhb1RiOGpiVGZXWmlZRlU0elhaMlhyeTg3RGhNcHZJdS9QUFBQ?=
 =?utf-8?B?dTRZQXJFaGRDeFRZT3dlWjF2bEZFM2ljOHlwb3BDQTVlcW5JMmtTeGtRQ1JH?=
 =?utf-8?B?NUFCaVVoWDgwZlNYditicW5oU3ltMVhuUU1jT05yUHBrQkVKcE0xamNidFI3?=
 =?utf-8?B?b2hjMXREUWliU0dnYTZCU3ZmRUhEVXNoTmNrcGVVMkp5UFl0UkhQTkZiWCt3?=
 =?utf-8?B?QndtN1ZhZlVRSlBjbHV4YWF4RmtMWklVMTFHLzAyMXhSRHRwUkZLbmxlQm5h?=
 =?utf-8?B?b1d1NTQrRldFa1hNNllmS1lDc3pGc1dpWWpkUW9tT2ZOM1k1eVgrQTVLRERM?=
 =?utf-8?B?ZXFnRHFRejc0RWlKdzNHanFtTGVYbE14Nk13SFNvbDc4UTZwZ3k5ditEME5Y?=
 =?utf-8?B?aDVKWDJOTFZDQmRxMlNKSjR3K25MMWoxYWxtdWNHdXd3ZExuUGxQYkFkbTI2?=
 =?utf-8?B?Y0VKRzFaL2R0UEJYUDlSNXFPbmxISG9MbUUrOUtmMThUNzgyZ3JJdHhUVVNv?=
 =?utf-8?B?bnRiZHhTRWNLYURiOG5VV25pZjl5d09hWmtyc0lZOWZabmtBL3p4TTBUM3lC?=
 =?utf-8?B?L1cvazBITGI3T0xTN0ZNQW5TVEQ5WS9qNFI5T1dTd1JQN2xIMzU3bFkzd3Uy?=
 =?utf-8?B?SjdwLy85aXR5aDF0V2xNMXBEZFpXZFp4c3ppN3dHejErQzd2ejZXMlZKUGZv?=
 =?utf-8?B?U3JWYzZWMUJ3V01ack15U2FleHNDQmhHU1MzUnByaTBHa05ycU9QSGdLbndt?=
 =?utf-8?B?YjluTUxPSVNXdzhBNjdZaHJ3aGxIbUVleVV1cmlxSEk2bndZK3FCUU1tZ0RS?=
 =?utf-8?B?N3lPUnhpS1IwUHdCTDZwL2I0TGhQclF1bnJCMVRTN3Zsbm1nRkY2SWpRWUFG?=
 =?utf-8?B?VnFKVkViR3ljMXhoeExVeXZGZlFBUEd2QXdBNmNEQ084dkgwVUp4cmY5UExM?=
 =?utf-8?B?WnZPbDhjbzUrSDhrTDZoZDF3Q3hqVGo3dzkrRUVKSmdrZ2RncktOK0NSWEZ6?=
 =?utf-8?B?SVVaYzVmbDJxRmxuRGdNUEF0WGJiRWRIVWQ2M3hMbU9BRFRjWXNNREtiT2da?=
 =?utf-8?B?cXZEZlZNZlRlNGEveG9MS3MxanZhcU5hZ0tJTUlINWJPMnZSNEQrYlpZclg0?=
 =?utf-8?Q?HuqQmo4fdyfzqAodUjRsakGGmeUp4AoX?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RDd3MUIrVjJZYWQ5ZkJ6YWRndGRVMFI0MVJjQkk5NWV0QUovMzRyUnlEa3l6?=
 =?utf-8?B?K21MdnZQNWVzUFRTZEdBQThManRXTk9vbWhSdGQ5MElCYUV6TW1PclUzd1BQ?=
 =?utf-8?B?b0lYY1BqSllUSEFGcmpDb3R5bk9Ia3Rjb2RSRFpmbzlmTmJEdE8vVXMvUXdH?=
 =?utf-8?B?dnlxb2pjMHZENUhOTktqdCtUOVliVTNjNE5yS2doV3Vld1NNWnBaWTRFL1NW?=
 =?utf-8?B?ZXhodGVNaTU1NnU0dmh4WThIU1h0eWJiWGVKR1ZuNmJ6SzdXS1BnWjRuaEIx?=
 =?utf-8?B?VVVxUHF0THJzZ2RScUhvcDJRWkJ4V2x5SndSTW5BMHQ2K3JtNFNuT25ra0Zt?=
 =?utf-8?B?SlBxdW5MVmo0R0J2Rjk5UjhNbnl2VDV5akVzc2ROaUZZV280MktLMFdCQXo1?=
 =?utf-8?B?OFhKSEhnM2dDZVZ6ekJVSFBTeVNXa0NINmlpL0FVcVhuMlUzYmgyYTgyMEtS?=
 =?utf-8?B?NHVnaTVTd09LM1FCV0tSQVF5bUF4eHFTUjRkOG1JVXdSSW43U1ljUGphVWxq?=
 =?utf-8?B?dCtUQnpwU2V1VjVWVDhoUFRCU3hRQlFna3N5ODVEQ1Nod0hvUmhNZXE3ZjJV?=
 =?utf-8?B?aSs5T0hqbWhxUjg5aUxaaWZnV25QRkZDZlNTOFdsM2tlYlRmVXpvRmFXazd2?=
 =?utf-8?B?ZEh2ZlNEOVdSZmlxSVFPVnQ5Mm1aSmkzKzNNbUFrQk5WNnNvR0Y0VUh1emEz?=
 =?utf-8?B?N2pmRWNZaU9FVlF5ZmdKWklxb2t6ZnJOdC8zdEErbFF5VTh3bUVsbndoRWdJ?=
 =?utf-8?B?c0V0dk51SWxGZVJrTjVEZVlzWEp3WlV3Qk9OaWJGbUNNWTZBUU12K0hSRHRN?=
 =?utf-8?B?aldCU2RkdHJXQyt4ci9DZjRGVUZGLzc2bVdBT1Y3RDhzRnZoUGFMcDlpZXo2?=
 =?utf-8?B?cDNIZ0VQbUN3SUM2d0poanhibUZCUDRlRUxtR0NFR1ptNXRTMzZET2lGdnk3?=
 =?utf-8?B?Vzh4Ync5YzAvN0hPVDl0WUx3M29HeXF0MVV4U0ZscU5TTnNhSU9rMEFUT1NR?=
 =?utf-8?B?K0IwNCtENGIwdjN3SUg1d1ZIZWIzMDk5OWpqRGxRdHFYTWZvays1ZlM2VGpq?=
 =?utf-8?B?ZjhVQ2FQOWFLek43TEFGdmRLZnc2Y0cyRUJWQnJERGhnNnY3WmlLRERYT1Na?=
 =?utf-8?B?aXBFNkQzSjFxN2hWbUFxalFjYlpvSVd4NUlYNEk3djFUNEEwSi82aUZjSmxQ?=
 =?utf-8?B?UmhzcWVPcDZvMFlaTmVuM3F4QncxS0FKL280NjI3RHg4Mlh2NUxTM0hmQkZo?=
 =?utf-8?B?RXl5NDcwL2M3Z3djY3pMSkRocUxhTi9WQ2U1dWlKQTlKZG9JMi95ZzJxVUZq?=
 =?utf-8?B?WXFVMkc0aStYeFQyWXdYQ3hUM1ArWXdXMEpwTU0vUTlIWDNsUk1vclVoRzVM?=
 =?utf-8?B?enBqeG5QZXMrejQ1RC8xbnRRaHp2VUVVQU1OR0xia0M3d0treEtNMXFpOHpC?=
 =?utf-8?B?aW9VSm9ETzRGei9KM0paQS9XdkdxLzZ1SVZvT3lldWZYMlRRNFdvb0JxUlgx?=
 =?utf-8?B?Z0EwQ01MTnBDSmR4b3ZBNXIvemh5NVg1Y29lOUhaNXNRK3gycFVyWGFrM1RI?=
 =?utf-8?B?Sm93WlVUeTMrREEzRVFUREtEWGlFblNTVnBrakFvZStTbkFiTDhwNG0rRCti?=
 =?utf-8?B?UnlYV1FZcGpYTEl6MHoyMTdheGJINTJQTmNqbWVvbFJVNGQzRDllTDVuNW9r?=
 =?utf-8?B?S2p3S3U1NlFUTlJzUUVoNWJRR1czd3NOaDByU2NBZ1ovR0l5MFFibnJaNWNk?=
 =?utf-8?B?dE1CdDdFazQzNE41cjVmNEtPdVpTZ2JyanpxRXNjdUM4MlJaeHNHcEtyRm9O?=
 =?utf-8?B?Mk5vVDRKYTBsQ1M4aTVCdVR3dUY3bzZJRFdmOEp5ak42ZDRTdDM1WEhHeCt5?=
 =?utf-8?B?L1AzNnA4OFErTVp2U1lFMFJBTXFJODBMM2RtV1dFcUJhdEswbU5udmtBc09I?=
 =?utf-8?B?ZkRJRng5RVdldXl2eUdZSWZ3a1lUcWRoZUpqY3NyODdKQXhIS2l6RnVObU9B?=
 =?utf-8?B?VGxFbFgzQUVrY0dBNTVzZENPVXlGaTVDZExuRi8yUDl3ejFnUXpIS0dhMncv?=
 =?utf-8?B?V0F5aHB2UWZkRVVBYUorU3VxdlZPSUhDSFBEaXphMGtmUVFGSm5ITDlJM3ZX?=
 =?utf-8?B?Umg0VDEvd0ZEN0xZWVlvWmtiS1VjallNc1hIZm9sR04rUWlheVBhbnJLUElL?=
 =?utf-8?Q?aXPVltNkwuBr7mlcrY5MyZG8/TlMGvSxvQrDUNLJALXn?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c55d3dfd-12ca-4122-57ed-08de3b9db385
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2025 05:49:24.2049
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JV3HrIq83yrOo91EOq9xibZaXd1Cqif0H95wL1jZLTRU0JcdVrMH0h/MXvKmDRNAF/ecjJdlY0S72wCDvH5Dfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6935

`GspInitDone` has no payload whatsoever, so the unit type `()` is the
correct way to represent its message content. We can use it now that
`()` implements `FromBytes`.

Reviewed-by: Alistair Popple <apopple@nvidia.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/gsp/commands.rs | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/commands.rs b/drivers/gpu/nova-core/gsp/commands.rs
index 0425c65b5d6f..2050771f9b53 100644
--- a/drivers/gpu/nova-core/gsp/commands.rs
+++ b/drivers/gpu/nova-core/gsp/commands.rs
@@ -142,7 +142,7 @@ fn init_variable_payload(
 }
 
 /// Message type for GSP initialization done notification.
-struct GspInitDone {}
+struct GspInitDone;
 
 // SAFETY: `GspInitDone` is a zero-sized type with no bytes, therefore it
 // trivially has no uninitialized bytes.
@@ -151,13 +151,13 @@ unsafe impl FromBytes for GspInitDone {}
 impl MessageFromGsp for GspInitDone {
     const FUNCTION: MsgFunction = MsgFunction::GspInitDone;
     type InitError = Infallible;
-    type Message = GspInitDone;
+    type Message = ();
 
     fn read(
         _msg: &Self::Message,
         _sbuffer: &mut SBufferIter<array::IntoIter<&[u8], 2>>,
     ) -> Result<Self, Self::InitError> {
-        Ok(GspInitDone {})
+        Ok(GspInitDone)
     }
 }
 

-- 
2.52.0


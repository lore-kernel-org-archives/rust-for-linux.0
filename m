Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012008.outbound.protection.outlook.com [40.107.209.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8C1B1A2C0B;
	Sat, 24 Jan 2026 13:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769260049; cv=fail; b=J455vxUJEf4hQjWHHoyD7HPopfjSPI8cZ4ZaBjKcbLEBGqClbV4CZ0DXCtnxqjwL4KHBoFwenCGmY5G9vl+kq0QDP3mxWuDtiFNMPCTw2+DZOKGylUdAqwgW09SYkqsFGfFwirb1INMOi479hmN3GDSayxtPCQGqvlMvthf0B3M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769260049; c=relaxed/simple;
	bh=PoFJk7+Ex8WZSNkxAi/MNjQJyZfGqBCCvQcrhFC8v1M=;
	h=Content-Type:Date:Message-Id:To:Cc:Subject:From:References:
	 In-Reply-To:MIME-Version; b=YBVqDsMLmxD4S2IEsiJbg49Dpa4Oe71pQ1oQ7iJ9Of6SuSCANbsn9tzxlzeAngZSzfN6AIwon56vPu8R9nqCT+QPSsNr7Q78FBrd5hKwOP1QJvO6zrHIZJRPvOOLgUaHQsaMX1TKezYFXQccRKzbtEYJElRD2iiiyn2zOdi+MWg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=biygGpEO; arc=fail smtp.client-ip=40.107.209.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="biygGpEO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=anfVaZ28gmCvVMeiGYL/wd+gs5xmpTfRZHkNJedPogb26X/7oAGTqSL//VzWNIpzcYt8MWHw72qbskzsWzHUob5o/zEghpoZarpltmpwMVPXca44+/5W7CURmibJARvUFkAROjmew2EzrIujPTiYVxpaJBHQq0UZhmZPLyyiETDARTS0R8UHyeWC7nZcz4GWb9/sXGNcUWwPOMwYiJ5UGnxQZwaMOV2cc7UcUg1bm18I6Omvtq9wYlMGulJrbHORgeuh2CiVhGYb7QuEko8m8p/k1O9ZWRS5gofdHs86fJ/2GldSd2HEHdcpSPnwj4J1Zwjjmgxsji3mody4RpRkSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PoFJk7+Ex8WZSNkxAi/MNjQJyZfGqBCCvQcrhFC8v1M=;
 b=tiyhZ7j9ZCxcy2SEnMAOMUbyHI1SiqXzvki6BF+AgIikQu/mdwMiQQNo+k2JYLbaJC7pXkz0rtWSiuzPLWnBdTslam/Qbjp6uoyaZ3N8truXOtYNbnsZQ8NOb8EYKuYG/xhLh2E76BY1wtAWuZ2hUEfsKSt7mPfEzd4Wy4VdLJ+X0FDscNgsFMIt1TYwbhm5UNoeb7EM1L0himiPy83IK588WnzjiUihe4JwrX+tE24aTp4notjB6mTs+SBNmNkNoY9VbdV1TzThIpP/MHaYbir3ErCrs6pN/gz2rzNpQiqSnVLECyxuzHktb/SAyLB2Qefitc0pogeMfavtQsGaYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PoFJk7+Ex8WZSNkxAi/MNjQJyZfGqBCCvQcrhFC8v1M=;
 b=biygGpEOAvAR6TPWoDk6R8/aFzMoXK/hysjK83CIYqKaxISz87PBOD0ijB/bMeipfJaj+LrzRzHE/A1EYrM91Jul/NxXqysLBHFDsJv/SJy8ZRLKzNxYOSNYb/JNiCPksBZaGFKgL1JIMUzrKW8EsEYtLahv9+VaVa/I2Xps466+00aA+0mOSodiQrpc2ms9xOy7rsghlIUS0fpG/t7UsC7xeKuwtmzIHOL4BheorHAYZPiYG0TcAus9u5XJ8T5dGOqZpFqUArNqTetdgmEIDI5KuGMKomrffze9dY2magsCMPZ18gOIrtkx5PTOkAHutQIAGFXBxkPV8Jh8UdSkkA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by LV8PR12MB9231.namprd12.prod.outlook.com (2603:10b6:408:192::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.14; Sat, 24 Jan
 2026 13:07:24 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9542.010; Sat, 24 Jan 2026
 13:07:24 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 24 Jan 2026 22:07:20 +0900
Message-Id: <DFWUC9ZS6CCU.3HPTNAO7CU41S@nvidia.com>
To: "Gary Guo" <gary@kernel.org>
Cc: "Gary Guo" <gary@garyguo.net>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 "Danilo Krummrich" <dakr@kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Boqun Feng" <boqun.feng@gmail.com>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "David Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, "Paul Walmsley" <pjw@kernel.org>,
 "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>,
 "Alexandre Ghiti" <alex@ghiti.fr>, "Alistair Popple" <apopple@nvidia.com>,
 "Joel Fernandes" <joelagnelf@nvidia.com>, "Lyude Paul" <lyude@redhat.com>,
 "John Hubbard" <jhubbard@nvidia.com>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v2 7/8] gpu: nova-core: remove redundant `.as_ref()` for
 `dev_*` print
From: "Alexandre Courbot" <acourbot@nvidia.com>
References: <20260123175854.176735-1-gary@kernel.org>
 <20260123175854.176735-7-gary@kernel.org>
In-Reply-To: <20260123175854.176735-7-gary@kernel.org>
X-ClientProxiedBy: TY4P286CA0070.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:371::12) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|LV8PR12MB9231:EE_
X-MS-Office365-Filtering-Correlation-Id: fd0f2dd0-9d31-45d6-4aa2-08de5b4983f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|10070799003|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dnR3YUtVblNMYU5xcm9MOGFkUGg5MWYxMUhVMVh2UCszWFBKeDRDeC92L05h?=
 =?utf-8?B?YjRpTkM0R0dhWnoxTVVPd3M0NzRTVXVLemlkZmd0SEFieFlWZllQUWZLUld1?=
 =?utf-8?B?dEluMzZRdUhlZGZidy9ZNHNCZllnbUlFMjJYaE5UNForRnYyTG1TcEIrekY4?=
 =?utf-8?B?S1Q5WTFzTktCSWdoRktUdUIycHpOUzJ3VmFkYWp0VU9zd3Q2ZU9lV01hWnRQ?=
 =?utf-8?B?OGJvQ2lJUENzbUZ3TVBoNExSQUNoa0JwTXJrU1lKdmlVMXRJS0p4R1RvYVhy?=
 =?utf-8?B?UjViM2tyYk5Pc0gwQU52WmFaWllnRjJiRExJTzRtS0hsOHRjVkplelpXMXpn?=
 =?utf-8?B?dTRnQXVUZHhwaXp4YVVxOFlVbGRlcVptRDc5dEJ5NEc0T3g5eUNBaUxieTJF?=
 =?utf-8?B?b2VyQ1VPa2VJVUZJeWZMTUxlQktYeHRSSXUvTTkwTEVuY0Ryd3UwQjQwcEpT?=
 =?utf-8?B?UitzQlIzV1A2VEV6cmlieEUvSnpTc0Rwck1QV3FQa20yVG9mSDBhYkZiL0R3?=
 =?utf-8?B?ZUorQUhuZGdmRmQ2YWFudUh5WHo1N051eElEWmVvbFhlaXVyOE1jUEdRSXFX?=
 =?utf-8?B?U0dyZEw1WW92Ty9ZRWRQbVlLR0hOanBvUWNHaVhFSDk2QUpqMEFUQ09TK3d4?=
 =?utf-8?B?ZDhQUGFSRUpSMHJxUjZwNldwN09sa2VNSC8vK1YzQjdiVElvVWxkUXFpbTBs?=
 =?utf-8?B?Z3kxblVKRFJwRUZBRVQrOUJwYmVUQVRib2dFTXZCbDhIREFEb1BMb1VsQ2h5?=
 =?utf-8?B?b2RZTDVhSXNPbVdCU0tOdWZoVktraExBV0crRmJLT0VMNUpxQThTRGxIK3pP?=
 =?utf-8?B?TkRCeWRPK1RiSTB4a3BGM1B0WXd2WHJyY3hCQVhabFJqL1pZenpma056VXZw?=
 =?utf-8?B?cXAvZWJKNzc4OE9tZVBUcTdnRlNwaUo2OEhWTWRNWkh4K3loOHlFejNBSHdP?=
 =?utf-8?B?OUs1OGYyc3Z4YU1PNGtINWFoczMxUnp5emUvUHpYQ1N6cTRGRGZ2OGNHRzl5?=
 =?utf-8?B?OVMzZkh6aVdTcG1pY1VDejZXYnZpTE1vMXBoYVgwd09lMDVJK1RmY3BJM21Y?=
 =?utf-8?B?SFdzSEdjNzIyUlBVLzIyeUNVOTlVS0VpdC9sZUhtQWt6OEJuOWJXTThNRnI5?=
 =?utf-8?B?NUlROVVDSmpPZTc3QzBBS2YrSHVDRTVHa09YR2VmWjdpQjBUOG16d1FuQk83?=
 =?utf-8?B?cjRwS3dIcFZRUFdSN1dFQ20xUFE2SkhsekJyWDFFS2FXamtyeXJUa0hCSW5k?=
 =?utf-8?B?R3EvTTJLVGJVeEV5amlJV1dsVDl0WHZnQVcwMDJISWd0a3AwREJ6dU85ZUdL?=
 =?utf-8?B?am9NRGNPdjBic2p2NDEvb0pwQnlWM3pQeWd0Qk9HZk5GMk5uWER2TzlsaFlT?=
 =?utf-8?B?dk9MTzhqRmV4ZUdwNzV5R29EdXBpdXVDWVF2VWlaYVBtcEdBaSs4KzlaRW5K?=
 =?utf-8?B?MU1BdVJEQU9idXFJMW4wa29NaG9VLzhiZ215R2txeThwQWp4cVk1ZmhhZWI0?=
 =?utf-8?B?cmxEek9XQ0dwL2JuckpUU0ttYnRPYk1nbXg5K0RxWEhtaFVEckd1MGRaR3RV?=
 =?utf-8?B?aU5MNCtFd3lBTHhuYmkwMXAwenhVRndtVStWSHdycHArZFg0THYvK0lRR2ds?=
 =?utf-8?B?Z1JJNW5jY1cyUCtaMWFhZi9mL2F1V1d3RHArbDVpcnNvWURVMXNhNTVtYjIz?=
 =?utf-8?B?RFZSK28wZmNnVzRubzQzWEU3QUUrQUQ0RXkvTlhhTnB4ZHcydW1lcFhwVHlU?=
 =?utf-8?B?K0F3TGVUOXA4dmFMczg0eElTOUQ2SHhpNFg3aU5xeU5semtpekZHRExaVUtv?=
 =?utf-8?B?ZUd2NHRNMFh6dFdkOWhBNTE2NHNvbmh0WklIN25ua2FlVTA4a1dJMHZleUli?=
 =?utf-8?B?WW1HYUhUSDAyVkZjcFJydzBEekdRRlpZcDZOaXg5RlQ1OHZCU29aTDNRdGxR?=
 =?utf-8?B?NG9VQmZieS9hdjFDSFJLdzNZU2dPb1BQVzU4bFg0dTRlTzRoUkc2YVJKY0w5?=
 =?utf-8?B?U2JtbzF4S213M0cwK3Bvd0lIbmk0WHlCZFFCeFlRd1huYThxdlJaTDFpWGox?=
 =?utf-8?B?bTg2TGY1VnYwblp2YzhoVXdHZ01MOTFTMjlpa0NKSjlCNTBsYXpKOXpjZHJz?=
 =?utf-8?Q?tlcs=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(10070799003)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QkxSTEFwSXhUYnZIdTZwZU4vejJqdFhoZDJ1M3I1SXllQnU1cVFzSDBnOWZl?=
 =?utf-8?B?Z1pVNVQ2MG8ySlNkQXlwa0I5cDhpN2hrUGM3ejZQMEhYY25KT0pTQmJCdWEx?=
 =?utf-8?B?NHNScXVhSHpzVFpLQzkxK0kwR2FJRC9VdU55aEd3eS9oVGk4UGN4R2haRk1s?=
 =?utf-8?B?c0FwVWtaUzU0amdraEdPVjY2L2IxOWh4TWNTWk1BWEM5bEMvcHFQSHpNRGVw?=
 =?utf-8?B?YzkwOUZJZTlON1dZZ0hXbW1rKzZSUE1QWnZqNWYyd3ZVeEloYm9DTUlyT3k3?=
 =?utf-8?B?YjVpcEhCSXRCaWVxQ08wVW54emd3NnRBcU5YSURKcXlDWXc1dWtKaHo1WXFv?=
 =?utf-8?B?ejdxUTNxTExJQThzb2VoT1FBdVhHcEJsUTU0M2VOTUlGSFd5Nk03YWxKMFd4?=
 =?utf-8?B?WkpiZUpEa1JBN0svVW9nN2UydHdTUXA5V24yRHpWUndpZWc4cDQ4T0tDTElt?=
 =?utf-8?B?WDFMSHF1U1Rpd2VKY0hIZHp2L2Rad1RGajUrZ3ZCbjZxU05TWUhuQU9NenpY?=
 =?utf-8?B?cnYvNlFXMUpBVEpsVDBFRGZGRy9GdDVRNzl5anpnSUdid1VtbTlKeC9qZUdE?=
 =?utf-8?B?K0I5ZmdLazRwdjErS1h0TDIxK0tJbUJUUXpMaUZZSnEyT1NvOU9LSUtxTUlu?=
 =?utf-8?B?cHBVc0NONWhzdnRXcVd2QStzM1NHbjUwT3FhUWlET09oYUx0eE1ObUJuQXIz?=
 =?utf-8?B?amV1NzgvSUR5RmJuVm1BdTdaejFBVU1zcFo5clh0bGd3R1lyeGF3RWpvdERp?=
 =?utf-8?B?U3p2c3RsQUpldmlCWVl6S2h3NjVJbnRWM3RMTE5xU3NMWU8yWW0wRWNvU21T?=
 =?utf-8?B?SCt3Zk5ubjR2T2N3ZGdxOVhsUkZodU1NNXJBM1NWZlpnWU1zWitGMDNuZ3JI?=
 =?utf-8?B?TU1lMENGOEVOSEp0b0drWjNZNUt5dHVKQlV5QkxXZUJieVVrNVNMYVdvQXZr?=
 =?utf-8?B?MEhYUExsbWcrbEg3VXRrUWVjanhLajB4Q2tlWkh4TDlvcnBiRmpGUGthYWhX?=
 =?utf-8?B?ck1oVXlDQkNKWjgxaHhjMkZza01FTzgyWUxuVE9FYXdwOUI2cUZqMStxOUFT?=
 =?utf-8?B?ZEd4dWpQQzF6ZXpxUURqd2NnVGlaOHVVR253dDNNWmlQUldQU2dKaEM0VWVY?=
 =?utf-8?B?SzBHczljc0FtNFZwVkMrdHp0b3pRMjI4M3FWM09tT015MmttYXBadkl0dDV1?=
 =?utf-8?B?RmhQcnZNaS84U0o4VE53b21JM3dBMmlZODVHWDBCaFhhNm5SU3EvQ3pvenEy?=
 =?utf-8?B?QTFDVzVmNWFFQkNNU044UnIvc1RUZ0VHbWZVSXEzNnR5R2JnN2t1UDI1dVQ3?=
 =?utf-8?B?QzQ5Uk04QXFteW9Td2ZNeVZ4UEVPWGZYK0xtdmRHRVlzNW53cVVacjZIVlFY?=
 =?utf-8?B?YmVEZHBTek5DNmdVN3BNYVo5NGJIdTVLQ1lnOVZQQWp2dEZrWVpXR1ErU1A2?=
 =?utf-8?B?QlRLNURIMHlRaG53R0tVTDF1YTJOc1c1MVB1d3RtZnY0YzVlNHdpNzdFdjZU?=
 =?utf-8?B?dmUrMVhFcGFOb09jeXRySTkvaGF0Y3dqaTd4VVNaTUJVZ0lUcTlid1ZSUTFT?=
 =?utf-8?B?c0xuSTRHbjYwM3FDWmE4SWZwTWZTYXo0MldZSm9CUG5Sd3ZUQ2ErNnl4a3lJ?=
 =?utf-8?B?dC9LcEJJYXYxOWdHTHdFZ0lEMmd0ajJJZG4rOWpsVFA3TUR1UUI5TDM4dVR5?=
 =?utf-8?B?R1NPSHp0UldkeTRuRnB4Q3J5WWQrNjRzRVAxcnBTa1JoVTUyZWw3WVlIMGlL?=
 =?utf-8?B?UUJEeUhDSXF5R21nUUdoN1JhczE0UDY1eDVvOTRwMWQwSXUvYlR6d1p5WVZ6?=
 =?utf-8?B?V2doTk9kanpTOVRhbHVCakhDbjhvSGEyb25ERTZxcFVjMUFiOThQdG1XRCs5?=
 =?utf-8?B?Q3RKejJqSCs3ekFmaWcrdkNISVo4ODRqbCsrdUpNTkNpaGNpb0pPMlJaaUVn?=
 =?utf-8?B?U1hnbzJPRzFZRkZnZUdpenR4OS9PbGxCUlVHejJxUnlzUlAybVdzaVB5bGFY?=
 =?utf-8?B?TmtGMkEvSm8wSFg2LzhPdG9zMGhqcllWL2J2dmUxZU05eFJTS2RtUytsNnlD?=
 =?utf-8?B?TkdiZnY3TmNCMzFxYkMwQ2tRd09xTC9XTjZ6eWk3L04vQWRXRjcwRkVOT0Nu?=
 =?utf-8?B?RTlaYStZOWFpQ2NGOXlsSzNRT1dDUmJkNmgwQ0RpRHJVUEdiYS8wdWZMYlVK?=
 =?utf-8?B?QVFWQmh1UnhWempNenpOSGEwUHJuemc4Y09ZSFlwVDhGdHBObHZWS0FsM3Nr?=
 =?utf-8?B?MVJHREU0Y0UyNUVicWg0eVd1YWRlLy9vclE1NmVRVS90bjNZZDkrNlREVG81?=
 =?utf-8?B?ZDFjWmVpVjVMdmZrYW5Qc3pPa1h1eU1iSFR2V3YzS01tSmxVRTlmeVhlRnhr?=
 =?utf-8?Q?Cnqoa5CeRvdP3gietAmrhT0RThAoDH9Zfm1QCLLq74Ds2?=
X-MS-Exchange-AntiSpam-MessageData-1: dvD3frRF8CqsaQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd0f2dd0-9d31-45d6-4aa2-08de5b4983f7
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2026 13:07:24.7074
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qt/svyw7/+i9+EAbRlVw3PsLybE7eCB5bR/lxpDnyvJHh7kanph68zGS+Sh6MzRbKizYOu20XAdNoGW7hbhGXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9231

On Sat Jan 24, 2026 at 2:58 AM JST, Gary Guo wrote:
> From: Gary Guo <gary@garyguo.net>
>
> This is now handled by the macro itself.
>
> Signed-off-by: Gary Guo <gary@garyguo.net>

Acked-by: Alexandre Courbot <acourbot@nvidia.com>

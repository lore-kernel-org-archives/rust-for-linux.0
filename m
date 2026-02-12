Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012021.outbound.protection.outlook.com [52.101.43.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5464C1957E8;
	Thu, 12 Feb 2026 12:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770900917; cv=fail; b=OJPe3NK+TtlXfkBytG1C02ByisbGN3LgaMK+iqob2pYKCFYj2bTsoEhW8hQnaZhlGYrzMSP6EOi6dWxE6EC5SruWn8xt41Tapp1IhTJfkHp7xKuyJPUo9KFTfSTaRNDes3iilZCvqzL02IpgXrZk8oX2iLub4EB/JtscqOmCGvg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770900917; c=relaxed/simple;
	bh=r+YFmL16YFB7daGuEQD/Ji0LNZlzlF8E1Uamz0I9oHM=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=dfD4m57NXwJ7gsWznFnZ7j7k+pED7wAfqsqII4j4B2v59QjoDv+AwWV47QLevIHCEYNi9ePXHdde4TH2UKfz3wZqM44YdymqmeZZCmhXIDwGRnd80hmfwFRxVEfjm5G/KJiB0lSLzlJgoEWz8ZtEE1e2bBVkAjfiadxAHJxSXFc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=cEEltpmk; arc=fail smtp.client-ip=52.101.43.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="cEEltpmk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jjJNDZ3xSQLap4roWPQuoqDdK+xnCKC3QVFIwpIjEZ8fhunWHXVoOizmgvGGsHmwdvEWxumtGbQ0Mw1+XPls2KFgJtilorQUypkRbhckJtgrhdCAwJP5aQ/abLaAI9+N4JWaDCObkZcyGzzPRWMm+AQRtmkxWZEY3OKgmJ/VVMzrXSdqkm6vVhdw2I/tqIzWp6iqEQ+yHTlCjpHr60n6vdz+wowkhOP6U3Jwp0x6IYBQo6xx90A2HQw5BZRmkFsyVuSTP5y2PJbNYOJHG+2UuI0aTDGc+GYG8mnwFb2bIr+vYu9QFSu67ZNGp3s6ugff9RCZVDDXiJWtmt3LtBYUGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4FFy36/Bd+vOf+NPUSxitiWSVIL9MXS8gzbU5Px1t9c=;
 b=MxczoArKRxo9ghI0OfEDFfpObVnWN/2AozCn49no7fxzNhfVmn2u4wM+xTp1USmzovGGbMj1HLrCHEjg/xjibV5L3Qtc1MiB8/7UQRk09jJ0w/nAIMg5Igoh59y9JlsDGcjyiWDIR7E4nUSzTaVw001wzE4VngmssfCePBcy/nj/NdgNYwx3Mu2Im8s0xezFK5s0DuxVV530kSBoPCWr+Kpgl/lUBTEUBZB4ecSqILUUISUhd5v+SC+6HoIJ/3E3C7czQaj0CaOYM9AfiwWWswU4CQL1ygmryCY2kWHFqTSEXSuMwWqS5VdAf9jx6veh/ukEMt+bAjqqooIrzHL9tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4FFy36/Bd+vOf+NPUSxitiWSVIL9MXS8gzbU5Px1t9c=;
 b=cEEltpmksrYpcspYnwUTBIr1L+GRna8Fhc+Yoah6eZl7qfogwShENWEWixtAyGvu9CcChJVkLgaUHiJ9CEv1KhBJjMVkYp3+PgNurtkgF8Qp+dBVb7cItEt/UbTSljj7CuKMDwqHXKnDOVqHLtQ4yWbzCxedIVfppdAqJdxjct98vG3Wpu37WsVtM3Q7XZB3ZvlIzvk/DBG7PKdh3YSIR5A9Npvc8zFk0IGSXmyAFhfXbfiu0td/G+maSXZMHBI5YNZuB3IMBCruKyw4NVLrsT1HhvyJLjywxLiKsCrESR93KZo+WnKgB6jalpVxzuB4N+9dPE1VtD3LaJBFRFXR/w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by LV2PR12MB999096.namprd12.prod.outlook.com (2603:10b6:408:353::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Thu, 12 Feb
 2026 12:55:13 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%3]) with mapi id 15.20.9611.008; Thu, 12 Feb 2026
 12:55:13 +0000
Content-Type: text/plain; charset=UTF-8
Date: Thu, 12 Feb 2026 21:55:09 +0900
Message-Id: <DGCZZASC04RD.1CF5NXQ95XJ8B@nvidia.com>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Trevor
 Gross" <tmgross@umich.edu>, "Yury Norov" <yury.norov@gmail.com>, "John
 Hubbard" <jhubbard@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>,
 "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 "Edwin Peer" <epeer@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>,
 "Dirk Behme" <dirk.behme@de.bosch.com>, "Steven Price"
 <steven.price@arm.com>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5 3/7] rust: num: add `as_bool` method to `Bounded<_,
 1>`
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Daniel Almeida" <daniel.almeida@collabora.com>
Content-Transfer-Encoding: quoted-printable
References: <20260129-register-v5-0-c4587c902514@nvidia.com>
 <20260129-register-v5-3-c4587c902514@nvidia.com>
 <879031CB-A9A6-486A-8E01-E557ABB01F41@collabora.com>
In-Reply-To: <879031CB-A9A6-486A-8E01-E557ABB01F41@collabora.com>
X-ClientProxiedBy: TYCP301CA0082.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:7b::20) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|LV2PR12MB999096:EE_
X-MS-Office365-Filtering-Correlation-Id: bf56bffd-8845-4c3e-ad3e-08de6a35f644
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|10070799003|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WHVxUzlIeS9vdHVuM25xSjlETmRGZXZsOGg3MlpDa290aS9aOWxpNTZtL3p1?=
 =?utf-8?B?VTgrYmhKR3hrOStJamJlSXpsTDRVam9nZXJrRGlSTk5OR2JvTGhSWHJCZFdI?=
 =?utf-8?B?eUlsS3JBczIrTGdCbGJyNUpmYkRsQ0lkOUNsVTNpeG4rcVR5VHRQdW1wRkh2?=
 =?utf-8?B?ZDhNakRjSGFzeUp6dWMvZXhDK1JrdlZucCtsYWp1R0NFNEF0N3BLMkZyeWM2?=
 =?utf-8?B?LzFKUXJmZm80V0NGOWI2NXNYZU5jeExabGxEeGlKc2RLOGVTMW05VEppYmhI?=
 =?utf-8?B?dTZia1VleHBVNW8vSlh6b2FjeUlSNEhjTVBpSnpEcEd2NWJOcFF6Qk90N3BS?=
 =?utf-8?B?WnZ3ckdQeDVWWHhKczhPYjZGQW9qOWs2Nno5cE1HN2FJTDh4c3NkRzliOEV2?=
 =?utf-8?B?d3lNUW9NNXY5MmRVakROUCswT0tRaFdiS3pSSVpJc1I4MzFIanZFdEcyWXQz?=
 =?utf-8?B?cEtrZHJWZ2pOMDNGOXI0TXNudnpJNFZxSGVtSlFTamlyRDYyT05WeEVJSGhK?=
 =?utf-8?B?UDQ4c1dqWitGSXYzbHlFY0NsMTloa2N2MHVhdG1LQ3dEUjNVTEx4RW9JbDJl?=
 =?utf-8?B?VzNLRE1DbUhDV2phbU5oNE9Pd25iSG1lOG4yL0R6K0lHaU1pOWxPMi83OHkx?=
 =?utf-8?B?cFdHbGZBWnJtL1hBdlRmbGZLbEtCVnVOZmhaM1pINmxRNi9iem1aN2ppbGN1?=
 =?utf-8?B?a1JpVGFpeEZuZ1BoaVB4YXN0REd6WC9vcVdDL2o3Wldocmc2ZElhODlQY3Yx?=
 =?utf-8?B?TVBNSWF2RlNjWksxVWtJdmY1czRWcXJJQ0FSZnBxa29XMVFzd3hGQ28xVWV2?=
 =?utf-8?B?a2pBSEhFd3hXdzhITUZMRCt5aEtWeGJVVkhsWE8vWERkcDM5Z2pPV3FJMTZt?=
 =?utf-8?B?NkFpcGxCUm1TM0FVeTcxT1MxTGdhTDFBYkdMeStaVm1CTkpVWnNoNzFCblJm?=
 =?utf-8?B?VCsyTWRQNEJIUzR1MGxsNXo1d0s4TWVzV0NwejFHN0ZoV292am1QUUJOUEha?=
 =?utf-8?B?djVGeGFuUmFNWGJTclhSdVRGRUt3MG5yb21BS2laSzhPRHpJR1VreGpaamhC?=
 =?utf-8?B?ck10OVhwTDJvd0NOZ21BN3VuZE1yeVJmZS9pdytxUkRJdzNEM1BISXVwM3dJ?=
 =?utf-8?B?MnkyZ1p3VVFPL0dydkZUSy9qNDJCUXRLRGN5U05BZ1B3REJvV2ZPSDVjN0tt?=
 =?utf-8?B?Y3pId1c1UUJIZER4UXRMcnZvdG5VS3JVSkphMm5PMHQzNjhmYXVLcjVsdFRC?=
 =?utf-8?B?cEJBakFQZ1JEaWdiVjQ0SDlqSjQ0a2dQSWt2NmEvalJ2UTlDdisvMXVrejB4?=
 =?utf-8?B?NVlUWklCaGo5elVjZnQvM2VOYzRUN2l0Sk9CamtQZmhxdGNYd2RYZTloTVBS?=
 =?utf-8?B?WHF4WEQvamd0Ny9ycytWVi9IUmpCZGExbXBSUStHR3RsTVNjdk16YVpoemRW?=
 =?utf-8?B?OHlXd0tnS0JRRzZOTEhlTmRsU0RzUm1HWm1xM3ZUTTdReGZoRDNxRTcrS3E1?=
 =?utf-8?B?djZvVHFFcjU3eW12d3BpOXlGbVAybldLMlhaWVJoN1JRUURDVmtQOGJ2cVF4?=
 =?utf-8?B?c0xnQ0p6VlNGVFpYZ3pRaFNkWHpYRk1ZcUhoLytFRm9lcTN4Slk5MGNKbkUz?=
 =?utf-8?B?TEdDQ0ZDTGNoOGV0TFVhVExIVE1wanJaWVpVdVU5dHk1bVdnZnRJRlRjNzVh?=
 =?utf-8?B?aExNaDlCZkhzRVBXdXV2SXA3RXZiVkpFV1htVFBPZkpTbC9GeVNMSCtTWjlY?=
 =?utf-8?B?UnJJblNHODdzdVBtOXJKUmtPSXZ0N2hGTW5FbXVjMW1RNElGN0FtdlpYUEZy?=
 =?utf-8?B?d3N6dEpFcjI2RkZxTHlXMFc0cW9PTXdtL29qc3RBcGlvS29oVFdBenBvSmIv?=
 =?utf-8?B?eFJLWUhsVU8rMUdYMU1LMXZ6TEY5N21MMXk2eERhSllTeWFrWDlCWGJSak1a?=
 =?utf-8?B?bFFHOG1LeU11NDVJbEkxY2p4TmkzUUt0dlI0V3Y2RHJyTE1uQnZkeS9PTjVU?=
 =?utf-8?B?RkthVTRoMGxCa3llVjhadzYyVWhqejYwL3V2NGJDY3BXcmdwUDNJcDJKUG5o?=
 =?utf-8?B?SGUrQnViTE84dlpmY2hzZThTNlE0R04rUnpRQzROazhHbTlFMHVxS2RZekNY?=
 =?utf-8?Q?21bg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(10070799003)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K1pzdVZzMUs3U3M4SnV0VUJla0hhWlBCNG9SeFpTTGc3ZHRtTUd3dmx5Um5p?=
 =?utf-8?B?UnhMeWVvK1B1Y3dnOUZwQzZHUEZDbFV2RTlodzVsTFZ5amdlSkRyRmtBUkZy?=
 =?utf-8?B?aHFHamRmenpSV20xUFNCdTl0WVVTcVU1MmhJUWkyL2lLMnNQOFBuQlhwVlo5?=
 =?utf-8?B?SUoreFNaOHowbzZjVXdVTm84bmdtVnBKT3BKUVpNMXJ4a21PTXY3QmNXR2Jo?=
 =?utf-8?B?TGlHMGVVYTVkeFVjQ05pbjJ4Y1hWUUtMaXovY2tkbS9adDhmbHBSVEo0SFgz?=
 =?utf-8?B?UXdwZmNWQjYxSUd3Z25tYjBtMGhRa1YvdEZldGE4WEJSN0RWeWczWGhsUFYw?=
 =?utf-8?B?RU1qRWZrMXBwcUxydEN4S0g5NVNQWVZ1aGVDZG1adHBBaUtJQVpqTjZYaDBm?=
 =?utf-8?B?SldnNFNKVDdBMHZwTFBEVklSamxpcVNsYVEwckhhUDJmRWt1bXFxQXlha0xN?=
 =?utf-8?B?TTVRNHBxdWY2cGY1ZmZ3UXRza1NES1BsRjFOU1JlMldQcVBiMDhWam1XZUJP?=
 =?utf-8?B?U2R1ZlJzUTQ5cE9MQTJPbWFGR0xrWnJ0QzFWNFFDalRyaTRzNHA4cnkrTFdm?=
 =?utf-8?B?T3FLS3VldDFwbUFkeEpFOVNUNENsaWpDckY4YXo4Nmc5ak85RWNQL04xdHdT?=
 =?utf-8?B?Mlg5RkNzaUkrb0NOa0E2WnB4cXFKZ2dnUDczWUt0bWJtV0ZSVGZlQ3F2MVhD?=
 =?utf-8?B?cHRCOWE3YWQ4UkVhWEM5WXdHQktVdFU2Q3lSM2tZNjNibStjL29qb3dNSW41?=
 =?utf-8?B?N3ZuQ1U1NStOWGRjWUZma2MrWFJpNE0xWjg1c1hYRmdubWdxVTVmVmJ1elpn?=
 =?utf-8?B?VGVxR3R1ZWlKdnhib0xmY05CRnJWV3h2M0ROb3k3RnJ0T1YreXN2U0J4RzVt?=
 =?utf-8?B?L1owK0dlNzVhZ01WRFJPZ2FVdXN5MjF6T2RmbFhYWW00V1lMRnFVWlZWN3dZ?=
 =?utf-8?B?alNXWFI3MllkZGlsTjhYUEN2SUJIbVNpQVRVY2FEY3dtZ1JIMjVXOGZ1WlVh?=
 =?utf-8?B?MlRJdm03YlpzaEthM205bVdsbUQra1hCejAyYjUvUXdJNUZ2dkV1WVJhS1VZ?=
 =?utf-8?B?WURDcUNuelBSZHVuR2pIS3NheWtnVWg5YzFma0lwY2hqSVhFaEVnYWdVQVVK?=
 =?utf-8?B?OWRaL1ZtaWRnRGY1RFR5R3FzS1lQYTVaT2UwVCtZbzM2bXZxaTlrbFNTU2lH?=
 =?utf-8?B?TnJmdHJpM1NENFJkZ2swTVptVEYySnNEZUJwc2NTWlRkczltWkM5UXBFTEJu?=
 =?utf-8?B?bWsxUG1MbnZuSzl6bVJIZW9TSkljRFF3L25qYVVVTXl5TFlPbnN4ZUczeUZp?=
 =?utf-8?B?YURnY0pvQkg0anZEYUtPeXF0RFY3NExNNTFVV2k1Q2F2ZXdMSnh1NmtwZkZ5?=
 =?utf-8?B?V25NdStpelBoU1FpRzdQdjd3L3NRbjQ4cFpxTE1ZT05ET1JHZHNFcGx2YmFF?=
 =?utf-8?B?OTFmUHNKNkxYZlRTTGhoeWZibjZhM3Q5U2JocURRRVh0cXE3S1NPVjl2Rnpt?=
 =?utf-8?B?dnhJdFliQnlsbXh0WGN2b1pJcnVaMk0rdTAwc0FXN1ZGenkzWnBCdE5rZzdV?=
 =?utf-8?B?d2ROeVgrb0VjUlV1ZW02aGxjb0ZPcUN4N3h5RkV4SGdKNG1LdS9nSTdDQkVI?=
 =?utf-8?B?bFVhREVxS1dhV0JWck9zbW1GUzBFT1BqUkkwS0ltSXJnN0orUytpN3JjVHZq?=
 =?utf-8?B?ajJJa0hpbk1WMDdkL3BhSUdvMStXOWx3N3FDWVVCcWJWWnU1V24yUFBRSExN?=
 =?utf-8?B?UVJQZWJIZGdaeFJwazhDcksxWWZOcTN5UnlVQWcyQXJlNThWbmgzNllWN2ZJ?=
 =?utf-8?B?TnQzTG9aMkY1SDdKSU90ZEgxd3B2ajF6Z1FpeVpUQUFvc2xMZzh6WjlYZHh1?=
 =?utf-8?B?ZXRmTmlEdUZBU1FqQlNpVVAzaDNYaGI2dGIyamQ5YStJbGV3UTNwSmZTeE5h?=
 =?utf-8?B?T3FBcGRqRDdhODdKdVR2VVQzdzBWY1hJQldYamY0Mm1kQVVQdjZoRURDYTR3?=
 =?utf-8?B?b3ZQK29vcFVEV3pJcVEwTWQveWN3bVRGOHpOeWhTU0dvQlExS0JjcWUwK2Yx?=
 =?utf-8?B?SEhEbkpXY0Uxc1NrVnlkZXlRZUxTTjB3QTdoTVN2bHNnVEd6NEc1a1UzOXNu?=
 =?utf-8?B?NVVqQVIyUG9kMnd3eTlkaDltM1N4RGozdjg5N3ZSTUFVUFlkdmNQNUJPRGpa?=
 =?utf-8?B?ejBBaEdidzVrY3c4U0FFcW5naTJYckRVZWFmeFlERTdSamJlS0Z4WjJ0YWNs?=
 =?utf-8?B?NWZWUGpHSFEyYnozeG1HT0NxckpnUnB2NnJPZ0JHQjBUdmNIdHRuTHZkbzZn?=
 =?utf-8?B?U1BZS3JJck13UVdjWFJzcVkyb3dUZlhrSVd2RDExZjl5Rzczd0hEdFd2NU1Z?=
 =?utf-8?Q?Z5XKrv5dbM9Jc/BrGxylfFNk5MDZm+aWxpAFzPyJldjSz?=
X-MS-Exchange-AntiSpam-MessageData-1: ycg+EopW6nlHrg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf56bffd-8845-4c3e-ad3e-08de6a35f644
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 12:55:13.3566
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n/vMV2wZNZJHWao91kge0RsFsvGcZ251SQynC2SWy0v++/XPkbDoKtKU34r4eZAI43fpypUfGozg/LR+wBZIqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB999096

On Sat Feb 7, 2026 at 3:28 AM JST, Daniel Almeida wrote:
>
>
>> On 29 Jan 2026, at 10:32, Alexandre Courbot <acourbot@nvidia.com> wrote:
>>=20
>> Single-bit numbers are typically treated as booleans. There is an
>> `Into<bool>` implementation for those, but invoking it from contexts
>> that lack type expectations is not always convenient.
>>=20
>> Add an `as_bool` method as a simpler shortcut.
>>=20
>> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
>> Reviewed-by: Gary Guo <gary@garyguo.net>
>> Tested-by: Dirk Behme <dirk.behme@de.bosch.com>
>> Acked-by: Miguel Ojeda <ojeda@kernel.org>
>> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
>> ---
>> rust/kernel/num/bounded.rs | 21 +++++++++++++++++++++
>> 1 file changed, 21 insertions(+)
>>=20
>> diff --git a/rust/kernel/num/bounded.rs b/rust/kernel/num/bounded.rs
>> index 4b929762d5c2..b41ca6df1525 100644
>> --- a/rust/kernel/num/bounded.rs
>> +++ b/rust/kernel/num/bounded.rs
>> @@ -1098,3 +1098,24 @@ fn from(value: bool) -> Self {
>>         Self::__new(T::from(value))
>>     }
>> }
>> +
>> +impl<T> Bounded<T, 1>
>> +where
>> +    T: Integer + Zeroable,
>> +{
>> +    /// Returns the value of this [`Bounded`] as a [`bool`].
>> +    ///
>> +    /// This is a shorter way of writing `bool::from(self)`.
>> +    ///
>> +    /// # Examples
>> +    ///
>> +    /// ```
>> +    /// use kernel::num::Bounded;
>> +    ///
>> +    /// assert_eq!(Bounded::<u8, 1>::new::<0>().as_bool(), false);
>> +    /// assert_eq!(Bounded::<u8, 1>::new::<1>().as_bool(), true);
>> +    /// ```
>> +    pub fn as_bool(self) -> bool {
>> +        self.into()
>> +    }
>> +}
>>=20
>> --=20
>> 2.52.0
>>=20
>
> I wonder whether this should be into_bool() instead? as_foo() usually goe=
s from &self to &Foo.

Yup, that's definitely what this method should be called. Thanks for
pointing it out.

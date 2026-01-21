Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012038.outbound.protection.outlook.com [40.93.195.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB3C045107A;
	Wed, 21 Jan 2026 07:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768980266; cv=fail; b=jIKCQrjTaZ8I5WkYdIAMhA5JCtRONtc+2wmVlRgl4ltM5ihW/slGrkSoRmOLZezW6geGOqz6mrDR1YSjsSeCy274HbH0fDE3v4DWmSuHSyG5vV6wG7XPZxqPfo78x1h8Nq/6JCcPLbk6RIzWYCFn3keQsd3zcm7Lp2nfRS1Tr9c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768980266; c=relaxed/simple;
	bh=IMzatzCrIxi4T8hAsll0CxNINWx0UeaVNDNS2ebepQg=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=lxzb/d520E5yhCZzXRvCM33nCl2+RLTdPpn/h8WE9OC68OPldAPuNV/5RLUGmZWeUg3A7BmIug896CXYvsxYUrGNNKmy8+3s01yAe9k1vydTF9S40hZaRTG5tJyNQWVhc5quFo+yDdvBv10oLDjjGUX054TlOOHuSudO0kOqgFg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=cxeRXbzf; arc=fail smtp.client-ip=40.93.195.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="cxeRXbzf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BBcMz9uj/GYHE0C8w2tCSdiGyNPBGOfUwPw4v3C/Tgg2Xm2+Izb28NSeMedzENYk0k7Fk3OYNhrDRjAx/IPI1+cxpWLuiRBDomNmET3VhAuHs2laAqKeM6iPyC7fCJqiq4XO8x1R+vo6DXzK1BiMe6ZhLn+A5DGMT/j32/gvFfJO5mBkS6x41iUTzLLo69+P6uxLvmiGCHRgXzSVgbmvmKqGw7J+QtfnCLedvwhosnjBXjkRhUBIZzJ0z+VrR35bvikub6N2ZbE2KRal32EMcYBczQeFjQmJZuRC+xBQ0DK3YJhSh564GMBdDVXXmtwY9PECkC4u353yNFqLy3cdvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NexVWWkDQlA5zImf0jfw62MXBphUWgkzhw+aGf4B+Dg=;
 b=c04wdzctcjRnySu+MnwqKmP6g6qiN75UVh8ns1RUHYrmHd2cZ311NuH5tOC5mawd//VqcIq0LCe/oTNmvSVd1vLuX3HaclhVS/138402pejwzsmkO8MM9Y0slfyfmMHr1+WVPKPo9jq7C/nTLHvAsSkExpDKfx+E7oEvZw3Ttf0X75zAzH1GvDhvR76QKCDV9xu8nuKpRLwmkxa/RG6tLCT0KXz8p+1egs1OJ4bFFjGOYfkXngoRiBRBGRNEnW9j2FxGbt+/gRSozrlLFZbkBpvrmR4hWwcv9KaHWDY9Rf5yonV+UYlmqeMYQ0y+XYuITJbg3/noUoMNTk4wESUCJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NexVWWkDQlA5zImf0jfw62MXBphUWgkzhw+aGf4B+Dg=;
 b=cxeRXbzf6ImRpf/exGpCkAe/edK8gOHbkYRoz63dNwUWaOVSwVfsfW/EyOE7Av2rOX9U+0WQzKKK4sOzv7UHkzROZam63wb9magfQpFCZILLei4BHqRwkqgocybwubc+MQPLqow808onm5O4fktWN5ASG279GkQLdVtLSYShY017gMSM8R0rKVrMKcnrcnqbpCJK5P7Jhoc7AFPx9C18Y0O81J78R8sUF0EU+IS5tS0YGVaIvQk+dTaXXLDNz5OnfCDSDP+q0M5W3WCsRiNDNGBBMO+eDvvUu5hEwiW5kxO/4KxqXotcu+U8OaT9evGb56o2NrGiD7l11BXDnnZ0/Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DS0PR12MB8272.namprd12.prod.outlook.com (2603:10b6:8:fc::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.9; Wed, 21 Jan 2026 07:24:22 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9542.008; Wed, 21 Jan 2026
 07:24:22 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Wed, 21 Jan 2026 16:23:54 +0900
Subject: [PATCH v2 2/5] rust: num: add `shr` and `shl` methods to `Bounded`
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260121-register-v2-2-79d9b8d5e36a@nvidia.com>
References: <20260121-register-v2-0-79d9b8d5e36a@nvidia.com>
In-Reply-To: <20260121-register-v2-0-79d9b8d5e36a@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>
Cc: Yury Norov <yury.norov@gmail.com>, John Hubbard <jhubbard@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Edwin Peer <epeer@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, 
 Dirk Behme <dirk.behme@de.bosch.com>, Steven Price <steven.price@arm.com>, 
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TY4P286CA0103.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:380::13) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DS0PR12MB8272:EE_
X-MS-Office365-Filtering-Correlation-Id: 52cea01d-f486-4e9c-f6fe-08de58be1923
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|1800799024|10070799003|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RUFiOTQ1alVwRy9vTDZOMm5UQnJDTHMwZC9SUGZhbkhpOEI0K2FxaWY2SllN?=
 =?utf-8?B?STd6ZDVYWllrVkVHMWZVc0NyTlZkT1JYb0gwbytJb2NDbWhWZUJmcUZXbWxo?=
 =?utf-8?B?cGdOV2IwTkdHVHZaQi9IalJsZUVmUHIrTDVGMUU0anlXR2xrUytGYTZJTVVw?=
 =?utf-8?B?M0VSV2VQMjJ1Y2tTSGswdUdhOE1IT2N1dUVKZTYwVkZyNndyalFraDJHSTM1?=
 =?utf-8?B?eUZKRkowREFDcmpMYmh6ZlJoQVdtdjE5M2QzcU5NdjRvVGxTcGRvSG5rT2VX?=
 =?utf-8?B?eWlkR3hxQjdPNEpCT0dDazNqRDBLTG02bU4zaklHa2ZSNEhwOUllM0ZtYUQv?=
 =?utf-8?B?d3FUR0M1WTM5U0FoNXRLcTNYcnpPT1RlNmFtSmQ0Z3BLMTUxc01rNjNrdFdD?=
 =?utf-8?B?S1RCOWRXR3BkcUxURWl6T05JcksyUzUzNklMTE50VjlzUmtoVjlCbS95SFhH?=
 =?utf-8?B?YWE5di9nUGw0U1BoeWZNRmd0SnhlWFdkbnJUVTIzYjZWVWxPRUZyaXFSdHBO?=
 =?utf-8?B?NWZDdTI5UmhDdjhtenlUZ2Jzd3pFMzB6T2Ezdlh0dDBQQnArQnVZeEtYY1po?=
 =?utf-8?B?UWpWUnhtVkdIMTVlRzRCRTFVc0ovZDRLaFpDOXk1WndBN3JsYklYRzJUekNm?=
 =?utf-8?B?VUwxTEdtWGFFdWJTN05Jbi8zT0YvMG5XYlVNN3lkcFlTM1J4T0VuUDlHVGJ1?=
 =?utf-8?B?UXE0dG50enhrdUYyUk5ocHVUZkxibk1TZEdaWTQ5ZmhXblFCZU5iTDQwYkxM?=
 =?utf-8?B?S1hWeGFRS1ZLNG9jdjZ1cUFseDlUWm0yWGJXeDQyekJRMnIxdWNtVFdxSHlL?=
 =?utf-8?B?SjJ1M3dqVUJNcDB3ZDdMYmMwWm5GQ1ZGYzFCVmpFeU5qelZYRTFVcnQzOGZX?=
 =?utf-8?B?R2VFQ08vbnFrNGpFUTE1dFExcVJCMlArVjYrNXBQQ1BZRENZMndvVW44WnRR?=
 =?utf-8?B?N3VXbXRtM3Vna3pBZXd4UjhUMlZyUVpQdjc2R0VUT0xVdU4rSHIzVXNWN3g5?=
 =?utf-8?B?L1REWVNnMmttU1czSjRVckdRbldncEJKMmNObVg0Z3JJL1lJODh2WnM2WEJT?=
 =?utf-8?B?eisvbXRFamZpREg5WUxnZ0Ntby9QWDhEM3Q5ejRzY2kxODlFK3RwdVNJMEd4?=
 =?utf-8?B?TGxENStySnI1Unp5enl1b2hZMUJqUXRmUFp3SGEvcWxTMHg4RmhNZFo4dnhv?=
 =?utf-8?B?ekdQUE9VTVlqT1BpcGFCemdzNGNwMWJaZ01YaHFUbGdtblE0ZXNQMjArUmhW?=
 =?utf-8?B?NVZydDdCNlgySm1QK3piWjBvSUg3WlNwVUgxTzQrRTVSMG5rNmY4cjBwZzNB?=
 =?utf-8?B?R3RiSVBENVdDK2R3RVR4Uis1S2RVNTdsbUxFZEhmR0JmaTFIZlVTTFhic3Ay?=
 =?utf-8?B?bVl2N3ZmWEdRU09ZUHJnRm9iRGlDWG93Z2FIOTkvK0dZN3E2MWwwMDl0T2hu?=
 =?utf-8?B?VnZjejN6ZnpKVlB5VWRWQ2ZrNmdrOS9kMmtMS1JxQVNEUUZrcUkxWmJ2ajFV?=
 =?utf-8?B?bVJSd0lpblIxNzRVRGg1WXhsMTBqa1RyTHJVY0tiWFNLRlNsUnlxSEIrOTQw?=
 =?utf-8?B?T0N2T0JhL1dIcGMySUdvQStDaXRGWGVCUEJFNnpMdng1cDNBZ05TRllYV1FC?=
 =?utf-8?B?R3pMYVVmUldmbjd1OUtyS3dHbTdtcWpZSW8zSDZRQ0Y1VFpjZlBGMzVRdkZZ?=
 =?utf-8?B?SDdSRm9kNWtZb3pTYmJ6QVZHWkMvWmo3VXFYbG5RZ1FwUHhuVGdUdHVDOUlo?=
 =?utf-8?B?MWJPQmtrUllYKzFKQ1RzYnNDakp4NjVjRzUxNTBpNmlWMlh1WGpQVyt5bTNt?=
 =?utf-8?B?UHB5T09XTVAyZWlZVzdraTRlVS83eGsra3F5YW5HYzlENFh2R2FCWHBsaTVs?=
 =?utf-8?B?UzR4dGN1cjllb0ZkMzFnUXlhOXFLd1NnWm52czJwUmVDazhwZGs5czVQbFlJ?=
 =?utf-8?B?OHdlZmo0b3hyWjFKeTMzS0VWWWxoSWx0elRKQ0VIUVNRd2gyYnRXOU5CMVBZ?=
 =?utf-8?B?WU54RVBUV0p2Qlk0SVVXQ0tqTnVhWWIzYkVVcXBJQUlIclBRR2tQQnVkc3pD?=
 =?utf-8?B?U0JSc2JTNTNxeEJxR2hnZ2VxRWUydUxjYUJIY2xXUEl6R3FYNnFWSDdvUHZ6?=
 =?utf-8?B?MG1ZaURDb1ZFVUE4bVNlZDd6MUNpL1NGTHBpd2FIMWE3SDB3QlZhZWZQUUlm?=
 =?utf-8?B?TVE9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(10070799003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?czcxWDRZUjlDYmFxb3BQR01iSTR5dDFmdUIrNFZkSTFNbHRiT1ZleUY0aUhp?=
 =?utf-8?B?M2pmV1BINkIxbyt0bk5sREFKd2F0ci9Pa1l6eHZaclhBcVlBYkxRNlJPaFdI?=
 =?utf-8?B?QnozTEhUWVFYd3MwTGFINEN2MXNjY1pmYUFPakg0U3E0WlpRSmJvMzhTR2Ja?=
 =?utf-8?B?Rnd6MjUzbTRZdGY4S0dlUTRFZmJNSDJYaUZHeFdQNnBkQ09XTk0xREExMTNh?=
 =?utf-8?B?U3lHVnl1MnIzOGwvd3VCTVNMNVU5ZjR1UHJBMXNVdWdKMldvWjgvd0JoTWZS?=
 =?utf-8?B?S0l5T3VneTFhZDRET2RXSnRPZkd0SkJWeXVVeXZQSk8vRSszMkxjVXluaFdx?=
 =?utf-8?B?MUJCQk9wdE1Kd2I2QkdVNHRvWHQ5ODdrMGJWclRCeWlYN3N2aWhvU04wbDJi?=
 =?utf-8?B?d1MzMDJxenRsRXRSdUgrd0JLYWJGU0haMzZZOE9vcGJVeFhaMHltaDlPNWhW?=
 =?utf-8?B?dVBLbjF2cHRMNmNHcG1kd1REMWdCVUdSS1ZPbUw2UThaU2FLZWRFQUNDTFpw?=
 =?utf-8?B?Nm5vTlBsekswanJIaEpIb2FQeFpkdGpOb2tPMUtVVFFBelQ5RUwzQ05qR1c2?=
 =?utf-8?B?aVlGK1lDME5xREtKQUlCTDRDMncvdThqZmh1eVNVT2JzK1dLQ3JNc2crK2dt?=
 =?utf-8?B?bzlySjc5cUh2aXRsNG1rTXdlK2RHL2NoUHZVSzlFc0lkVktYRzc5SXpOalNV?=
 =?utf-8?B?WEMrTlU4eWVpTWNiYWhCQjBsU2FrQXE4d0hjNGdGeWZ4K1dqZkp0UTg2WlRm?=
 =?utf-8?B?Z3cxWE5rWkdCd0Y1SFBuWjNZSDBVcWVFZTRpalBibG5tTTg3TGRFYnBlUUZm?=
 =?utf-8?B?SDRMTlovZUt0RHRPOC9ycVlNbG4wRm1GazE1cll2dVVSYVo5L0FNeGV4eU52?=
 =?utf-8?B?LzZyQ1Y2ZFJOVGticTgvOFRPWjd4TGpSWUlhWXRRaWU4R3lFVmorY0Y5cndF?=
 =?utf-8?B?QmtEdEpzNzNXVWNpdHhqdklMNFRXTFZrdUpSU0tHZUpyWkJ5Q0c2NEpYVTFL?=
 =?utf-8?B?bnhVT24rSVZGMUt1dk5FQVRpK1BwSytOaExnakw4L2dPSXJFbDlLNm8wWHMv?=
 =?utf-8?B?ZHg0Zk50K3JYNUFGVEZXNWJUTHBQYitJNmd5QUI4aVdRbmVjVVdCbXJ3TzlL?=
 =?utf-8?B?a2hMVlZVZVI0aDF2QmU1R21KK0ZLdmJOTmVmSGtJZDJScnlzRktCd0FpZmpm?=
 =?utf-8?B?SjRtdVF3T01OVVVneGZLc2xRMFlpK0J3UHFhUzJxZDNIeitNdDZKaHpna2Vp?=
 =?utf-8?B?WkEzb1BmT2J1UW4zdVhBM0xkVzArcXY1REF5czAwWnJkYmxZZ3R0cmN2Zklu?=
 =?utf-8?B?S29CQ05Rd1VKNXRuejZucitFVU9kZUJNeXpmRUhPYjQ2OGxycENoL3dWeFdU?=
 =?utf-8?B?Z2VzTDhKUnd5eTZ6dWEyT0pWMHZaaFJHTHVkdTBZSTVOaWlpUjZUR0Q3b1Zn?=
 =?utf-8?B?SFl2UnRNaHlSVi9XTndqZlpDRC8rS2trWm5Oa2VibjVSMkZKcG9GRHIwR01v?=
 =?utf-8?B?bDZzZEtXek9ZWGlHaDB3clJ3bzJsRTB5RXZkZ3pvMnRYYkcreVYxd25ydm42?=
 =?utf-8?B?QkxWTGZxbzUrSVZ1dEJRbjBNOXBhYTBWeXZzTXhibll5Z1E4TlpWdkxZMGJu?=
 =?utf-8?B?S2VaNUU5b0dVblJxMVdMNTRkNXZoOXV6RjF6aUZXTUpJVzVFaHB3SU0zMU0x?=
 =?utf-8?B?N2d4d0NjSEJBc1FiYkl2M3NVYytRSUpmcUlHbmZzZUF1WmZnQThTanBTZU9s?=
 =?utf-8?B?ZllmWGltL3NRWTI3S2djNGhIRTFWc2FDWmRVRWYrV3V1Q1BvK2taSE1iL2Q2?=
 =?utf-8?B?cHIwek5XbWo2clYyK25xOTNMUUpXOFlPQ3V6d3h4b2RmeXhuRG0rQm9CSkpR?=
 =?utf-8?B?RkE3N1hGWHdVSmFxanNCVWlyakhWZFBEdURwN0RxYk8rWVhyYjcvajkzZk1M?=
 =?utf-8?B?cXNJSnEveG5pOWtuSmtFWGpJK1d0VGJGMlZuZ3Fkd2tPNFNuVFVEN2FZRkdI?=
 =?utf-8?B?MWM4YkJ2NzhROUd3OGp4eTZkS0pYNi8zc1F1OEhPb0VKL0wzTXZJZFBUSk1H?=
 =?utf-8?B?KzVjQVBCam1BaDJMSDV1dDk1Qk0wMGFwZjRWVlhQVG4rUmpobFBCYnhxUUtx?=
 =?utf-8?B?QVQ2K2hxeWN4MjlXdGFoOGZmbzNsZ0k3WG5vVFZCS2lvZXFpR2pxT1ZGd25L?=
 =?utf-8?B?aGNTcE11Y0prZjUwTHVaNFprR0Z6MDNYM09YV3dSSE5paTFla280dXBJWGRS?=
 =?utf-8?B?Y0pkODBxSWdOSStINEVBUjNLMXVxeWxUSGV0ZmM5akFrSkUyaHJyNzlnSDZC?=
 =?utf-8?B?Z25XcEdDS0Y1RXpPUlg2a05JTktXaVRTWnZSNC9jWTh3RXhVOFdLdkVvT0E5?=
 =?utf-8?Q?TMi6PeeB3X0+RuQpl6cSczNo7+J0BKB1qMVLYB0Vbu34d?=
X-MS-Exchange-AntiSpam-MessageData-1: lHedLs+nUed6lA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52cea01d-f486-4e9c-f6fe-08de58be1923
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 07:24:22.3145
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xwdKQB91xKHg8Y2t21QUSXriVb6287y7R/0MmcMjL/8kFAaBRq4GMrjEGEUw0PhPskbsSuxpxr5fZY/JJTCHCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8272

Shifting a `Bounded` left or right changes the number of bits required
to represent the value. Add methods that perform the shift and return a
`Bounded` with the appropriately adjusted bit width.

These methods are particularly useful for bitfield extraction.

Suggested-by: Alice Ryhl <aliceryhl@google.com>
Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 rust/kernel/num/bounded.rs | 40 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/rust/kernel/num/bounded.rs b/rust/kernel/num/bounded.rs
index f870080af8ac..8782535770f1 100644
--- a/rust/kernel/num/bounded.rs
+++ b/rust/kernel/num/bounded.rs
@@ -470,6 +470,46 @@ pub fn cast<U>(self) -> Bounded<U, N>
         // `N` bits, and with the same signedness.
         Bounded::__new(value)
     }
+
+    /// Right-shifts `self` by `SHIFT` and returns the result as a `Bounded<_, { N - SHIFT }>`.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// use kernel::num::Bounded;
+    ///
+    /// let v = Bounded::<u32, 16>::new::<0xff00>();
+    /// let v_shifted: Bounded::<u32, 8> = v.shr::<8, _>();
+    ///
+    /// assert_eq!(v_shifted.get(), 0xff);
+    /// ```
+    pub fn shr<const SHIFT: u32, const RES: u32>(self) -> Bounded<T, RES> {
+        const { assert!(RES >= N - SHIFT) }
+
+        // SAFETY: we shift the value right by `SHIFT`, reducing the number of bits needed to
+        // represent the shifted value by as much, and just asserted that `RES == N - SHIFT`.
+        unsafe { Bounded::__new(self.0 >> SHIFT) }
+    }
+
+    /// Left-shifts `self` by `SHIFT` and returns the result as a `Bounded<_, { N + SHIFT }>`.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// use kernel::num::Bounded;
+    ///
+    /// let v = Bounded::<u32, 8>::new::<0xff>();
+    /// let v_shifted: Bounded::<u32, 16> = v.shl::<8, _>();
+    ///
+    /// assert_eq!(v_shifted.get(), 0xff00);
+    /// ```
+    pub fn shl<const SHIFT: u32, const RES: u32>(self) -> Bounded<T, RES> {
+        const { assert!(RES >= N + SHIFT) }
+
+        // SAFETY: we shift the value left by `SHIFT`, augmenting the number of bits needed to
+        // represent the shifted value by as much, and just asserted that `RES == N + SHIFT`.
+        unsafe { Bounded::__new(self.0 << SHIFT) }
+    }
 }
 
 impl<T, const N: u32> Deref for Bounded<T, N>

-- 
2.52.0


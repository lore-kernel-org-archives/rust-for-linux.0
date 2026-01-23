Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012046.outbound.protection.outlook.com [52.101.48.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E76482DCBEC;
	Fri, 23 Jan 2026 11:45:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769168710; cv=fail; b=ZuHcMfdRZF7ZHpUW6miZerodUXumq28HGhOEUbakIc+1Dl6tPmwlOrjxEb/w9pc3cmMgZPoOOq7LOdb45cxcAO25Hj9BqKh5+AJ3p37pdXXl0rcYMqtWDkE27c55FmcLZPxZOGmQuGEMxzas5bMvhfxOI5CrHRCvjWACJRVtnM0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769168710; c=relaxed/simple;
	bh=R8LF2jD+/UWjSFVQqmLn1SDwE7Dg4PALESOWWQ++J18=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=LIHIC4eO+HgrN83QPbKkC841djEcKCiF4aIyAX8dFgAtBOqNvMWQpgROY0tdQs3lRsfIc/3/REf+jMRzxRImjqH8rnbUuoWGuGFxvKF68lWEUzHPo1zNN9NmFSB5IdBjVuz2KZbBrAJfLSMJqTmGIzBlQg2Ms7JS9aYBf9o7INU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=g6CKp/+4; arc=fail smtp.client-ip=52.101.48.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="g6CKp/+4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nybu19g0f27YZUn5cKPR9qpvcQmfIIKRMMZc+8P2B5xfThhnBdOdAEN1FI36eTHKLOFT/PyTPM08z05YoOxQYbkacDfxIqnKBlZdgkV0O4R3pJNuYAyyqZzZnJ8JYfYgOvBwOEeRY37cfhYXssoueHjHQTiwxmTiGQmokR7lhvXagtjgd7IpUbJ6ojGowRywXZabWDdYimCwBYiBLOqkhwn7e9/7DGChnHTHwoEt0pH1XYZ8jDzaRFtA6zw/97PMM3V1n5L7phy1WJIcV6r1l9g9IdmqurRIXFiU2TDW3HeTaRNg2kTNgCjZOkP7MFy6QVIjMp2dZoX2CT40oVpneA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R8LF2jD+/UWjSFVQqmLn1SDwE7Dg4PALESOWWQ++J18=;
 b=M8QY7Xdm25V5X+/sBbvVR8rZ9cMx7EkGaykFOO1xX7l8nJa3hcrRa/6M9tUgL4PiUJLcnJNC/wXGWAsfoKvpdfWE75pVxVkcWVqNW2RGqwH8NybeZc7k7hpRvnxI0Z4IbguCQa9nqBgdputZJiDd7UzEZHxBroH/VnpTaeQZjlFHyHzzumK8+lQVQvKb4ziBnmcBiguV9cXKOoe90zR8x45KAjRZMS7yqar//d8OFkGrYFKUxxOdyuV7lci/Abxl/3mts4Uodh1Oq88o1Ib+42eINFQyJ3+I4mJdA90uqwKysAepMozBUpzlrpJ4DVwB2m/HPUljkDFssb+l326NRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R8LF2jD+/UWjSFVQqmLn1SDwE7Dg4PALESOWWQ++J18=;
 b=g6CKp/+4UQe4HAOZqpmXl5YVJ0+2nZZuMNjHOtmBIB7tYoKtRc+BGK8Xg9TtEva5S4D7ACfLX+LYU3KK536RpI2SHBlj+/ErrtjOIXoHwVWMHAHsStIfZrswpI1AZ8zr5/TWNvF+TYGRCnmV2zs334jBXLrnWYLj2GLmRv3T9r6/sv5DMuzQ/nhEjz1Sswq9dpldRIhLZ9T8blU6eiTVZ3wiOWkiXwywkxo9p2Ejg6x8WU7yrYQ24+asL2ofpofpidDaBBROlGB6EuGNRVe1clWOIm40JuH3PgUrO4AWgieX5BXF/pnIEMS5mPYEjaCvkCkUNNInWCXNYsYLz0ebNg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by IA1PR12MB8468.namprd12.prod.outlook.com (2603:10b6:208:445::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.12; Fri, 23 Jan
 2026 11:45:05 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9542.010; Fri, 23 Jan 2026
 11:45:04 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 23 Jan 2026 20:44:57 +0900
Message-Id: <DFVXYNDE1USI.3B6GIBDMP36AU@nvidia.com>
Cc: "Benno Lossin" <lossin@kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "John Hubbard" <jhubbard@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur
 Tabi" <ttabi@nvidia.com>, "Edwin Peer" <epeer@nvidia.com>, "Eliot Courtney"
 <ecourtney@nvidia.com>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 1/2] rust: transmute: implement FromBytes and AsBytes
 for inhabited ZSTs
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>
References: <20251215-transmute_unit-v4-0-477d71ec7c23@nvidia.com>
 <20251215-transmute_unit-v4-1-477d71ec7c23@nvidia.com>
 <DEYMFYQH2GY0.3HF506HL8OHY6@kernel.org>
 <DF1DP93V7IQ2.2BA2EV61WUA6C@nvidia.com>
 <CANiq72kc_SY9Nsy0kYDa__Uqjt3WqNnT-yfqvF=1La7ox2Fzyg@mail.gmail.com>
In-Reply-To: <CANiq72kc_SY9Nsy0kYDa__Uqjt3WqNnT-yfqvF=1La7ox2Fzyg@mail.gmail.com>
X-ClientProxiedBy: TYCP286CA0196.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:385::7) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|IA1PR12MB8468:EE_
X-MS-Office365-Filtering-Correlation-Id: 4bdb8990-5192-41cc-4606-08de5a74d8b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|10070799003|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cjdCZWVXbEU4cDhzMlF0Y3VOYTkrR2tpTnAyaWV5ZlN4STFBWXFOanR5LzBE?=
 =?utf-8?B?a0JGaTRyS1M3YnJIRnFGM25qaFpyWFJuYlpLUG41RUdvTnA2MjdSVEE2Szhi?=
 =?utf-8?B?V3pOSm5CM2hjTnVGMEZqVU44MjBIdTRHak11d1U2SlhMVHlMQ2JBNXVLQ2xN?=
 =?utf-8?B?aUdCUTltV1UxRi9JNEQwRTdSNzFsRkRESGx4MmQzcGZWaWxvajNYbll4K0pJ?=
 =?utf-8?B?d2laSjk3a25iOHZrTEJmTExjWERoRVNLMnlydFovRzE1RDBqdlV2dytvazNO?=
 =?utf-8?B?b2hGOXZGWVdyOTRuK1FrM0xmalJXNlkxanFsWFpjUVY3Wjl4akdnWVRITWlh?=
 =?utf-8?B?WTM2dE1QaGNJWlRDTnFqWE9PNmI5eWdBQ3dFT212VFlReUlYZWgwTnpVYWFT?=
 =?utf-8?B?WGJZTkRMZFhtRTNJUUdUbWZhUEc2VHdDNG1pc2FIeTJtV09McTU5andCTHJD?=
 =?utf-8?B?U2k2b00yKzNHRG9Vd2RGemZzRTk5ZVRsY2Z3UVA5SDRHd2EvR0lwZUd4TTRV?=
 =?utf-8?B?QTBSam5BWEIrMWV1cFpmNDNLaWlxQ1pydW5FeGx3TEs2ZmhGbjMrMU9GN21x?=
 =?utf-8?B?d3Z2eTZvWFpCcDFHaXdwWWpEb2xRVnZOTnVHaUJGRkRwNXVNZWFQYnB4Vkhw?=
 =?utf-8?B?bmhTNlAvKytIU0gyNzlKb092V2ZqK21vTDJHcStKQkdUamRseUM2bUJ3MUFw?=
 =?utf-8?B?Zm10RC90VTYrd254cDY0c3dGaWdwaGczTXhERjI4aWpnUVM1WTA0YWxiOW5L?=
 =?utf-8?B?U1FUMWgyR1NxdmVxb3R5alRkTEpHMTVLQzFVRkRWRExZaHY1RHp3d0t4M2Jz?=
 =?utf-8?B?akY0NGZ1THNzQ29BbjdXQ0xqQWhsWHBPZjQ3ME9GOFE0Y3ArNEpOWnJEY1RL?=
 =?utf-8?B?OFBTREh0enRRSHFYczFaQmFoMDAvYXE3c1VoSUErYkE5VDgyQkN4c1JPMk1X?=
 =?utf-8?B?MlJNcUpQR01zWVdJY3NMcjlYUlBZMlNDU1RDR0s1ZExJRmtUa3o4V2RvZ3Zr?=
 =?utf-8?B?eDd5dWdjNERSYUEyaktINS9pS1NsK0hrSEVtSjM4cFNuTGlwWXc1QjAzYmYv?=
 =?utf-8?B?dVpFZmVicEFtZHpVVkVrZm9JazZ5b1Q0T1NwbXNFOVIrb1ZuVG5MRTFHcXZk?=
 =?utf-8?B?a0VhTklVMWJjNE4ycjNSQks3VkZobk83aXhvKzJWTDRNQzdMY0FGMTBDalhi?=
 =?utf-8?B?VnJ1TWEyM2h0aWhIditLVFdZMmRsc2RTdW5jU0ZXbVVxZEdtSEJmVXhlVnJX?=
 =?utf-8?B?cFF0WFhUTUJJRzZBcEQzQkZEZFFOUXVHSUFDeDVPUXlyd1pyZWhhcGtUbnVq?=
 =?utf-8?B?T29lb2hwcjhPTUdBUy96dmV6cjdIT2MyYmQrNzljU2Y2OHFsc0EyTmJXZkNF?=
 =?utf-8?B?ZzNxWnpNYXp2L1Zib3hxdWd6d0tFejZ4ODdWRzcwMnhJbDFaSllTck5GejZU?=
 =?utf-8?B?QlBUVTR3ZlFlbEZhRERvNEdPNlA1MUttNGpLdHRHQTVVdVhXbnIvcFN6THMy?=
 =?utf-8?B?eUZ1VmI1Y1ZTem5QQ3RCS2pOWlBpZ25Wa05wK3JCd0NFc2c5bHhrRXBiWHVv?=
 =?utf-8?B?SDQrQjVLRFU4T3kydjBORFdtUytXNXdPek9md3J6WjFiMmFpdHpkZTlpSzF0?=
 =?utf-8?B?M29vLytNREd4Q0EyQjA4bFp6RDQvNFJkT3hVNkMzUXAyNmZMc1BiY0gxR1JE?=
 =?utf-8?B?Mm5Yalp6MXFtYzNyWW1Ed1pVek9Nd05UdDFoL29ySUxYNDh2QkdvUVBFVnho?=
 =?utf-8?B?WUNMWXBvSEpCVzc3Vmxydmlpa2NwSlNsQVBxd3U0WEdweU5yd0R6VW93bjU2?=
 =?utf-8?B?dCsyME55dVJIYytlTVhGNlB6M1c4RXk0NzZOa2dhTmU3cUtoM0w3S2dqSmF4?=
 =?utf-8?B?SVdWNExqT09JZTdyN3RxZUd4MkFiRWdiTTFSSitKSGhINkc2Nkk3eUlnc1ZS?=
 =?utf-8?B?K0c2R2lna1NNTnUvR0tzNUxiQ1N3QWxJU29tYjdBbVBoQ2tiN1E5K2RyWDBm?=
 =?utf-8?B?RmxFdzdLNzFvV21FU0lKOEQvbEwvQmp2dDd2MU5uWUJKMERJS1RxMzJoTWVD?=
 =?utf-8?B?M2RXRUdvdHVkVnM0OFh2K3RyMUlRMm5SN2gzUCs5SjJhNjJMZUNrWUYzUXht?=
 =?utf-8?Q?MzDY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(10070799003)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L0lHZ2hOMXhENVNRU2dhMmNxZ253NnZTOXEyNnV0bG5XT09RNFd4aU41bjVV?=
 =?utf-8?B?NkNnWnBKcSsraEQrT1ArYThIdlJuK2lmTWVXSDdocHdtU3JJN3F4YU9BZzhR?=
 =?utf-8?B?Y2JGS0R1UkhpY0ZKOEdMdXZuaFF3L1ErUWZvY09zUi9nL0ZjWGdWMUd6YUVj?=
 =?utf-8?B?d2ZhTmwvM0RRL2ZEeERNWU8wTDFTdzdYeE0vWXByWkJKV2k1dVJFNTdZNnBr?=
 =?utf-8?B?Rm1XOWRxeGd2bHVoNnJXZDB1NXluU1d6US90ajdOR1ZLNWVXRlhYeTlBbVpL?=
 =?utf-8?B?NDNqcFU5WXplNWxYdS9oaEpNcUxMcnNqa1BRY2VrT3BIWXI5Nk1HZ0tSaGx4?=
 =?utf-8?B?cFY0a0FhK2xCQzhxL3VwZ3RGVlVya3ROWnQvRlNVbmU4dGo0N3VrQlFMc1N2?=
 =?utf-8?B?S0I1Mmx3MHBOREQyNFJlemdmeExTV01sSXJtUkZMUzRWOCtLbEovTHQ1czBL?=
 =?utf-8?B?cjM2dTZscS9MKzJVeTdiVHhoZmU4SEdtSk5vcVU2Wm5DY1FQY3RzaS9IQ2k0?=
 =?utf-8?B?N1B2eExLT3dHdnRseWplYnpmc1NZUVFlaGY0UEgzalZ1YVJRbXZPTmJSOVRs?=
 =?utf-8?B?QkVSd2FaWE54M09QZXJzZkkwSVNyeS90MkJjTzFmbmJjVkIyZEhSSEgxMVp2?=
 =?utf-8?B?ZXgxMEgzb0RNK2J5R3FsWWMvMVNNeStPdnFvRnYvcmgwZmFycTU5S3N6d3BK?=
 =?utf-8?B?TnlPRVY3OGxyQnk5aW9LYTQ5bk41OGRQbG9MakY5TnNPRHJtLzE2SCtEQWFR?=
 =?utf-8?B?aGY5aFBKM2kyQnp3ZFJENzBWMVZjYm1CdHJid2x5RkN4aXI3WWw4ZE0yTHVP?=
 =?utf-8?B?Tk1DcVJtS1RMMW1lZHExV25yZjlLZDVCRkwxYWMvQmlkdlZwRU1GVGxLNGxt?=
 =?utf-8?B?MFl6Rm9uRzNlaTNIdmpuNVRZcVJnTmlLQ21KbVhFVTdPa2w4dUVTS1lrV0pR?=
 =?utf-8?B?TDFGeWlHaHFScUZnb2x4RzlWTzVYTVoxZEl3TW1rcmxPc0pVQjlVcnlmY1lq?=
 =?utf-8?B?L1c0cWZ2OCt5RUlVK3FJb2pmQVFTb2Y3NFVvQS9LbExSMVExbzVsbWZqRVc2?=
 =?utf-8?B?elBFcXNKRlN4Q0JuY25NbUhGcmVvVDcyQzd3dE5rVlNEWlJIdEZwYXBQbllE?=
 =?utf-8?B?VnM4MjdKT1pXL2lKcHdoeHR6VXY0bURVOHM0VHhVdGFjd3RpL29XbUk2ZDc2?=
 =?utf-8?B?SDJhVTRRaC81S3JSMzB4K04zWGFYWm1hY3RRWXdFYms5YXEwek5CbnRNSjY0?=
 =?utf-8?B?MmgvSFpwcFB6SGVnbW5hb2FMdHZNbDhyUVNGNnFiS0gxWDhKU0l0NGtKZlhr?=
 =?utf-8?B?OU10RFNucWJVYnlaQkI3K1A2NGVnc0FNVzVidUVLaDNqV09DSHBOUWxBa05G?=
 =?utf-8?B?TWVSWnR5Mzhid3dwNUpsUzBDV0ZySVNaaEwwaVNDeVFRQnhmWS96clNpK3p0?=
 =?utf-8?B?bDNMMUdsdGhXTXltcFZqb29zancxczFMWDNOWFB5cXF0ZWg2UEZZc3BPN0xB?=
 =?utf-8?B?MUMrdU10N3g3QnRhekdPM0VMMW1LbnEzNUhkUnNMa0xSQlRoSmRPWmFWWkhM?=
 =?utf-8?B?L1dMZFhPRU5uWVl1NnVKYWRNSmpUZzFuem5BU2hCTmI0ak50VzNqRmE2cnNy?=
 =?utf-8?B?b3NiUTNtTDJMcC9TR0owT3gzS1FVaEcwYlNqRG9MWEhJUU5OOXdOMmk4TDY3?=
 =?utf-8?B?YlhtdXFiSTgvWTFRc0owS0FMTVpURGp0RVY5SW9vOGlud0tvWjB6WE9ZMXNB?=
 =?utf-8?B?R01VcGM4L0Y5QzRha3hEcUNISXhPWjNBSTNPVjBvRUFmYVhwS1BOeFhFUHJu?=
 =?utf-8?B?TWgrSHUyaE5ZN1EySE43NDdobjVMZUEzNDNNS1B5dkNiWTFoZkFJaXUvNitY?=
 =?utf-8?B?aFdGZmJIQmlGdDR1NytrVUkyUVhQQm1NQUZ6cll2a0wvN2hUTTJTVEoxU3l0?=
 =?utf-8?B?NXZLSVg5TUJha01jQm92VVQxN041WjVucE1sRGxpRTZCMUM2WjV3K0FaK3h2?=
 =?utf-8?B?NWJTRnlLbklCT2dNSEdVdFZzRzZRZkpnQkNMRXkrR09BeVR0WVZoS2JBUVhE?=
 =?utf-8?B?RmlDTzg4M3h4RGR2Y3VWa2t0djRBVnhVcHlRWVBBSEpZZ1U1cVJyWlJYNU9i?=
 =?utf-8?B?dkhYbzZZMlN4KzdZUFMrZ3FyWmsrQXVmdmt4Qy9oVGIvb3VqL1lSaUIzblVo?=
 =?utf-8?B?dkVVYVB3bjBIbkhJU3h0NTlMcmFGT3FSOFVuRXBUNVp5MXFpcnBGdGRlWmZn?=
 =?utf-8?B?QlVvNG9IN3RodTlhTVczOU91WU05Y0ZUWHFIbStpcFlLaWFyckZ6NjNEUkxy?=
 =?utf-8?B?TmVGd3h2OVR3N003dHdLK3hNMTNSQURGQUFHaUx2cGc5blVpbDJlNGFLMWsx?=
 =?utf-8?Q?8EOxq3fZKpfDyGeYsXinhIQ8lzyUWgXCb5M1Ik4XlIgG9?=
X-MS-Exchange-AntiSpam-MessageData-1: bZriFDAe4lBxXA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bdb8990-5192-41cc-4606-08de5a74d8b4
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 11:45:04.1163
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WX1lLhETfealzNU3GUkq53OPX4q95osCxNFQ79eLDcLtnQLcPiKha6x3ljhW0CV8fJbkoxQllaYn85PjIxwI+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8468

On Thu Dec 25, 2025 at 5:53 PM JST, Miguel Ojeda wrote:
> On Thu, Dec 18, 2025 at 2:32=E2=80=AFPM Alexandre Courbot <acourbot@nvidi=
a.com> wrote:
>>
>> Miguel, are you ok if we take this one through the drm-rust tree? Nova
>> is likely to make use of it this cycle.
>
> Sure:
>
> Acked-by: Miguel Ojeda <ojeda@kernel.org>
>
> (Catching up on emails...)

Actually, the nova-core code that depends on this won't cut it this
cycle, so it is probably more appropriate to merge this through the Rust
tree.

Sorry for the back-and-forth and last minute notice!

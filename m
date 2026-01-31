Received: from CWXP265CU010.outbound.protection.outlook.com (mail-ukwestazon11022091.outbound.protection.outlook.com [52.101.101.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AFE12868B2;
	Sat, 31 Jan 2026 16:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.101.91
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769875803; cv=fail; b=alnIOPUbjUDq6YClxy2P2BqmHRswLl5NwBikv/DQmOHSyel49s+Yyrx8vpW41LdgxNybP1vs+wsB+t/WJuHsDgbs/zxHnZl6btUTuCwotTVfiD3Bv15YRc7poXLe9SXqtx9hrXUvGx9OoVAClctDDzdJg/kjoF530cKZYAYoGDU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769875803; c=relaxed/simple;
	bh=e/1zYFT9nM9azAqXv4FxVjSK25yT+V89KDIPsaqM5t8=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=FWnlSaBo/sd0q0uscFpXkVWuM8XC9JU7jgj9V0ktAc4OvGohX4JUhqQ4vQdVnfv16kO0oAQzj/dQBMyh80qd9H7CXOOyAYiZlMlSA4NSHUHqljkdUPCiIw9QzwqiO8ET7SQ8dhM6gTmugMhlXhdp9zAPfSQYBhZtxdzGiUA0TOI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=eUVV0scY; arc=fail smtp.client-ip=52.101.101.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="eUVV0scY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p3E/n8Uss7Asyt3Cpj4SZZwnrfUsqxiFs2O5GFth+KV6eDzTwXjK9hb2DdmxdIl2B38dfjQKRt7DDAtii3MwqC3fxFoHTyGadEDi4DU4Whi9nIY7dRNkd38RKFHNAlAvrGZ6PW6BgWUriyPqkyF0LaW8udLykDM/Yev3A5jNGO+CLlyaWoJqRzPmQMq3XwGT1R1kizB7FzYL0Xevxj594O6KpWHCiW/sroEDKlNxX3seF5P0cb3dnQzIhyD7SqYr7xHXt/kUIotOgr2WjxuYE79o6hbbAUI3ZMryYcXazMRb5Oa7+TrRS84TxlPYHpX7DwyZyBPK0DtsosiFGw/iNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e/1zYFT9nM9azAqXv4FxVjSK25yT+V89KDIPsaqM5t8=;
 b=bpYiI3/n/1vjS1uo88xEiJGtRK62b+LVrWlyJUd/W9hTROPzvae9HmbO3YxAr+pyqtbinJ8+jV+i4B0mY7wbZkdjXhWANMXmzlXZfJ8LT9ypeg7kixhgBHvWDVVMaPIUbsi9Qkp8dIjQZ5hrucUEFtvZ6DsGQgG56YNFOx4RiU6iKW54TjNqRwHtS4OJcs4VsktdSqOGBHukvkbUWtMYosdf2Vac1T+UFVtRXKTpeDPlKmT4P4va81B5MSqdjC1dCryUehTQk9iMtpJ1qt7K1M9cZy3xTk1t94rYaDkPjLTvmFEYzjmxh6xCqjeck0DnF062kZgLEDai7w6UeeUGEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e/1zYFT9nM9azAqXv4FxVjSK25yT+V89KDIPsaqM5t8=;
 b=eUVV0scYolmxqBwu/tl+/C1LWa+JLNWhsb0bFJsLpe9yvHjkP7fYt71tFFt+uHO77C+gknmYSB8xZQNoN8MP7MZQOrmirlT3LCytcqOUBb9IB/hNBM8oKE4jJMQbbdvBVdYjZ6581rC1+wE745qPMW/N+94iLAGvrAsNDBEUV2c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO4P265MB6075.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:29f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.14; Sat, 31 Jan
 2026 16:09:57 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9564.014; Sat, 31 Jan 2026
 16:09:57 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 31 Jan 2026 16:09:56 +0000
Message-Id: <DG2WLWJD8V5W.2I24LZKS6JG6Q@garyguo.net>
Cc: "Gary Guo" <gary@garyguo.net>, "Alice Ryhl" <aliceryhl@google.com>,
 "Lorenzo Stoakes" <lorenzo.stoakes@oracle.com>, "Liam R. Howlett"
 <Liam.Howlett@oracle.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng"
 <boqun.feng@gmail.com>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Trevor
 Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 <linux-mm@kvack.org>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] rust: page: add volatile memory copy methods
From: "Gary Guo" <gary@garyguo.net>
To: "Andreas Hindborg" <a.hindborg@kernel.org>, "Boqun Feng"
 <boqun@kernel.org>
X-Mailer: aerc 0.21.0
References: <a8nHDdzac5l20akcxjjf9w7huObjn4eIHjUI-A17aKEwWl1N-4vvLBiVdqTQbBHwypMIA6gNkzm8YFXmMl44ew==@protonmail.internalid> <DG1ZJ1350EMS.1S1360PA496QG@garyguo.net> <874io3rwl3.fsf@t14s.mail-host-address-is-not-set> <iFJVkpTMbd-NR24OHYTJj8lr4dw7MwCQ9rJWiuRZFgK3JRDhIIAcpf5Z24viL5qHhkrPzpnKfvX7JS6X_VO2vg==@protonmail.internalid> <DG20LKAHMXMZ.262Y7NAC1A1Z9@garyguo.net> <871pj7ruok.fsf@t14s.mail-host-address-is-not-set> <-9VZ2SJWMomnT82Xqo2u9cSlvCYkjqUqNxfwWMTxKmah9afzYQsZfNeCs24bgYBJVw2kTN2K3YSLYGr6naR_YA==@protonmail.internalid> <DG21IW5HZV2F.PXTH9P2IO8O7@garyguo.net> <87sebnqdhg.fsf@t14s.mail-host-address-is-not-set> <aX0lcVngRcRwqgd5@tardis.local> <SEV7bR_nyQNtvtgoO8X80HMkMTPLW_6roBSxJ-MpKHHNmkZQyVxSS9k1iFV7-bgAlHSLM566L8EqtRBnht65uA==@protonmail.internalid> <aX2tyn9nBUEKM-SN@tardis.local> <87ms1trjn9.fsf@t14s.mail-host-address-is-not-set>
In-Reply-To: <87ms1trjn9.fsf@t14s.mail-host-address-is-not-set>
X-ClientProxiedBy: LO2P265CA0448.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:e::28) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO4P265MB6075:EE_
X-MS-Office365-Filtering-Correlation-Id: d5ce5cfd-2f30-4a5f-7114-08de60e32dc0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|10070799003|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?LzhjTFJ6Wmd6bnQxV2h2U2lvMzF3elhpU0pSSTBuVk5rMFNsYmZtelZWLzhm?=
 =?utf-8?B?bTJXcHQvMVRHczRtSTlZdFJ3VTdsNUl5ZDJ6c2Q3MExNRVNidGVyaXp4NGdT?=
 =?utf-8?B?SmFoNnBrSGFsY2pMUzhOOC9vbmE3eGc2c3YxRW9Pem5CdnVTUVZNNzVBeEdC?=
 =?utf-8?B?V3h0eW12OCt6a1Bnb09QRjl6bm1TalZPbG10cDBoektNV2h6SHBBNXlibUl3?=
 =?utf-8?B?MVpQODJpdVVFRlpadUNyemxBcmlFRnhYNkFLZlhNcVJSenJVZ2N3ZjBMSTRC?=
 =?utf-8?B?SEFNcThpUU1JWmtsb2QzcUdwTlVlbUpwT01nUzN0SGRGQUZYbUxJM2pxdnIy?=
 =?utf-8?B?SkxuQzRsN3Z3cDQ5OGlyNXR0TmxsUUg4RE1yV01YMldFSitXb0xZSHB6Vk1W?=
 =?utf-8?B?U3VXaUFRbEFjM0hRVUtLQ1lqbnZpSnA1YXRyV1M5T2pMR0hOektuL2NwRzMv?=
 =?utf-8?B?ekFaSVFqd2J5Q1R4M2JpeXZhazJOQ2ZNR1E5eEpicVFwaHJYamEzOFBhK2NU?=
 =?utf-8?B?VVExdlFBVWRtSmNCbTVkZnBvZk9OTGFveHJGSjgrMHU4eXlqYWNwTDRTd1h5?=
 =?utf-8?B?TWFlelFJY3AvS0Zud0ordy9GaExOaWJRd0tselRoWjBodGg5NHk3dFBDYkVW?=
 =?utf-8?B?UnZYZ0RseDlVZ2tuVVJLVkY1RU5JRHhZaG14a29QZU0ya1BiRkVId1EyazRv?=
 =?utf-8?B?ekRhb25tdVB4Y2lrRjFhcnRtZi9EalMzUVVMcDlLbVlsd0FaM1JsOEF4UktH?=
 =?utf-8?B?VHcyODZQRWZVQmN0YVBTdHdpWjA2VVBWeW1ZZ24xVEFsNmRzaFU4WU5Ma1ZS?=
 =?utf-8?B?S0F5dEpEK3RyQk1WMkFFMWtiYnhQaVhzNzhkbXB6YkNmZm53RERuUzE3VCt2?=
 =?utf-8?B?c3A0TlRoK2dWekNTam0rdUM2K2MrKzJGQVlUQno3WUpadzJDZFd2aDdBTlM2?=
 =?utf-8?B?eFFJeEhKSlRKT21pSmNoOUxqbnc5cTJvamlFeDc1Y0FQU0tIZ2pwR1pNL29X?=
 =?utf-8?B?REM2VGRDNmVjWTBsMk4rNXkvWmUxSW9tYjVRK2F6aER1NFFiNHhMYlozcitC?=
 =?utf-8?B?ZWJkaDQwdkEvM0JVSE4xSTZBOWcyNWhQWEo4elE3VTdxN0dQUHo5bXhYaTVj?=
 =?utf-8?B?R0F2NTRaK1ZIMXVKamZpMWhhN1Ria2hPejBjdUZLdHFwVVlQRlFyOXNza2tW?=
 =?utf-8?B?aEtJVzcrNG1WZTJXTXFCQ1BGMzJJSHRETzJHUXVSV1VEcEJCUVNhTU1CNXN6?=
 =?utf-8?B?M0ZhWTZSYlFDNWV6eE1DVWNyVVpueTkyaVU5ajRUbmJSWm42dW1leGNZNFZY?=
 =?utf-8?B?MDFSK2RhRFBjQ1RkbVJIMHBLU3owWlNxVmkyR0dSeUx4aTFnUTJhMTVzSTEv?=
 =?utf-8?B?a0JSa0VqT3F4RnFqMXdlWlc4aG9aaHEzeVpiSU9Bd29EQkc0NnY1T0c5L3JF?=
 =?utf-8?B?bU9MVnVWbVRuUUJvbTZOTWVpck42RytEcmNBMW9oMVR4VXBpMUxhdEJ5WG1X?=
 =?utf-8?B?WkF5WTEzSnd1WTduc1ZZRS95TmduN3RwTnFvanZlTmxxbmVtTWxDbmVrdC9w?=
 =?utf-8?B?R0pDTzUzUnNFTDdhRE9qdUMrOU5IOXY5MzVXaDlqQ3VQTWF1Rk5vakl0K0J5?=
 =?utf-8?B?YWdjdDVJdGZXTHVyVDV4R1h5WUNsOFNJdFQwUEs2S1JIbFByVlpFc1dYL3Fa?=
 =?utf-8?B?bVVDY3NNYUJ4SHFNZ3djaU1BbmtLVWtnQWJKNzFlM25JV0ZQd0lHcTRZS203?=
 =?utf-8?B?YWRyM3Bac3FYMXE3S3RqVENjK3F2a29kTmF1dWJtTVozTzdWM2E3ZWFJdVdo?=
 =?utf-8?B?N3VoS0xUdWxCREJlSkFlbXhGcEd0SHZFSi9GQmtHWGFzdnY4RFhVOGIreFZK?=
 =?utf-8?B?UElHUWIvZnpZUUpza3BteEFnckErSjd0MGpNbjIyOXJ2aHBYT0dnSjRiaC9l?=
 =?utf-8?B?ZkZ4bnl5RnNVOHFNdUNreDlyaVNpVk83QnhhdE9ueWZPREJ2Q0xsM0xaNk1N?=
 =?utf-8?B?VVRBUWhzcW0xYUVnN0dtb0NrbHMvUXJMTjRucjR4SlMwK3dWaDl4a0VYbnJI?=
 =?utf-8?B?MlNRMlZxSFcvbTFLd3VDdm9VdDNxL0Nqdll0K1Uwazl0WTBnaGdiczA0R1pr?=
 =?utf-8?Q?DFF0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(376014)(7416014)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c01hcmFoWWpkOGFCY3hGSFlwUG9FSzRyTXJEWjE3bGx1WWtVZGh3bzFjaGNK?=
 =?utf-8?B?WnN3VkNXb01oMzcyTjF5Y3NFTVBmYkFlUnkrZzVhTm9TdFFFVm11MlpZWUNY?=
 =?utf-8?B?elNnQ0d4MFpoRlBZQlN3Q2dhdmhUVlFMdEZWdEE1Q2RySU9oZHNwRnFVUUE4?=
 =?utf-8?B?ZVRCQmhSbUFBUytCRjlGVTBlTk4zbnJoWnlMeEJnMGxPUVdUTkN4NXBsL1Vw?=
 =?utf-8?B?c3VTT05IbENCaEN2WnMwVFVCY09KVGtyemhlY0UyZERMVTJEeWFIVmF4cHF1?=
 =?utf-8?B?UDlNZXh3cTZmSW9UbHNrTk9pRTdsYi9mdjgxS0hsWnRZSTRkM0VxYXpWWmtI?=
 =?utf-8?B?SUR3MFNEUC8rdU1lTHpPMCtxYnlwb1JhVGNxZWZiaUdsMW1CU1hlSGRJK1N2?=
 =?utf-8?B?UWNBSG02d1pQaUxQRWxPQTFacjRDbDk3L0paQUJraEZDQnpQY3pVMEFDU2tY?=
 =?utf-8?B?bUxyclN4YkxmekxGVDdLLzVObXdZOE14a3RDek5XazJibmdySHNOYk5FVkJk?=
 =?utf-8?B?ZlcxSVFOZUM4U3JJcFEwTW10WWd0cXdhVEQ3bkhiMWtnK3VESUVjTUQwZTdN?=
 =?utf-8?B?QnNaN0V3UEU0Z0RzRDBRNjQrRm1CQmxmRmRpTEpadC94OTdCTEt5dFh1Q25Z?=
 =?utf-8?B?MWh5K0M2RmgyV0V0TVNjVk9jUVhMWFNVUXNJNmJXMnlqTytCMjlrMzhNbzAw?=
 =?utf-8?B?SXk0eTFuNjd1SjdXZUF0L1dmVjdNbEhNZkp3TFpmZlNneEEyL29mMmlGbVV3?=
 =?utf-8?B?Y1E4ZXhrSXhlMnc1WmxhQld4UEpqczVML25QN0dxeEVvNFNFa0htUzhWNDk4?=
 =?utf-8?B?eG83a0dNNjBPUWxIak02RkJKb2k1cFQ1OTFNWFE4YmxmM012UkZvSWhGY0Vp?=
 =?utf-8?B?UmxzT0Ywb3ZHQVBxZlN5VGxFN3NPamVyb1MrMVFSYW5NUGFGY0JIK1FBNHF1?=
 =?utf-8?B?akJuQVYzZENMeVRsS1lPNVE3NlFRVzdJS0h2dFFUM1E0OVF3VEVvSE1lZEk2?=
 =?utf-8?B?cTZCZXgzUjVSSjdLNnlMYlhoLzFZcFFSL0wvS0JURjAwQ3FmdEZ3UXI5VWJr?=
 =?utf-8?B?SmFKdlB2MmQxRzd6aTRWRjJrZCtzYmMySDgxNGVuUyt5cHNxTFlBWHBiR0p5?=
 =?utf-8?B?aEtDTmJsS3pCODF3L2NDc0JyUlNmM2h5TjcvbS9YcGNQdjJodFhzM2REWExi?=
 =?utf-8?B?SXBvVUoxaUR4YXBDekpPbSthcHlNMlN3MHBSVEVNY3AyZ3Q2ZjZXT0dwZ2xZ?=
 =?utf-8?B?dE44aTZ6aVhBZVh6TEJHNWVxbFV2NWZuU2hoZmNwWXNoVG9CZExNMTlpVE5R?=
 =?utf-8?B?Kzdzd21aR28yZmhMckt2dkt6dHd1cWhkelpKdDc2SDh4MktDY0IzcjR1WFJ1?=
 =?utf-8?B?cXhKTWNxSGpRNTJOSVdVUWNmUDhSb3l3Yk15dXZzWWxBeWV4QkRTNHk5WDM5?=
 =?utf-8?B?eC9RS1Z4VlR3KzJYd3hVSjA1d3hMYzd1KzlTSDBhUVRCT29uam1qY1JldXgx?=
 =?utf-8?B?b3huZXQ5S0ZNNlJsNzhMeng2N3RFMlIvMGZ0OThXWlhIUmlzZ1Znd29iNUYr?=
 =?utf-8?B?UmlrNUFqbGRsN1NOQ0E3dHk3dFhoaU5kWjJUYVArci9VRmk3TFh4TzdqY2tJ?=
 =?utf-8?B?NFRXYzlxWjBFU2FWTjZjUExSa2hPZXdWS2tkWXd1d2RjTFNqcXZyY3h0ampv?=
 =?utf-8?B?TTRwdTRLTnlVbWgzelVDN3lZMFNVUjV1SzFEbG1JMzN2UCt2OXBHN3pUaCt5?=
 =?utf-8?B?Wi9ZZzNMN2JRNEhMMEVjYUxHd01LTXNvRnlOYzRPVzkxcERPQ0dhemFSNlNn?=
 =?utf-8?B?cHNZNjBGSXN4UTBkMEx0Yld1R3l5VW5FR0lHcUgrQVBtRFAzR2E5d0RsWE9J?=
 =?utf-8?B?R1pQQWFIa0hXYlBKa09SN0JVVlFrbUpqUkZUUUpjOXVFd3FmV0kyQXY3c1Bh?=
 =?utf-8?B?UWhGOTBmM3F2dER2a1J6bHpUTTRRckNIK1Y2bURUNDZLMkVFS2o1VnZTRkc3?=
 =?utf-8?B?WCtlZHdKSjNHUG0wZnlMcVY4c0NoeWJab3h2RGJOSjVFdW9LME9jRmZweWtQ?=
 =?utf-8?B?dzRDRW00QlhacEx0a2NlUHBzNmpJaGlzM1h2L3lxcG5wa2tsVW1aaFlBRkI2?=
 =?utf-8?B?RWZvVzFnNXRpc3plUjJxS083NU9QUWJoUDRRRG0vUkhKYVVob3hGY3I4WGpu?=
 =?utf-8?B?eWdHSVErd1NoaFUvdWJLWU9uVUlndnpLK3g0WVg3RHFLV05yaEZBWm9JNkw2?=
 =?utf-8?B?MVlURkpXMC9EWWFkbUorTlJrV0tJcE52Zk90ZTgyT2t0eW0wK1BMSVFaNm9Y?=
 =?utf-8?B?SUZSb1BOOHpzWDNPekFiR1dKYlRwTGk4SUhCQUZYd0wyZ0NORVlQZz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: d5ce5cfd-2f30-4a5f-7114-08de60e32dc0
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2026 16:09:57.5735
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b79TmHJtjZE5L/+6Y5HipfHq4C3KcaJNZi2LpQ4l5DBlBXl23XS0viUy6mMoWWeEYXUNDy2pK9uWdktUq9RR7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO4P265MB6075

On Sat Jan 31, 2026 at 1:34 PM GMT, Andreas Hindborg wrote:
> "Boqun Feng" <boqun@kernel.org> writes:
>
>> On Fri, Jan 30, 2026 at 01:41:05PM -0800, Boqun Feng wrote:
>>> On Fri, Jan 30, 2026 at 05:20:11PM +0100, Andreas Hindborg wrote:
>>> [...]
>>> > >> In the last discussions we had on this, the conclusion was to use
>>> > >> `volatile_copy_memory` whenever that is available, or write a vola=
tile
>>> > >> copy function in assembly.
>>> > >>
>>> > >> Using memcpy_{from,to}io is the latter solution. These functions a=
re
>>> > >> simply volatile memcpy implemented in assembly.
>>> > >>
>>> > >> There is nothing special about MMIO. These functions are name as t=
hey
>>> > >> are because they are useful for MMIO.
>>> > >
>>> > > No. MMIO are really special. A few architectures require them to be=
 accessed
>>> > > completely differently compared to normal memory. We also have thin=
gs like
>>> > > INDIRECT_IOMEM. memory_{from,to}io are special as they use MMIO acc=
essor such as
>>> > > readb to perform access on the __iomem pointer. They should not be =
mixed with
>>> > > normal memory. They must be treated as if they're from a completely=
 separate
>>> > > address space.
>>> > >
>>> > > Normal memory vs DMA vs MMIO are all distinct, and this is demonstr=
ated by the
>>> > > different types of barriers needed to order things correctly for ea=
ch type of
>>> > > memory region.
>>> > >
>>> > > Userspace-mapped memory (that is also mapped in the kernel space, n=
ot __user) is
>>> > > the least special one out of these. They could practically share al=
l atomic infra
>>> > > available for the kernel, hence the suggestion of using byte-wise a=
tomic memcpy.
>>> >
>>> > I see. I did not consider this.
>>> >
>>> > At any rate, I still don't understand why I need an atomic copy funct=
ion, or why I
>>> > need a byte-wise copy function. A volatile copy function should be fi=
ne, no?
>>> >
>>>
>>> but memcpy_{from,to}io() are not just volatile copy functions, they hav=
e
>>> additional side effects for MMIO ;-)
>>>
>>
>> For example, powerpc's memcpy_fromio() has eioio() in it, which we don't
>> need for normal (user -> kernel) memory copy.
>
> Ok, I see. Thanks for explaining. I was only looking at the x86
> implementation, which is of course not enough.
>
>>
>>> > And what is the exact problem in using memcpy_{from,to}io. Looking at
>>
>> I think the main problem of using memcpy_{from,to}io here is not that
>> they are not volatile memcpy (they might be), but it's because we
>> wouldn't use them for the same thing in C, because they are designed for
>> memory copying between MMIO and kernel memory (RAM).
>>
>> For MMIO, as Gary mentioned, because they are different than the normal
>> memory, special instructions or extra barriers are needed.
>
> I see, I was not aware.
>
>>
>> For DMA memory, it can be almost treated as external normal memory,
>> however, different archictures/systems/platforms may have different
>> requirement regarding cache coherent between CPU and devices, specially
>> mapping or special instructions may be needed.
>
> Cache flushing and barriers, got it.
>
>>
>> For __user memory, because kernel is only given a userspace address, and
>> userspace can lie or unmap the address while kernel accessing it,
>> copy_{from,to}_user() is needed to handle page faults.
>
> Just to clarify, for my use case, the page is already mapped to kernel
> space, and it is guaranteed to be mapped for the duration of the call
> where I do the copy. Also, it _may_ be a user page, but it might not
> always be the case.

In that case you should also assume there might be other kernel-space users=
.
Byte-wise atomic memcpy would be best tool.

>
>>
>> Your use case (copying between userspace-mapped memory and kernel
>> memory) is, as Gary said, the least special here. So using
>> memcpy_{from,to}io() would be overkill and probably misleading.
>
> Ok, I understand.
>
>> I
>> suggest we use `{read,write}_volatile()` (unless I'm missing something
>> subtle of course), however `{read,write}_volatile()` only works on Sized
>> types,
>
> We can copy as u8? Or would it be more efficient to copy as a larger size=
?

Byte-wise atomic means that the atomicity is restricted to byte level (henc=
e
it's okay to say if you read a u32 with it and does not observe an atomic
update). It does not mean that the access needs to be byte-wise, so it's
perfectly fine to do a 32-bit load and it'll still be byte-wise atomic.

>
> You suggested atomic in the other email, did you abandon that idea?

The semantics we want is byte-wise atomic, although as a impl detail, using
volatile for now is all that we need.

>
>> so we may have to use `bindings::memcpy()` or
>> core::intrinsics::volatile_copy_memory() [1]
>
> I was looking at this one, but it is unstable behind `core_intrinsics`.
> I was uncertain about pulling in additional unstable features. This is
> why I was looking for something in the C kernel to use.
>
> I think `bindings::memcpy` is not guaranteed to be implemented as inline
> assembly, so it may not have volatile semantics?

In absence of full language LTO as we have today, it'll be fine (in practic=
e).
Unlike C, if you reference a symbol called "memcpy", it won't be treated as
special and get turned into non-volatile memcpy.

If the volatile memcpy intrinsics is stable, then we can switch to use that=
.

Best,
Gary

>
>
> Best regards,
> Andreas Hindborg


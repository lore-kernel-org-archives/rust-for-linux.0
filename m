Received: from LO3P265CU004.outbound.protection.outlook.com (mail-uksouthazon11020093.outbound.protection.outlook.com [52.101.196.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12C5C35B124
	for <rust-for-linux@vger.kernel.org>; Wed, 28 Jan 2026 13:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.196.93
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769607396; cv=fail; b=hd6A0u8DEhRkGg6D2OE+fa8s8tXsFot8b5c/dX9ExNg3SqCMUGj000D9/Y7CFIET8fNyIIm564StijDHL6cQKsnoPLfrg4CfaTUK2LBkjgSQGT+G2q+rWFqK/4wJn1MOvPzQMhZFf4iGIo+6sGK0HDTHuU0YSlFHoO1t+SRoSjI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769607396; c=relaxed/simple;
	bh=lSRILrTF2HrRpiqq74Vn/iIipfCK6co2pQq09i8Cpek=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=cVma34C5/HNDPOyi3diM9ZSKjlz089bb1kDWwpBIm7kC1gNiRjA86hrX8jm2nHcaDyEK0aSxhUPk4kIE4fkQ5O5Hl9YTsfkbEFHjID2UJcjA487Kv+IIky2FBHVHAW/5/PfQwXSXOpZMttVNztdkWDyqBHtoOjd2RFKlTmCrilU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=MKG2gJIp; arc=fail smtp.client-ip=52.101.196.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="MKG2gJIp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ptUMT0ZL+OCBm1WQxnV6aCbZylPdkdsbI0FlalBcAB7zXF2y1NeSgi3sQTak8SvBIJMSgA/s281xrt+QdWHMUrkFLLQ/ZaYMi/+znpZrJ+t2hkScJOqz8HlyxsYApmB+hhq4G9uIac05HFva6czzRqUe9Wkv70jIpeFBIJRb2kaM3p80CKnBqUcGU4TgaxK/+30LWGlGtvAcfy5vARIAjgcvXeHqOxJyVdMFwYoM2aR8nYJsxHFjuVml+8HBrmGOWiMYSLKBcnwz4YpkueqhfLJSEqD8KEwk/s/HyH3FbUC9GqiXripkRIHJwyk3pH3Tt83CNDknV9VsPm6/YYzawQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F9kna0981HqyOaTNSb0gPpQdNryQVy2DQnolLSIwtJQ=;
 b=ua6BrD7lOfgxiJfI6JyAfgKdzt1pM7tajqUlHbf2Gph0ehVbWPgfqH1avJKLazQsv5fc2KeUtcTzwrV6c6bJQ2uayo5L5gLAmgxao6YcMdz784nXbnzrkSz0hwNO3i01JzKFaUQWR/I6HaE3k4vI8E/223Z/FgH8zyoN75cfCoY3glnLhoiI7mf7DDnrbIUl0OdkY4aOtnKYwijf/kdgz3ScVeHXer22NULFRaGhhJM0BR5GRS9nws3lY0flzR6E4eKFPsre/ONtxNOcwpLSKtWEkldG/OwlCehwPNDQejDQi8uPef2lU+aY7kj+mmue7/LU7in9tVQzKip4sCbA4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F9kna0981HqyOaTNSb0gPpQdNryQVy2DQnolLSIwtJQ=;
 b=MKG2gJIppYwHEkt9R+j7Hqq/blNgvqLpiNizak/g94zN6eJUoFHBBcA6VZSuMjupvuGzNrIARFTSim0knyQKuGAJoICj4FB9JE1aGrc93Poz1h3+u1dvTTw4HZ2JRGcIjiwuwB/qbd1xAHxqvxKRoBb8CPWtY5qJudl5wBRue/8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWLP265MB6926.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1fa::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.16; Wed, 28 Jan
 2026 13:36:29 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9564.007; Wed, 28 Jan 2026
 13:36:29 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 28 Jan 2026 13:36:29 +0000
Message-Id: <DG09GRRLBOW4.1LZ2NKH2TZEH5@garyguo.net>
Cc: <a.hindborg@kernel.org>, <aliceryhl@google.com>,
 <bjorn3_gh@protonmail.com>, <dakr@kernel.org>, <gary@garyguo.net>,
 <lossin@kernel.org>, <mark.rutland@arm.com>, <tmgross@umich.edu>,
 <rust-for-linux@vger.kernel.org>, "FUJITA Tomonori"
 <fujita.tomonori@gmail.com>
Subject: Re: [PATCH v1] rust: sync: atomic: Add example for Atomic::get_mut
From: "Gary Guo" <gary@garyguo.net>
To: "FUJITA Tomonori" <tomo@aliasing.net>, <boqun.feng@gmail.com>,
 <ojeda@kernel.org>, <peterz@infradead.org>, <will@kernel.org>
X-Mailer: aerc 0.21.0
References: <20260128123313.3850604-1-tomo@aliasing.net>
In-Reply-To: <20260128123313.3850604-1-tomo@aliasing.net>
X-ClientProxiedBy: LO2P123CA0046.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600::34)
 To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWLP265MB6926:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ed4205c-ffdb-4fbd-b53d-08de5e723e3e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cTRDWEtrNjlBU1l3NW5CY3QrMlRXc0d0bXc2MytiK0RsaTk2ZEZVLzhUVXZU?=
 =?utf-8?B?VzQyQnYrRWNQWC8zNm96Y2VtZm9zV1RVRnVwc0NjbzdITmMrVHE2djlHdjBE?=
 =?utf-8?B?RDJkejU5ekFmV1RIUm5oSnVSb3I2TGRPSGtCNjlNTklyNCtERVJFUklhN2dh?=
 =?utf-8?B?SFRPa0dISVVpejJZWHg2NFI1aC84UVI2L0NjUnNZOVhpUnFHd0RDU2c2WU5a?=
 =?utf-8?B?T3FZWjhGYmc1SlRiUEhWMURrOWR5alJsNmVraEhYcURLOC9IWjFUajhhYkJ2?=
 =?utf-8?B?cmc4dlZ4ZUQ4WmFSUUJmQnlQSnpZbmJOQnBqcW9iODBwVFlDQ3lHVUlDUWlz?=
 =?utf-8?B?QXhNWFV3RDVFcUUzanFGRlJKQUN1cGd5S0FXb1FuSXFJUm1Da0IvOHlpRmFP?=
 =?utf-8?B?TlZHd1FveEdFY01lSnM2QnRRd21LTVpBdHBJcS9NdFFCaUY0SFRPU05zb3l1?=
 =?utf-8?B?MjNGZCtmRWdFT1hNaDkvWDFja0c2MVhWeEJseW9sZkZHSEFiSW4zTTBlNDJn?=
 =?utf-8?B?MURXeFJjeTdMcmN4dG4vMEZhS0ZYMnFDK2k2SllEREZQWXZ1eVI1ZWVNVnkr?=
 =?utf-8?B?Y2NRRHljbW9aMkZFTnZhdUlNbWRkbFk1Q21RMWgyN2d1bHJqcXJubUlpMHYx?=
 =?utf-8?B?WFZja2R3VkVDWG51THQ4Z2hJRGRqQ2FPR3A0Ly9iUW1zT2E2UlFOWU9ZQ3lK?=
 =?utf-8?B?WFZLZ3Y4TC9WMjdiY2k0MFV4L0s0QnlnNHFVU2F6RXRORHFhTmdIdHoxd3ZU?=
 =?utf-8?B?aWt4WUVLeTcwUWd4cDFLL2ZUb1orQ0V0OUtvTlBDZFdaMXBjYWpaMmpnS3V5?=
 =?utf-8?B?M2NPZGplbldQbDlGTS9Ud3FSQmlmenpsZEdGYzdWNC9MOC9WS2R3bEFNaHJ1?=
 =?utf-8?B?K0JhV1Q3R0pMTDZnM29QNFJoQjRCVFVrSVZXOFU4d013aHNpOENldEtDRGNo?=
 =?utf-8?B?RXVQbTJ5eDBhSjdKNWRJZ0Rka3RGcjRmYU51WFFlVXdFeTB1MjU5VXBqREVT?=
 =?utf-8?B?b0dvVmF4MGwxbmxrSFE1UjNnRDhUL0Q3RVVzMGhMdEFWYVM2UnVnaEM4ZEVG?=
 =?utf-8?B?eCtuWTFGaXZIMDFpeU9ROUM5dXg1UWpESlUyNy90cGF2QUJZWS9pUUZpSW1D?=
 =?utf-8?B?cmxzU3pLSUc1VndwNnlqaEZYTHltRUY4V3NxaHRURFRqcmlOQUdLS3BPZzdN?=
 =?utf-8?B?dXM2SWpUMUtaaU96VTBRK1BHQXBIS3ZzbFZBQUsvTVpOUmhoclo3MUptaGZi?=
 =?utf-8?B?bzFhZDNzZzNEZHRkUUh1U013Mkh2QVZzM0FXNGkwdU1IWkZGVmNHVVg3T1lw?=
 =?utf-8?B?bm1WakUrL3NzT0EvRzkrN1ZRbGQ3bXl0dGxndStvb1J0bTVMbXg5N2pXaElz?=
 =?utf-8?B?MURYbmE4b21kc0VVdGlLZ2tOcWY4NDFjTjVwMzN4U0l5bkpiQUdzb2tsNjlK?=
 =?utf-8?B?Q2dzTVpqbUpjSkp4eFY0Rmc1c2JvbGRncFJ2OVBmejYvS2ZxbkZVenRpSFRV?=
 =?utf-8?B?VnVXeWxaS2htU3N4dy9kRFdkZ0NwRW1TQnM5eHk3bnpqRlhKLzU0ZWVLSmtN?=
 =?utf-8?B?WklZcnJTTEhCNnZkdkdIbkhRYlYzVlhRV1djYmc3QmkzeUJUU1dValcxNzQ5?=
 =?utf-8?B?UjdmZXZtMnBmaTFxSzJRNXF3SnRmK25SRHlpNVVKVk1ObzQ2TzErWjZkbHF5?=
 =?utf-8?B?VHpFK1l4WmtjNHRiaENvdm9oUDFIZmdNcWJpaGZucHVzYVlrS2huSVVVRHY1?=
 =?utf-8?B?S0ttaUVCc2xGMkt6WlZJRWNWS0ZVVGk0WVR1QmJERURva2hVWUVXaGdGSXp0?=
 =?utf-8?B?WjhVVnJFcTZBNkEzUG41Wm04aU5meEhLVWpTbWVZUzZjWlhKSkIxM0xUTThS?=
 =?utf-8?B?UnpUMS9iWFpIUmhRTUgzRDdSSHRITlVKeWkyYTZ5clgrWXJWRkZqTzNYemtO?=
 =?utf-8?B?dzBDVFRDVnhrWUJZY3hLNThWY2JWRFBOK0pUSUY4TkgvdzZkSGlXV3BvWWQ3?=
 =?utf-8?B?S2pGL2VMdDhmU2I3Vy8vUXIreDlZdUhlS0doc2lWUUJQSzN0S0F5YWxPOS9G?=
 =?utf-8?B?SVRvOVdJMHMzVStDMWZObWVFTUloZVhYMytRdG1POUdHLzBCWmlHc2lrMC9E?=
 =?utf-8?Q?ujKM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NlRrQ3R4NkY4MjFoVkU0WEgxeWMxbWJaS1lBK0xNNEJ4blRmcTZ1S0FSZGJ4?=
 =?utf-8?B?RzF6KzZoOTZlQVltQTlDNkxvaXJvaWJJcmpoNFIvVW1aeG1VLzRyS3Z4VGdK?=
 =?utf-8?B?UWY4Q0p5ZU9qVlpDZS9yWlY1WHJWeVpaRW5IRFZ4RHNMR2RwM2Q5OUpJSlJG?=
 =?utf-8?B?TWdQWWhtYUxXaE12NDNCN2FKWHlUMWpFcHZZYXhJTFRBaTNMVjJHajgzZXlE?=
 =?utf-8?B?blMzdW9HeHIrZWZnS2NHdHRFaTRCKzFwQWh5YnM3R2paMWZtTWFZNWNrZS9L?=
 =?utf-8?B?bkNLT0xsRG5EeDBmTEpkTi9oUzBPMmxIelBNYk5qRDZtOWx2ZDlBNEpmYytR?=
 =?utf-8?B?SlZ3OUMrZC9IVzMvVW45dHNDYjhOZ3MvR1Q1YURLLzdNVlN1bS9aSmNpWHJL?=
 =?utf-8?B?eHNOUVdZaEk3ekFPcG1uZWhLSDk0NmJZUnhOV29tWXo0bEp4SytocUY2NEdO?=
 =?utf-8?B?NmFCNFpjMlhsRFM4K1ovcWFldHRkWDBkVWhaNmpWMzVGbFFSODVPelU3RHAz?=
 =?utf-8?B?a2FFYUd6cDNyeVlRYVdmQTVEeXZmeEI0NnBocFk1Q0t2Rk1jSHFIeXdhbEJU?=
 =?utf-8?B?T3JaZzUwdWhwU0IyOTh5MjdVZ0ZTTkNocllocWNtM3Q3RjB4cG5Oc0VuSmMw?=
 =?utf-8?B?Y2xaeUovTk50TzBPSGdweUExSTZpMWYrdWtWM2Y0T2dZeE9wR0hGVzNRYzN5?=
 =?utf-8?B?M0I0OXZrcDBBMjBXdWQ1bkllK2NsTlpEOUhvTkc5c1o1aURuVVY0cFZNSVRY?=
 =?utf-8?B?OVlzZWZ4OThma0pGU1pGbVJiKzk3MFk5WUFEQ2oyb2xaaVBDL2xVeVYvYkNE?=
 =?utf-8?B?ak9BVlNmTFV4MlBRbGNzR0xwRWkzWlZFWWRSM2JZcVY2UzR6N0hXSm1MREJk?=
 =?utf-8?B?Q3NRWVVWb2xGVXl2eDArdW9za3VNQU9CajkvQ2xqV1FPMFgyQWZnMVhrUmNv?=
 =?utf-8?B?eGJaTkxzUVF3YnoxVkZnSzJHbC96emdLRlA3b2xKQVlrd0xLVlJTSWEyb1BJ?=
 =?utf-8?B?WVdLeHFpOW1oTmlhYk1mSHIzQ1d3N3dKLzRSQjV0NFR5V2xtQU53UmtxM2ti?=
 =?utf-8?B?L1VhT09YOU9vR1NNKzR4R2dRL2s1cHV0TzRLSjgrN1pWRVNFKzBJNkRvb0k0?=
 =?utf-8?B?TkVPMkJQbFpjN3NiRHBCNDIzZFhhcklaVmxsUTNtMFU0d2pldnhGdTgyR1Fs?=
 =?utf-8?B?V0cxNVFxeXB6c091Zmk1RktEdmdNeGpDRmRLSnV1SUNoZmlUTjRheGhRc25l?=
 =?utf-8?B?dnh2RFczUFJRUzRJcDN0L3E3VHdtL1JKOEJXVlZGRXowMzE1WHFuVGZya0pl?=
 =?utf-8?B?Zi8xbmIrRlduTlNPUStFNHJnRVhXOWlyZm1xTk5YMzViRldUUUVnaW9NaUlR?=
 =?utf-8?B?U2c5R0xLLzFVcFJsS2kvVGMzSXE1a1JyQlpIMEF3SWpsRDZGTzdRcHVNZHNv?=
 =?utf-8?B?WXVGanJJL21ybDlyUmRLYWdxTk9KUm5oNzFqU0pQMFU5ajdPOHFidlpzWll6?=
 =?utf-8?B?ZkUyNm9kTFJTK0wwRERxVTluWWVlS2h0YUk1NWFEeGFnT1dZQzF2ckdack5k?=
 =?utf-8?B?S3k2WFUyd2NtUmhHSFNTem1xQks1MXhydk9zTUxmL0tFdTJEaElXV3ZtN2RH?=
 =?utf-8?B?SDhoZlNlekhkMFpJYmtMNnFUUXlabU8vUG5XbGJZaFJSejE1a0NYa3lKbzVM?=
 =?utf-8?B?Uk5Qb1V2Q0ltSzFNbU9rWndhai9OaWNLWWIrTzFjVHFQMVE2V0NYdWZFWXdN?=
 =?utf-8?B?RXdrd1BPempGSzM0YlQvSUJyYWxEeHFMZ1R4KzdkdlB6aHNDZzNmSmI4YWJF?=
 =?utf-8?B?U0lkeGM4RW1pV2hiVkZlVGJKNFhrVVhBWUpJc0lJVkJLSnMwYmNCNVZJTEFk?=
 =?utf-8?B?N3YzOG5nQnlUS0xLTGVTUUxUYXZpankwZU9FdlVjeHpaUTZ0K0JTcVBtNXhw?=
 =?utf-8?B?YWZmUDc5TVBJNDRaUVE4dUd3UkRBSXNwN3ZYUGpoU29vejZ2MnJjN0g2OWpY?=
 =?utf-8?B?Tk1ob1JzSlVhVklNbFFBenNpNzlab3NRajFyN2NXOEo2V1lqNWluamN6QlBL?=
 =?utf-8?B?am13YjAxbmh4SEs4WWNLb2dudmhRempDN2kwRXBTbFpwRU5GaFFGREhEdUR2?=
 =?utf-8?B?djAxRVdXVXUxWlVEbmZPZUQxN0tUMWM5N1R1RkRuRDd5ekFkeUhVempISDdQ?=
 =?utf-8?B?d3hhNytadGUvdnROcmpXb2JLOTl2eTg3RXc3RzlRd0RkYzdGTW0vL0JEMHNi?=
 =?utf-8?B?aWtkd0FidWtpdzAxNUhDLytiQ0lRc2s1V2hHVVNSbjVpKy9oVnphZ05rOWZo?=
 =?utf-8?B?YjlEbVZWY3h5ZVNrQ3VHVkZqTElXeEtGQjlzTHRpZ2FoaVFWdmJ1UT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ed4205c-ffdb-4fbd-b53d-08de5e723e3e
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 13:36:29.7458
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 76T/7MmJTHKV4IG7DBGG403Vue+lBgiMQpSFjmBrCZtv3EWYHE6kj2W/Fy6yURz5nmNQdhPo3Yt0Vjt3KJ9bfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB6926

On Wed Jan 28, 2026 at 12:33 PM GMT, FUJITA Tomonori wrote:
> From: FUJITA Tomonori <fujita.tomonori@gmail.com>
>=20
> Add an example for Atomic::get_mut(). No functional change.
>=20
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>

Reviewed-by: Gary Guo <gary@garyguo.net>

> ---
>  rust/kernel/sync/atomic.rs | 11 +++++++++++
>  1 file changed, 11 insertions(+)


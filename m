Received: from LO0P265CU003.outbound.protection.outlook.com (mail-uksouthazhn15012041.outbound.protection.outlook.com [52.102.164.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4187E2E2663
	for <rust-for-linux@vger.kernel.org>; Sun,  5 Apr 2026 23:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.102.164.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775431052; cv=fail; b=p/keqX6A5bi40q39Po3HnaYOoc2gbQeoirDOoT0bg3RSv9+HA22yzcUcav3BjaxbJ0ATfdzOyAt2eOiUH93v6f9ShIpkrrFA0siJzT68ty7COKOT9qdvgcVYSAX7/E8uuFy9NPGrxqFh8xpzbEpc0U/Zax3az6qSWM/lT/4wWt4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775431052; c=relaxed/simple;
	bh=2wqlk3FoOWR4UDQ81kzx9ZBWPR36AUFuzAILpZcKzCo=;
	h=Content-Type:Date:Message-Id:To:Cc:Subject:From:References:
	 In-Reply-To:MIME-Version; b=f0umUyn5GL2/m3DsKFIGXSYQdk9mA/XDtZgPW94jwOKmcH5a62bQTZnO23T5/QnHph3Q8ky0DFaPhneYIJZpaF+FfTx3YNn8Yuw0FnuOnyh2c3rdi8FxSUJ8chm3+KlVs4YWdwZ8HAbm9mHc5ma7GEeyDF5bN/EcYjH3QmXuLwQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=YAJN0d6f; arc=fail smtp.client-ip=52.102.164.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="YAJN0d6f"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t6GAsVI4Ey7DRqC7b3yrLm/DRS+7c1GCo+SPE4toZVKiFqdW+EAPLkynQsoPxz28GMglDv1b5soo6i4xwyWmdPrpILGiflfcs8FIzOngxs9wwHgz6vsuAs57FmPitJOjsk1lr3lM4uPyrVr+QRlZtn8E+4gkiHLRFw4+8vreC9D4TQE/uRpaCrwBxNNmzXdNZURHmGq0Rzhaq+gr4+niwovPkaDcNkhMzER6gWhqU8Ea5zCbXIMmPSXEd6B7wqP3E9+IBSpzy3/0fMhJhTYmaICZMHDv8fklG/+5ToQnYladsFSePy9Ttxd12UE2nhp+uUwHjCWsCTrIli44UdJFkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bCK142R43ra7XoAbEguRs7EsKlYB2q7GLoZEEv5zvMU=;
 b=eJ1JW05565fIKdggheTtiBo1ZAfvsuvK0cvC/Lyt0dRIqK9NvPy/TaO8fZEeHdn9WchRJZjLCuQGXSuR8NoNMfDE0oj+j57ZDF5zpQO6ZR8BR/TGFXav2rxcsPyODLsyruP8TL3ebUc0vZQFLbM710XN8C18XnJ81M14n6ccE5/oQmdzrBzZbzztLmT4PJ3Tv3vizo5OHRspMu+2RuCnxsUJPqLnZymQlrwq9L9JHZx3cmxqbBh2Py2h6wlEEjSqpwQl3+2YDpc8/T8rYiy5EmpyqliYOGcu0dhbGk7McpyiZ6ffjwufiWiExgkxbAQeIYnV4e0R5yK12ouZTSKPUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bCK142R43ra7XoAbEguRs7EsKlYB2q7GLoZEEv5zvMU=;
 b=YAJN0d6f8YLnxEyrPR4Jxqr1KOBbNw8RO4OCZFgnrkpmTYDxaWh5uxEyqKXUxjum1NZg6QDzZuAxsJlUSRak66sz1LEjfSubH1dsRybU6aiZCTs0e3BWFNUF1/E8USt2FR/ccx0T4j37nLvkeEp5l5uYjruR/H5ApjfnhYhY45I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO2P265MB5602.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:25d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Sun, 5 Apr
 2026 23:17:27 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.20.9769.016; Sun, 5 Apr 2026
 23:17:27 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 06 Apr 2026 00:17:26 +0100
Message-Id: <DHLLS33FVZLN.1DDODF8SGXWEU@garyguo.net>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Gary Guo" <gary@kernel.org>
Cc: "Gary Guo" <gary@garyguo.net>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun
 Feng" <boqun@kernel.org>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH 0/8] I/O type generalization and projection
From: "Gary Guo" <gary@garyguo.net>
X-Mailer: aerc 0.21.0
References: <20260323153807.1360705-1-gary@kernel.org>
 <DHLB8H63S0R6.1RP67M1C8S5G4@nvidia.com>
In-Reply-To: <DHLB8H63S0R6.1RP67M1C8S5G4@nvidia.com>
X-ClientProxiedBy: LO4P265CA0211.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:33a::7) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO2P265MB5602:EE_
X-MS-Office365-Filtering-Correlation-Id: bf3a6bb1-f333-485e-2fa0-08de936980a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|10070799003|376014|1800799024|7416014|13003099007|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eW4yMkwrK1N3ME9BUnR6TzFmWjZqdGxhZld6dHkvUkRGOURSa1RYRVRna0tB?=
 =?utf-8?B?NGFtK1JDd0ovcENSS1hacE13UFY0b2JMVHJoZVNHSUFZUWJLVm1saGRkREFh?=
 =?utf-8?B?bFVTcXNBZVJwQ2tjUVBkSW9qV1NEM0x4YkRIK0FseCs0YnFJMUIwRFl2TkZJ?=
 =?utf-8?B?SzMxZDNua0pLd3ZHc1Rtc0pBQ3ZiYTh5SkhGQXBmdWVSWEFQaXJjTCtYZDcw?=
 =?utf-8?B?a2lVSktGcVg0ZXVQOEsra0hlV0RzMWpXclJPVjMxWWgyb29IWlZ3ME50VVJM?=
 =?utf-8?B?bm9BM2pTME1kcmI2ekM5TDFucktIMksvT1Q3VmxEUTlwMU91aTJ1dSt6VUhC?=
 =?utf-8?B?WE1HcmxQVGJpNHFabTV2djJRL3VwL2VaVm4vR3hxNERTaG91bGxYd0NEazhu?=
 =?utf-8?B?VHdTVkdkVTFxNFRFZ1d1SzYwdnhEL3Bjd3dQZ3JKbDMvK0RJcVVvZ1JnUmRT?=
 =?utf-8?B?dEdmZzR3THRFOThwejRYK0paSXloaFBZdnNOUmRqYXE5a0h1TmJSUUF3czNM?=
 =?utf-8?B?NkRaajVVektZeGJUdVVIWmhWbVRjT2dhZlRlTHExakozWXlFenBBTHIrVGFU?=
 =?utf-8?B?SXRqWTZQVG9RTCtFWXFHbExvL1RjaFJtTlRpTGFXdk5KNnlxa01kZGM5am8r?=
 =?utf-8?B?TERHeGNFWmprYkVaVjZ4QkZFZkQ5RmRQR0NleVlHREhjMlJTVVYzU3ZhVlFp?=
 =?utf-8?B?OEUreWZsWG12RWxWSEVyZGF4UmtGU1kwaEQ4WGwvQkE5QXA3NFM2emMwRDFw?=
 =?utf-8?B?ekFBMTZyUHpqWGQ5d1Q5djBrOHhIaHRFaDVIVWlVcnFYdXZsVWlwYkZLN3ZT?=
 =?utf-8?B?MmNHK0IrN0FjV3JlOHVTNm8vYWRTQWVrVmtIR0JLcmhMZEhnNHcwRHpLc3BI?=
 =?utf-8?B?YytERG5WZkt6U0xTaUpZYXo0Q1huc2VGT29lSUpmTytWd25yUVhnMmdIQS9T?=
 =?utf-8?B?cWNDK0JDamlubnlQYlg5UDR0SkJhekQrNytyZEZ1eXlrOE1FUUF2bnBrUkNj?=
 =?utf-8?B?NC8zcDRXbjF3S0d0cEhTUlZpdnVYQS9HTXJvYXE5WjhrZ08zbDIybjB0MmNQ?=
 =?utf-8?B?VHk5cTVYMDN2Ri8veFpWRnlsblAzR2ZGZm5rRnl0dTNEcHdJRFNBRDBBV283?=
 =?utf-8?B?aytUby96M2xKWEdxSGdUSFl4NG0raDVXUjk1ZCs1dnlFSmhCTWQ3cTFmWTRp?=
 =?utf-8?B?bk92cTA3R0tDMCtUNUJ3aDVJWHptYXRLeHdteWJXYXNpdHNMUFZvbDNRTVFi?=
 =?utf-8?B?SDBDRnkvaUh0NmlVblI3VUFLRktOLzNNQ1RzQ29oUG82QjBvZXVCNjkwaFo2?=
 =?utf-8?B?Q0J3NlJDOHFWYkNLaHgyVzc0ZngvUUFxeE1jRFZ5em5wNW0yTWE5VVdRS3Ja?=
 =?utf-8?B?cDg5V3dCSEJXN0hmT0QvYng5RGFsdHlEbWFCaTVkZW1Ea3dweHUzU215RDBF?=
 =?utf-8?B?Z0xvNG9NM0RSaXl5Y09SY0hYWGZ3ak1kcDNVQWpaNEtHYS9qbElDZTJ4RFp2?=
 =?utf-8?B?NjNJWFJOeTJxWENBZ1cxTXBRd3VKMHFKbUs0WFhFNERnZzJQTWtGWXkrTW51?=
 =?utf-8?B?QVphK1IxMVJtUTg0U0pyUzVOUFYzaDFjcytqTno0Zmg2QnVvU2lML3R0dC9H?=
 =?utf-8?B?ZkZDdDkwS3VvMTMvU3JGY1NyOHpTdnlEeXhjalI0UjBRNXBQV3JITFhBZFRM?=
 =?utf-8?B?dmZFYlFnWWNWODhJdmVweDgrQ2xmYmwxN2pHUFVSTld4WHdJb1Z0RjhjeW9K?=
 =?utf-8?Q?54sAxJhrufe9Igyv9E=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:9;SRV:;IPV:NLI;SFV:SPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:OSPM;SFS:(13230040)(366016)(10070799003)(376014)(1800799024)(7416014)(13003099007)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1501;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UmNrVmZ6UjIwV0hIWFRkY1c5Y0RwSHdCSXR0QTdyTW1lMmNRTzlTcCtWUm5q?=
 =?utf-8?B?b2ZtRm9HM09sek1DdUZDeHFoQmpHODNtMFVVRnVqajh1bThyK3NvRklPcmI3?=
 =?utf-8?B?djJ2aUJXa1oxakVCWmxKWHZSVHZqemVSUkQ5SFZUakRlazcwc1RyR1JZOEtz?=
 =?utf-8?B?NWt2elBMK0Q5d3ZER092N3N5cHMxcmdYTTBzaDlaV1FQRzc0YzlPWVNQSGsy?=
 =?utf-8?B?cnROblZJOTFDUGhTQmV0S2lDUmlFVE15RE0xRFZmTFpoamdkeERsOGJIaVZR?=
 =?utf-8?B?QVV4Wk1Lb0xxQm0vZ0tURnpPYWtjSWRBeFdXOFRkTXdMUHJiYm5xek00T0xT?=
 =?utf-8?B?VGpmL2d0cXRKemlkZCtKOCthNmQ1SWtoSklJcjMzR2ZZczU1RVhTaWRSdkJv?=
 =?utf-8?B?cWpqNklCeWR1ODJBZS8vS3JqcUl3OXlCK2o3OGNaSlZMSVlTa3MzRW1zWTdQ?=
 =?utf-8?B?d0hOWXBkQmYxNDVlZENOc1l4Zk9GMHZodVRLWHEwVzUwNjVaWkF2YVlxQ3NV?=
 =?utf-8?B?N3ZJZ1lDeHN3dUZoUnh3V3V4NUFtR1RTRlNOUnZtbVBLTFFIam9SanJmZFN6?=
 =?utf-8?B?TVVWZDlCNGpsVXZYMmJDVXlkd0k0MnRYNFNDSkxodGdEbUhqcU1LQjdLTndQ?=
 =?utf-8?B?bFJrZkVYVXF5ZlE2UlR3RUVZc0x4N0F1Ty9ZVU1hZjNJQWtUd1VXQ3dHcmZB?=
 =?utf-8?B?cDBuVkpWQWVqRms0M2lKQUtTU2IvT2VMRXRyQlVBRXBwWDI1RDh0SFNOMHFr?=
 =?utf-8?B?RlRnMFk3aVFoRHNHSFA2Tktqa2dZek1mZUpsZVkyNXJZTXhhOVB4ODBzWG1K?=
 =?utf-8?B?R3BTMVRhVFNOWFk5Z0I0eC9tMFJqQXNONnFjd3EwbFZ0b1ZtdG4xSjlzY3cz?=
 =?utf-8?B?blo2WkJFUnYzSVM1UG53Lzk5SXhmVWFINUdkcktPYldsRmszSlkwMHZidXZL?=
 =?utf-8?B?bDhMb1grUlU1d295ZS84ZFhWZzgwaWZFWDFmbkdCLzhzd2pEbloyeVZwUWl0?=
 =?utf-8?B?amhFV2NXQlBmdUNpS0hER0R0MWJ1Ny9mRHo2OXBTYmRRdkRid0d5bnhZU0l5?=
 =?utf-8?B?WXVKS29jK2dQaTVNb3RGYzg1R29SRWJNbDlaM05aSldHazZCTVVmRkRsSjFC?=
 =?utf-8?B?bnY5b0VFa1ZYM2pacWVocmN4TFRXUTJ1MUd6ZXU2Nkg1UmtJMnpXNEZoQktt?=
 =?utf-8?B?ZWQ1WWhCM0swcDVKRjR4V3pKQUlnV1pMaTRKNnVtb3gybWNQbkhBS2hUY3NM?=
 =?utf-8?B?TUltbC8wcWpBVHBFMXZQWXV0MUIrZHZKemhOQUlTa2xRRWlqbXc2VGRueEkw?=
 =?utf-8?B?WWVxU0FDRjhGVm1JMVAvMWRQQkJPN2hlV3g0UGZBeHg3UmpVM1hpRkxsWldp?=
 =?utf-8?B?Zm1MQk43QXBBcmlKYVVUdnh3K24vTVdZVFVPWFRXbldrdytLRTY4dG1LWXpO?=
 =?utf-8?B?QjBFWnJ4b1NIOVJHcStybnN3MXJrU01aRjBReVlyZHZudXR6VlFLSHp3MVBw?=
 =?utf-8?B?OURqd0tUNHZZSVR3ZDdTSFRmY3pVSzArU1VOYUtCdDF5V1dwQzJQVjFqYk53?=
 =?utf-8?B?aThsbUtxUWdkdnRoZk1lZStzMUQvMEl5U3hTdFlmTG1LZHRLUDBsaDRuWkFG?=
 =?utf-8?B?d2FKUWZLQk5YQ1hFYTM5ditoWE44ejVKOGVzcnE3M3Rpc28vOVRXL3RMV0RX?=
 =?utf-8?B?TmNOT3ZaV2lzUm1pQWdhQWtnaHE3dzhPa1E0WGdlS3h3azFDamJKZ0gvdWdO?=
 =?utf-8?B?end1bnFaWXlZSXZvVHZvSTAzOGtFeHJuUGZ2Q3RpYkxrZEJsdjlIcjhjMFhW?=
 =?utf-8?B?b0syMlZkcE9jcmg5SWpNSFc3SE9hQjI1UHhqQjVPZFVTYXBrNnVFTWpoOFFy?=
 =?utf-8?B?NEdZZ3B6UmZrZ3dlbmU2TTNCYTlEQlgxOHlUeFdqL0N1dEFBdm1peUsrY3Uw?=
 =?utf-8?B?S2Q0akpCSzFPMHROdXVvWDRjeTN0dnZJWkJvVHVPWWdtbERlMFpTTWxvV0Nl?=
 =?utf-8?B?VnpjUW1HMEE4ZUNLRVJaa3JXYWg2b3RmRi8yRml0ckwrbmtENFlBM0RGd3lI?=
 =?utf-8?B?aWRkN0lpRkNzYlZVcC9QWE43MU1TaUlTSGxNV1Mvb2x3Q0lUcVhVaGtYdEVS?=
 =?utf-8?B?NjFpVHNhdnE3RDlIRmFIYzBOcG1FZmFDVUU4M0NSRUgwK09HRnZqcjNFTWtk?=
 =?utf-8?B?WFhsQmNFQVhOMGFlMGU3eWorZURkQWRWN1dPNXdUclV1anJ4RDd3aUZSMWt3?=
 =?utf-8?B?eG1FYlFZM0Q3RzZFeHNnYkhMbG94MFpCcU1tQmJDWHQxNnhBeUlUSkRLN3VZ?=
 =?utf-8?B?RnNWRXphdG9WaHJabXc4NlY3dVZtRThmZkJpQWg3Z0UyK0V0NkZNR09hRTlM?=
 =?utf-8?Q?3YzdhJYEBjLo0YDPvppwTwQavsZMo1HUB8QJwiutoHhko?=
X-MS-Exchange-AntiSpam-MessageData-1:
	kgV3wMS9mLveYY+66RRcaT91ZGsEllIrnusS6yvwkjj0LCFaVDbySI56QGn3J6DSUGqoETSpNZ8nSAPKklOnVAi21rRClPC2gu4=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: bf3a6bb1-f333-485e-2fa0-08de936980a0
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Apr 2026 23:17:27.2708
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SL8CoTafj1w3G2L7UEjU/rX0NnKm3bXioX1bn5BRuIIV08fNXPQ64wX+kMPjQqP8fWEZW/gq0CkcZFPHb7H9tw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P265MB5602

On Sun Apr 5, 2026 at 4:01 PM BST, Alexandre Courbot wrote:
> On Tue Mar 24, 2026 at 12:37 AM JST, Gary Guo wrote:
>> From: Gary Guo <gary@garyguo.net>
>>
>> This series generalize `Mmio`/`MmioRaw` type from just an untyped region
>> to typed representations (so `MmioRaw<T>` is `__iomem *T`). This allows
>> us to remove the `IoKnownSize` trait; the information is sourced from
>> just the pointer from the `KnownSize` trait instead.
>>
>> This enables us to implement `Io` trait for `Coherent<T>`, enabling
>> unified handling of MMIO and DMA coherent memory. It also paves the way
>> to uniformly support shared system memory, which Tyr will likely need
>> [1].
>>
>> Built on this generalization, this series also add a `io::View` type
>> which represents a subview of a bigger I/O region, and a `io_project!()`
>> macro that provides a safe way to perform this. Some Nova code has been
>> converted in this series to demonstrate cleanups possible with this
>> addition.
>>
>> This series depend on the Coherent API rework series [2].
>>
>> Link: https://rust-for-linux.zulipchat.com/#narrow/channel/288089-Genera=
l/topic/Generic.20I.2FO.20backends/near/572377073 [1]
>> Link: https://lore.kernel.org/rust-for-linux/DH87CCNRR5EC.2SK3IT6N6Q8V5@=
nvidia.com/ [2]
>
> I'm getting quite a few clippy warnings when applying this series:
>
>     warning: lint `clippy::invalid_null_ptr_usage` has been renamed to `i=
nvalid_null_arguments`
>       --> ../rust/kernel/pci/io.rs:78:9
>       |
>     78 |         clippy::invalid_null_ptr_usage,
>       |         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ help: use the new name: `i=
nvalid_null_arguments`
>       |
>       =3D note: `#[warn(renamed_and_removed_lints)]` on by default
>
>     warning: lint `clippy::invalid_null_ptr_usage` has been renamed to `i=
nvalid_null_arguments`
>       --> ../rust/kernel/pci/io.rs:94:9
>       |
>     94 |         clippy::invalid_null_ptr_usage,
>       |         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ help: use the new name: `i=
nvalid_null_arguments`

Yeah, the lint was moved from clippy to rustc in later version of Rust (whi=
ch
doesn't have the false positive).

Good thing is that the false positive should be already fixed in Rust 1.85,=
 so
when I send a new version next cycle I should be able to just remove this a=
llow.

>
>     warning: macro has unnecessary safety comment
>         --> ../rust/kernel/io.rs:1045:1
>         |
>     1045 | macro_rules! io_project {
>         | ^^^^^^^^^^^^^^^^^^^^^^^^^
>         |
>     help: consider removing the safety comment
>         --> ../rust/kernel/io.rs:1034:8
>         |
>     1034 | /// // SAFETY: Instances of `MyStruct` have no uninitialized p=
ortions.
>         |        ^^^^^^^
>         =3D help: for further information visit https://rust-lang.github.=
io/rust-clippy/rust-1.94.0/index.html#unnecessary_safety_comment
>         =3D note: requested on the command line with `-W clippy::unnecess=
ary-safety-comment`

This looks like a new false positive to me. The code below it is `unsafe im=
pl`.

Best,
Gary

>
>     warning: macro has unnecessary safety comment
>         --> ../rust/kernel/io.rs:1086:1
>         |
>     1086 | macro_rules! io_read {
>         | ^^^^^^^^^^^^^^^^^^^^^^
>         |
>     help: consider removing the safety comment
>         --> ../rust/kernel/io.rs:1077:8
>         |
>     1077 | /// // SAFETY: Instances of `MyStruct` have no uninitialized p=
ortions.
>         |        ^^^^^^^
>         =3D help: for further information visit https://rust-lang.github.=
io/rust-clippy/rust-1.94.0/index.html#unnecessary_safety_comment
>
>     warning: macro has unnecessary safety comment
>         --> ../rust/kernel/io.rs:1118:1
>         |
>     1118 | macro_rules! io_write {
>         | ^^^^^^^^^^^^^^^^^^^^^^^
>         |
>     help: consider removing the safety comment
>         --> ../rust/kernel/io.rs:1109:8
>         |
>     1109 | /// // SAFETY: Instances of `MyStruct` have no uninitialized p=
ortions.
>         |        ^^^^^^^
>         =3D help: for further information visit https://rust-lang.github.=
io/rust-clippy/rust-1.94.0/index.html#unnecessary_safety_comment
>
>     warning: 5 warnings emitted


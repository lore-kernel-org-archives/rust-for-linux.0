Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012043.outbound.protection.outlook.com [40.107.209.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC4E025332E;
	Wed, 28 Jan 2026 02:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769569111; cv=fail; b=ZHgcM1UaS6TBuK3k48TpvTnBynZBOpNrnlOwFR1S2x+4sas2LLBZUJiKK2jXRNGig5ARZGEi5wMweJsnBGpunJfkFAxtbjRc42f+9A+j48FlK3mLp1wY3wdLVfGySBNXyOhMIeKNZHy0kde4YvkAZBEEqeVBf4NiZv+3ALaXD+4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769569111; c=relaxed/simple;
	bh=RNlQuuo42+g8gom2Yi8eyQyCY0OlYi2yptOYc1hP6YE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=TT4K+me8tW/qCw2W0G0f0lio0/72sThC5yxa4JzSmW3TgYe366c9ytFVmtdd9DmQGIl0IuhMflqrWkkufv02rnx0I82FCm+anFbxrsbJT0LKLuX2v1GBWkAY+S0OCossAjW1ovWiiD6jqhWpe0N4e1ABVE7cZV3amGh5SRQU+IY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=NEJEbf+L; arc=fail smtp.client-ip=40.107.209.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="NEJEbf+L"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H1ZqAeeZ7KhzK86iT/RMDr5FVttrgtp5tqNlU9J4Hzqz3gSX/KNO8iQVB/HnXwy3B4zPbriojPsIft2D1oxD4b2BDXFFX1zmTel750yo5P6VrkKldL2BN4oS5q1qd+8TMYTEDbYSV5pSDQlVLCurBD3dwIOVlcIIGX06BUJOUFr1jNef2A27Q6x9laVoSE4NeGzz8cqs6Aq0B2dEd79JA3MqFEY1Fs6TzjU2TYV0Sjl5y7MYVP6TKWhXQBej4aM9MO2YW6JXXA/C1dGdZLlaLC+S+EwmgwtAYeloHnPPl43VzEPJGoJMgN7I9OSgX+gZov9N4n9y9vTB52HtGhTP/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sfNMz5LaFoYD778gJ9lxR5tu4MB1Ce+dRCVFBuiakI0=;
 b=yyqPZQ42qksk8HJq7mku2DocCO2yPkKBjgFTW+oligHw+Q5rwGFbs5uw4qTGOotCM6E4FWkL1A9koWQLFypw0o80BWgReiv+nDCpaBOvRM2BsnaU7ny0Ro2Xw/lbZgNSKbvVzHyDydXFDD6fcpAPjEEpyGVWpIkW7k5PC2QPErQXwub/oYLGWhDjAijsY/XWZI7xFrmWCHL6lr+Pt4WPfQ8hU+K5JTm+oV4UKPDBqNxFpKMwvVsw9chvH+z1eIXWSr25t8rSj5qkoamFd4ulBd4n3tGEwC6UCDBwx5vN/EkOa3insPB8A4B5yQMufzyM4otO6YucOWWpIy1V6xF4Pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sfNMz5LaFoYD778gJ9lxR5tu4MB1Ce+dRCVFBuiakI0=;
 b=NEJEbf+L/qeNyQOX34II0Tm35IHXiGDSbItkvgDXZHqX/K78kskFroAOiUQygColZrr9n4viS4FN55JqtFQYzvGUfNRjHtslFsb9bNSGb2Z4l9sIFw4f3M2ha0z5fAuX4s2vlFss0NT0IzLWbgQSbqyq0WbGEHTgA57KLzwjqNtGcLiW9f3Q3JGYaBhe10L7Z/iRQuCJNPc96quGBIb72Kn3hFJdJ+BE8mKrh2WYTDhOIwObKgJ+hUtflJNKcuJlhc769xaiKNcXpjX6B/3kxiYHTITmxFMXuIhBfiD4PsPOcRi5xZ1uKvn1XQKLrpHpXBIde1ff9k2XUFXUzvDoiA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 LV5PR12MB9777.namprd12.prod.outlook.com (2603:10b6:408:2b7::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Wed, 28 Jan
 2026 02:58:27 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9542.010; Wed, 28 Jan 2026
 02:58:27 +0000
Message-ID: <8cb580e1-3d50-42df-9050-b4439c83465c@nvidia.com>
Date: Tue, 27 Jan 2026 18:57:56 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH FOR REFERENCE v4 7/7] gpu: nova-core: use the kernel
 `register!` macro
To: Alexandre Courbot <acourbot@nvidia.com>,
 Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>
Cc: Yury Norov <yury.norov@gmail.com>, Alistair Popple <apopple@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Edwin Peer <epeer@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>,
 Dirk Behme <dirk.behme@de.bosch.com>, Steven Price <steven.price@arm.com>,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260128-register-v4-0-aee3a33d9649@nvidia.com>
 <20260128-register-v4-7-aee3a33d9649@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <20260128-register-v4-7-aee3a33d9649@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0137.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::22) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|LV5PR12MB9777:EE_
X-MS-Office365-Filtering-Correlation-Id: a1309d63-7b45-4155-dd62-08de5e191c07
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Mnk5TmduS0dzd2tFZFNBdnFCOU8rUGhjQ2NndTBXbmpqQU8reU84Q2owSHM0?=
 =?utf-8?B?aUh2emh4Ui96RUh3bDBadk5FTllPYWQwelRDOFg3bXJPcWxJMmIvU0hoZ0hI?=
 =?utf-8?B?bDNRcGhGZWFieHpDZXl4QUc1azRIRUVpOGMrc1hMMFdtTkM5cmZiWTVlSHA1?=
 =?utf-8?B?MlVKTWdJYkNFbkZHdXAxU1Bmc09jdk1kZzN2Y2Zra0o4YVR2b2dvbitOZHJF?=
 =?utf-8?B?a2c3cGxzbExqTGQ2RFFhVHAxaUMyckQ3dWRtaGhFTDJldjhGTGtCMmhuM0hm?=
 =?utf-8?B?NHN2S0E3ZUpQdTFnWWl3bWxRenZBNmlFbUVvd0ZETER1eDZiUy9vLzRuMVEx?=
 =?utf-8?B?VnA2c3dzcVlMYmg0M1k3NVBEM2dQZDhQYmUvRWdVdFBRMGo4eCtlZndteGFL?=
 =?utf-8?B?TUlSSWtpOWZrdmJUeTFNY25Ucm9oR0NERHhFa3g3Vy9ZaTU0Tkg0QzRlTVd2?=
 =?utf-8?B?enpNMVFjVzFmWHd5b1F1KzlUM3kzQldtd09Ta2I4Q0dBcXY1Z3RDSGRDRUUx?=
 =?utf-8?B?eVAxNkdLUFpFU0locHZ4QTl4QVFvNEdJVDlmaWRFTWZob3d1TFovY0g2b0dL?=
 =?utf-8?B?ZExheHRNYWVzMGVsaHltMFI0RUN3WXpTYkhqcFhhTFkzaC9saFhWSUg0Rlpi?=
 =?utf-8?B?OHJsMG9oVGQyZkZlQkhraUc0Qk5XOW1YbGJRWVhrZ2tOOXVkL3EzNjYzd1RF?=
 =?utf-8?B?YnpDZkhxbHlIUEphbkJONldjZzdhbG4rY2FSQ29xajluQ3ZJM0dmMGtTMW5p?=
 =?utf-8?B?MW1nSE0wUkN0T2xFM0xpc1dMVHY2MHI3a2VxRGxlTEVtYkpYVTlTQWJQL3dY?=
 =?utf-8?B?WFBHajQzeHkvek1TWHhkejlMTzNvWWE3R2plZkhHTVozbDJLa1haa0pnVzR2?=
 =?utf-8?B?QU1ZVkdmZEFSL1hyVUNoL0RUQ1IvVGg4K29ET0d2c1FZZFcvUW5WT3dJWVUy?=
 =?utf-8?B?cHdBeTFzOUFDSWtFd2Q2VHdKYjNOV0hzc1I1dkw5TURCZmpWdURIUVY5NU5W?=
 =?utf-8?B?NXFFbHkreFpVVDJ5Q1VwdmhzM1h4NWJDTE1tQmlhRXV3Z2l1eTNwUHJYbzdM?=
 =?utf-8?B?Qm9ZZFNLS1kwUFYrdVhkWTUrR3NvazF5ZlE3WGFIbHJVS0VJYnplaEtQaTZu?=
 =?utf-8?B?Zm1zVnJsUEQ5UFRUZU8xMmZzakpYRXR5Uyt6RDFycm1kTWZGTGxrOGlzZ1dE?=
 =?utf-8?B?RlNBTndlQXROeUhJcUFlenZmQlJKUFozTEU5c3BNMHdOSUEySDY4R2hUM3dS?=
 =?utf-8?B?UDJ4aEhzTzFRbVgyaGFOcEVFdnUreE5VWnlDSitFR3FXSGN1eW4vMWs5Nzkr?=
 =?utf-8?B?aDVUUXdRcjVJNWZSVVcxOHFLOHhNYVlXNkJvQVdIVnpvNVAxelZJYmtva0RZ?=
 =?utf-8?B?NjA4M0ZpNWpMZUY3Q25RVkMrajRCeGRhTUpGZm12OFhQYnpQN1lPNWVCRExQ?=
 =?utf-8?B?Um5WVXRHbHlBckpIdFpCYWdIMWU5MDhSMWUreVBUVDhVenJFSTdIZFgwK011?=
 =?utf-8?B?NmNtbGozbGp2NzhubjhGZDJWaFBsalB3SjlsaDB4RDJ1SERuK0U2NnR6SzJ1?=
 =?utf-8?B?SlNqdlRlSjBhTGtzL1pJSENQK1Jqck5RSXpFaFVHR1NhckFCRmZHeUx1WHUr?=
 =?utf-8?B?TU5LUmR2YzlHcUoxbWdWZElNdG4rN01jeEZuekFGOXB0VVlZL0NuWitNTUpI?=
 =?utf-8?B?U2tpS21qZ1Rvd0Qrbjk1OEVmRjV5TmM3U1JJdVh6SXpNeUNYSkc2MENyQzIz?=
 =?utf-8?B?OUpUVHc0OGJDTFB3R0xpT2RwektFUnp5cENqYnF6Y2VsQjRjcjYvUEVGWWpC?=
 =?utf-8?B?eXVwSXBYVFZiTktPMi9tQzQwSDdnSEZzT0xaK3FYd3pYUGE2REdVUmk4dzM1?=
 =?utf-8?B?Ykw3Z2NnT2FhYUNwUU5FbWFPVXA4SG1xanpocEtLOCtrcjlVbi93a0k5UDBt?=
 =?utf-8?B?TytNbHYzMlNjSmRGRmQ0czZ1eHBHZTVwMXEyMG0rRmNjWlBkWW5FQStMQkNY?=
 =?utf-8?B?MEI5Q0VnelVXZ2JVcWdINXJNWTg0OThTa2RMMjRSZ2lUUjBsb0w3bGlkWW14?=
 =?utf-8?B?cWtGU1BzcGdHYWszL1hzc3J6STlKclRRYnlBQVVGRlB6dldtUklrNjMvbzhp?=
 =?utf-8?B?Z1VTTDlaenhvOElMSUNBekxWVVlUY2VKUlZweVNwNUtyUjJ3ZWdwNUl5RW5m?=
 =?utf-8?B?emc9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NHk4SllTL3ZVaHg5ZlV6VDg5MGIxQjFTa0R0TjJPa1ZhMHVZZjV1Qks4SUpy?=
 =?utf-8?B?ZVFWL0lHTzdDbysvTDB6b09KTFlmVDFHRTRWR1kvNWgwd3FWS3I3ZDU2RUdx?=
 =?utf-8?B?Z3NMSG9MM2JqQTMxSnhPbWNiQW1sQmNnc3NrL2N6OG4zV3NlNFQ1YnpVeVVY?=
 =?utf-8?B?bnBVSktQMmNIWjRzdFgvM1FXUit6L25DRWhNaW1RanQrcVdTbGhSY09LQ0xZ?=
 =?utf-8?B?dVdIWUVPQWQ1eDJESG5nZ1JSaGhGK1ppQXNZZTRqZDFwNUx4QjRxei84dXdS?=
 =?utf-8?B?U3NRNXhTQzZ5U2tRelFZaE4zSVdBVjBIWnZwVmwyRmo5QjhEN3NuVm8xcFl1?=
 =?utf-8?B?WVVqZXFNVnJIR1JEbUJoMFdTTWVnTUNhLzZCcy9Zd2VJUVcrcjh0ZjEzS2J0?=
 =?utf-8?B?Nmc3d0U4ZEdXMWRnUjMwNkh5VzN4Z0k2RVRDOGh5TzY3K1lYU3A1ZzVsQ3ZN?=
 =?utf-8?B?aVk0R2pZbHQxVDJPd0JnZUMyYjBrMURreDdnRzFwS1hxODZ6a1dGcnFiVUw5?=
 =?utf-8?B?TEJRbFVzN2F6V083aVVMRHNyRzNXaUdCbWpZNzNBVEl5NjJ0ZEo0dktCb3Fp?=
 =?utf-8?B?V2srY3RjUEYyUDR6QUxIUXBXQzltUmt3Q2pPOUpXMG5NN2lybkFCOThNSkZS?=
 =?utf-8?B?aytqQjRQdi9lL3Y2Ykgza1RvTWlGVjQ2OHJHbWNXSS9GQnhpTVVIMk9pTEp0?=
 =?utf-8?B?cVJuSmtxV21mWXRDOEFYbU5xMk5ieHdldWE1NEh2Mnh3MVhHV3Nta3ZTaGd4?=
 =?utf-8?B?U292Z29xU3RyUGhMUnF1aEJ4YlJWYXUyak9tYjBBZDZCZG5vUGdNV3loeWdD?=
 =?utf-8?B?M0tMWW1jbVJxZ0huK3dDeisrdVhaYzlxbldKdWdTdmxDQkcwc1g0RzBLaEdV?=
 =?utf-8?B?bzR6WFN4UnlkWVJIeHVrQ3NjUWZSN05hMENocHZnSys5Ym1jTTlEZVI3SVlO?=
 =?utf-8?B?bzJVc09GZitVTk5FYUhUcWxieC9CZGJFTFI4UTNIWWFKVDRqeEljZjF4cm1a?=
 =?utf-8?B?ajBGN0YxREowMHQ1cWt6YzZjdGlnN1BCU1ZDU1hhamhFM1lTZGRQVzZLMFR1?=
 =?utf-8?B?WFBwVm5WWkJKdU1STE03eFhLamN0cWsyYkdKRFM0M0h6aEZyNCtuRXdkTDNv?=
 =?utf-8?B?UmxiVEZncmZJakMzTTFqYzlXekxzeXVtREhaY2FvVCtEdGFsRHN2SlEzazgx?=
 =?utf-8?B?TE9aVG55OUJFWnAwMHBja2Z6REVRQlFUUytxOGlqY3RGczIzajJsaE8rcm9R?=
 =?utf-8?B?SE8wOWo4eEcybXdMdDNRaHF1NVVPbkZreUVkenNnWmlLN2VybHdHRjNKU3JB?=
 =?utf-8?B?dktlUXE2TDRhK3lrRkRWdE1jRW9ML1EyZ21xSUNwbS9Uclp6dWxycm1TR01U?=
 =?utf-8?B?YXVBT283Y1dUZnlRcVJJV3MvMDdxVEV1eU5lOUNNbUF4SEVmUUtWY0N2RE5k?=
 =?utf-8?B?R2M0Y2RPdHdrTlJvaUVDRWw3MldiRVVEODYvdm4wVVlLQ21jNHVlV0NPMTds?=
 =?utf-8?B?MGYrY01oYXJ2NVYxU056VWtCbndoalErQ0lCMWhqSFp6L0hpN0lieUg5U3l1?=
 =?utf-8?B?Q0xjY0pwZWc0eGNoRTdoYW5xSFNjY2tiUFRHZWNnWUNSaDN6ekJVZmtFayt4?=
 =?utf-8?B?QTBZckFRT3RTVVBiQ3hHNXNZSXk0Zk1iT3I0NkxPU0M2RVZUbk03UCtYRmJp?=
 =?utf-8?B?R0ZxYStiTitjVERBVVkrKzczOHhlNDVxNCsxYzRzWGJDeUZpMmhsMWl0d2xK?=
 =?utf-8?B?bUQrNGovVFhBbzZoUmx1aTlyT1phYjgvWllZbFRPaWlaaGdDOTBvODRDZDRm?=
 =?utf-8?B?TWhGSDVrUm1zT3lFTk5vUUQ5U3ZhZmo0QjVKRWsyOWRwdnNpR3Z0RVU4Wi9N?=
 =?utf-8?B?dmdxODFWb1p1dHVBckFIQTg5WCszdXh2SjhlK1BOVXgxSEpiN25pYmptb2VL?=
 =?utf-8?B?RTRLUEFpUit6WXB4M0J2cWoybVhabGZoYlp4OTloNG1hT3ZwQ2ZUeU8rdExB?=
 =?utf-8?B?OXp6cGxzdXdEOXNaejFlWTFiSW1IV3ptU2tGYlJJN0JDSkxkOGRiSkRNb2pm?=
 =?utf-8?B?cjhmczdGSFJHbVdzeFhoenFXcitGRDZITVlFbE1tTm56ZGhjTXhiM3JnQlFq?=
 =?utf-8?B?Qjk4d1FpRy9nR3dGWlljcnR5ek9zNUdyYzVqR1NlcTdJV3hiSG1YNDJ0VWRl?=
 =?utf-8?B?UDB4N21qNHowNUlONnRtYW84a1hUZ0NnMUZDQ0x6THl6bFdreUM5Q2g5a09u?=
 =?utf-8?B?UXdLaXFDdkNDYXo2Q0dqSWgxYkZ1a3YzVEVFN1A2R0NJTFpLMGRMSncyblBk?=
 =?utf-8?B?V2pWamc5QStNU054RnIyZzByUVRYQlc1aFM3bThWLzhTbSt4RjdUdz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1309d63-7b45-4155-dd62-08de5e191c07
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 02:58:27.2573
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kj190EDeWTD9E4I3hy9w66f6pVAhzCqTmf8qUvzjNOB9se0Dqz1NXztnNk2qfwNjwPoOYCaFxRvZ6YU8xYWzKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV5PR12MB9777

On 1/27/26 6:37 PM, Alexandre Courbot wrote:
> Replace the nova-core internal `register!` macro by the one defined in
> the `kernel` crate and remove our own private implementations.
> 
> Tested-by: Dirk Behme <dirk.behme@de.bosch.com>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---
>  drivers/gpu/nova-core/falcon.rs           | 175 +++----
>  drivers/gpu/nova-core/falcon/gsp.rs       |  12 +-
>  drivers/gpu/nova-core/falcon/hal/ga102.rs |  15 +-
>  drivers/gpu/nova-core/falcon/sec2.rs      |  13 +-
>  drivers/gpu/nova-core/fb/hal/ga100.rs     |  17 +-
>  drivers/gpu/nova-core/fb/hal/tu102.rs     |   2 +-
>  drivers/gpu/nova-core/gpu.rs              |  31 +-
>  drivers/gpu/nova-core/gsp/cmdq.rs         |   4 +-
>  drivers/gpu/nova-core/regs.rs             | 494 +++++++++++---------
>  drivers/gpu/nova-core/regs/macros.rs      | 739 ------------------------------
>  10 files changed, 397 insertions(+), 1105 deletions(-)

Reading through this, it does look like an across the board improvement
in readability in nova-core. Great!

thanks,
-- 
John Hubbard


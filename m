Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012062.outbound.protection.outlook.com [40.107.200.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BE32255F52;
	Mon,  9 Feb 2026 01:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770602236; cv=fail; b=REGkP5xi755fzR7/i9Cyf675kyRV7iZ3rrqrFCMf/sDRksFLIT4B5XfWwx/W/tfBLzXhyOEOCAUOCV1ak5WcprFRt9kShpI2l6j4foKxwNUEoPI+l943Wifmp38qXqvaJSAKQwCq0W/RS+x2zV4bp6Sy5kUAv0R3ldyHPCkyz4Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770602236; c=relaxed/simple;
	bh=U047WCEjHLzdw05G9EQnVgbSkD0n6HojO2ZqjkY11jg=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=YtXLcCBiLXvN9OWgkm3AO7eBY9MJG6vekPUVzaIhHxk6TtcSymj0jyA7yo8Y/ku8N1nSO60ViBZNB59qs4ZcvXh63tHs7h3aAZ5F/bubk+ExDGewzAKCd6mPoywvj6UiKVmx3onFSw3BALZosvpS5InMximKgfkW52IgRLgnGWg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=TJDbZJUe; arc=fail smtp.client-ip=40.107.200.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="TJDbZJUe"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kxR45lrUhO0bo4FkkIE+gt09g4cHWrBOkHz4u2OcPDp1TbdUCSBMjWCfLxD3Xf7FGzEmUe6jfW2q/7oLcKM1OJK3ZlCdhfYsYgz88BosfeSSPeP4JvCSnhIJNJsQv5RCUcs55TA61Tb7xT3jkrU9eYMY9QfIQ3QIKRuh+35YPUBCYCyUVCb55/ykHj3qBVouo8CTL3ZffkR9cUltcqHMcuPeI1U85vmZQFFXT2bVfP/yDrtFDu57EhVCmkPNHic0J8+Fl1TJgJwN2u0i5MDUQF9YB0dl8kfT0RTDSNQRkJtpa0Hav+Zn2a9gMpQ0X1A4O9yuPErIpEdMBrHTGFQ29Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SsLfB2u9Fk4ATvm83yTatgy35tZ2wMYwbrhM5OJWx1Q=;
 b=JGbUjmKKoNFD+XWqESoOWhcUvhvC7kHmYbIYp+sJr3zz4d6k/7vQjTBFj3h8E7D8ByCilYWCi4Dmhae/c4l6frBeeX+/nxM/hRvlQ4+Y0fK4xEQ+bbRnQlAqYfDUHp5oL+UHaOzsdxbcBfSVEiIkRS+zZCOnCSlPLoUlY2sGbCPxIdME//N0pt3TO79pjyV5HMij3NssW4sNxoSpXiemrpfXQT9f2GfECaCHarwqdNS40yzYw4t4kB9jhMib/tVxsbmrfjYcGw4dcT6JsIJVXCAvii/z24ARMSOqmqi3T4Fjg50nju0JWCtjnkZGZxcykKHGuyRWDHHwQm73cW1lJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SsLfB2u9Fk4ATvm83yTatgy35tZ2wMYwbrhM5OJWx1Q=;
 b=TJDbZJUeSb92AIHsOG9q5l0RyrmyDbOGzje7VMPN+O1ZchjhC/Yeztc2xCdUj04xMEk1UX2clbL0B0iL1mZMC0BpNup3JrGMplaZmLpOEF88mTBmIFTK0QAOFVhOLgnKMK8co1mgL7TAeY5Wfo3z1xhUYDLE6nUXA3Bh2E2aaNzceLIYQHy5pBQxiThGHCf6EILBzJHWNnnmMkdRtoBQfxnXFmiHjucPWTcAUZNt5xDhcCMawToFHiAEhQT8ScUxgbzjDOKGlv/rruY/ajAh8dFmW2rq94cNm71d3P3ImR8p6f9rX0f4dS3yqn/MBJp3l2yIQ77jmKfy5yVrWGoxbA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 CH1PPF5EBD457EF.namprd12.prod.outlook.com (2603:10b6:61f:fc00::610) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Mon, 9 Feb
 2026 01:57:10 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9587.017; Mon, 9 Feb 2026
 01:57:10 +0000
Message-ID: <e235856e-5a57-40da-92d6-7e9ac8e2dee0@nvidia.com>
Date: Sun, 8 Feb 2026 17:56:22 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 16/30] gpu: nova-core: Hopper/Blackwell: add FSP falcon
 EMEM operations
To: Timur Tabi <ttabi@nvidia.com>, Alexandre Courbot <acourbot@nvidia.com>,
 "dakr@kernel.org" <dakr@kernel.org>
Cc: "aliceryhl@google.com" <aliceryhl@google.com>,
 "lossin@kernel.org" <lossin@kernel.org>,
 "a.hindborg@kernel.org" <a.hindborg@kernel.org>,
 "boqun.feng@gmail.com" <boqun.feng@gmail.com>, Zhi Wang <zhiw@nvidia.com>,
 "simona@ffwll.ch" <simona@ffwll.ch>,
 "alex.gaynor@gmail.com" <alex.gaynor@gmail.com>,
 "ojeda@kernel.org" <ojeda@kernel.org>, "tmgross@umich.edu"
 <tmgross@umich.edu>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>,
 "bjorn3_gh@protonmail.com" <bjorn3_gh@protonmail.com>,
 Eliot Courtney <ecourtney@nvidia.com>, "airlied@gmail.com"
 <airlied@gmail.com>, Joel Fernandes <joelagnelf@nvidia.com>,
 "bhelgaas@google.com" <bhelgaas@google.com>,
 "gary@garyguo.net" <gary@garyguo.net>, Alistair Popple <apopple@nvidia.com>
References: <20260206042123.303281-1-jhubbard@nvidia.com>
 <20260206042123.303281-17-jhubbard@nvidia.com>
 <54c65bad972e792a4e8c27b79d3c0b58596f5ab0.camel@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <54c65bad972e792a4e8c27b79d3c0b58596f5ab0.camel@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0280.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::15) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|CH1PPF5EBD457EF:EE_
X-MS-Office365-Filtering-Correlation-Id: 53f21cf0-aca8-482a-9b8d-08de677e8913
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|10070799003|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NWE3NDZHWlF3amNjb1RrOWcySnNEa0NFVUNxT3Ivb3hrMzVodXVIMTZRZ281?=
 =?utf-8?B?bzBlV3orZTVvSDRmbTB4dVNUektVUUZoLzREcURWbWkybmRqMXFjenp1bjJF?=
 =?utf-8?B?bXdZMzJ5NVlYSVJxSEpQVXd5OEhRZzBHVi9OWndlYjhmSHRsdklmSTRmQkNF?=
 =?utf-8?B?aVZOV01KZThsZVRTRUtFaG1qKzh5TFhFdDVNVmdMaS8vTFVoRWxvY0V3TUZQ?=
 =?utf-8?B?cEV6RGk5a29rSFdNTlRUMlhmelZuOC9ZUGp5NWJSKzRkcjU5d3N0dEFNRlJZ?=
 =?utf-8?B?OXpBZFZnY2xCNkFEOU1WMG1BaEprNlpKaFRjbTh1aDV3WnJCRnB2ekZrWTY1?=
 =?utf-8?B?VWhvQ3BNYTNMNDRELzVzbGdOb3UxT0JiekNpaE5haVRIa1dwUERIT1VkbHdJ?=
 =?utf-8?B?OTJFRGpWWVlmL2tPUTRyY2pmbDFaZGxJYW5RV21Ld1ppKytHaVp4MlFNR29N?=
 =?utf-8?B?ZjFVMEtUbXZkRTNoQis4TXpwL1pLSGNQQUdyOWQ0Q0FSSHFKTUpGQjdHV1My?=
 =?utf-8?B?ay9mZWdFajNidmJWdGNiQjk1WUErcHVtTnE4c292dnltcFI1VXk3T1g1ejh4?=
 =?utf-8?B?WjJoeGl4UEtoSmFXOXdGUjQwSWJVRHBFY1VBVGhubW9PNDdCQm9HOUZLM1BF?=
 =?utf-8?B?NHZFYk9kbTNpa3NacStvbTNpQVlUcmJMK2JDcGVNak5yYmQzbys0dit2S3Rw?=
 =?utf-8?B?UCtyTENjTG1tY3FEVVlONlJOZEJVb2kwNi8rYTQwbDdvTkR1Mjc4dFVYcXBF?=
 =?utf-8?B?N3VJdStnbTh1VGJOZlI0M2pkMVorV2V0TmozZzUrU1FOQWtuc3BVbDdhMm1u?=
 =?utf-8?B?QzRlWjE3OVVyRlZjazNhbFpTVVZNWXZid0thR3B0YTFmNEtadEZ4VHQvSjhQ?=
 =?utf-8?B?dVMxcm1WY050bXZSODNLTG9jYUM4dHRIVit1STkwcVVta1dWTnNCTkFGL1hS?=
 =?utf-8?B?SVA1aGZ0ZTJmZGxFeVQyQjFyL3VINTl4SzVveG1sRGUvVzhqeVNHWjBUS2lP?=
 =?utf-8?B?OXJHMGZPcEFGbkUyM3dGQ2VWajM4dDhyU1pJanFSRTdBUFh0TC9Bc1hHWWRD?=
 =?utf-8?B?bGw4MVBJK1QxTVJwUE83OElWelZjMXZzUmcvYVBSS3FBLzlBVFhwQ05TTVBB?=
 =?utf-8?B?SkU5QWVVNmpWMThlL3NmWGNBa0owRERsSEtmcEtTY1FlRkpHWHF0bjhheUhV?=
 =?utf-8?B?WStXV21GdGpOcmxmdmp0ZG9ZbjNhK2JTZWg1NlZWanVFRWx4ekgyR091V2t1?=
 =?utf-8?B?Si9BaXJjWitZQnFhc1R4YTBJQXJSMTJpM3pyaktYcG9TcHZ4eTh3RENSS1ZE?=
 =?utf-8?B?Wi9GMlR3UkN5dUVlWGVVejI1WGR2R3FadkRtT1ovdGJzWnBxSHFtT3pZdld3?=
 =?utf-8?B?QmFBR01oMW9FTWR1WTc2R3NJREdKVW9nbE1CMHJqUEVHbWNzbkZ1dXYzNmVm?=
 =?utf-8?B?Z21saTFrMEE3emdIS1luMndYeTFWbFA5b3J2cVRpSVk3cVhwN1NTRmFaRDNR?=
 =?utf-8?B?Kys2MldZbUh2ckRsa0h1MWt4ckxMM2dGbElaQk9Kd01RZ1BITXEwQVUxSkNq?=
 =?utf-8?B?KzVFMEQrVGljcXorMW94ZGdpa2wyUW1aTmZTWGxpbWEyT3pLamowS0UyQXNF?=
 =?utf-8?B?NUMyM1pObVc2eTdqKzNhL2FobFdFNHhzL3J4cC9QVVRkYUdDUVdRUFd6QTRw?=
 =?utf-8?B?R3A0eWhRMTRWT2xLeldETERoRXVMT2o4V21HQzRkRkdjQTJabXJLSENmVG9S?=
 =?utf-8?B?UjZNbHNiZW5DTlZndHEvMDFnWGFnb2RFV2lJUml5ZGJiQlpDdDdRbHdQeDYz?=
 =?utf-8?B?aDRNKzBrWmFjaWZrR2xwQ0JtckZQYjlXd0NROXVUUjgwT3lRQVZwZ2dMc0ZY?=
 =?utf-8?B?b0lBbVpZcEY0VTM0Vm50TGNWQ09rcmhFbU92QVZJYU9hcER4VWFYT2tQSDRn?=
 =?utf-8?B?SGZ3Nk9vNk1YWENWbHpwditDVEh3MzVMOGZBVUJtVnY5RU52SW9WVDBuVFBx?=
 =?utf-8?B?STYxVG54Ly9xamozM0FCbmlHdnNYRFdEb0lEWkZ1Z1RFY2hXdkhQTU0vSUdq?=
 =?utf-8?B?SHRsNmVNVnFLenFPQzlyTXBobnNDV1Q2QlE1LzRCZllYQ3lQb3V1OGFJSk1R?=
 =?utf-8?Q?QkDs=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(10070799003)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Ymo4d2xaNmovay9EZVdRbXFkUjNDNG5DTXlKaWVkbURybVdrZStwdEh1Ty8r?=
 =?utf-8?B?cDVEQ2d2RkpWSmgrbUpDUjRYcFZUeGZQS0ZmdDIvNm4vdnZIUTBrbCtleU1t?=
 =?utf-8?B?QldQNU1MQk5TYjhLN2tJUlhaR1NUa09nMzhEV25CUCtEWVRndzM1VEcra2Ny?=
 =?utf-8?B?MDdjb3dheWtOZG9UUkY0bnZoeDVFOUVTUy9YLzBPYlN2VUQvTjgramNkQ2xi?=
 =?utf-8?B?U0QxQzlwcVlHTU9YNER6MW5ZQ1pEZytWS04rcnF6Vmw0N3luSklBK1UzYzFN?=
 =?utf-8?B?V2lid0I3cE5kMjF6bitqRjhoRlpjYmpLRVZ4b0VyWDhETnBYZDhTZ0piek9s?=
 =?utf-8?B?TlNYMFppeU5aYXdZQlo3Wm85UDRnd2UzeGo4ZHVEU205aURQNWdDNExPTC9W?=
 =?utf-8?B?QXBGS3lzN05kbzNxZXVTTjNrK1dtWUdkRGVqVWlvZkI1QU42N2dnb3JpWHNU?=
 =?utf-8?B?dVpXWTVqVkluYWxod3ZkcXh0L1c1d0V2RWFhbXVRMmlaZnc5eGo4U2J6VGt3?=
 =?utf-8?B?RXM4dk1Ick9uemJWRkQ4OHdPczZ2MjEvbVNHZlNCRXRDOThjQjZGSHgvZS8z?=
 =?utf-8?B?YTVPYnMvM0ZRMGNEbGpGVHZuZEovUGpaSU1TMDlYQkpCSXJwdjF2WjZzV1Vv?=
 =?utf-8?B?QnlxTXNTMjNDRWk3OVBLOFdyWE1IcERuL2RXQURyanJrbFI5SXp4eUMrYWpk?=
 =?utf-8?B?WEJ5c0hUVXhJWUJEMG5sZ2lLQjZSVFNDMnRDZFQzTkR4dDVFRUtwNmNWMmgr?=
 =?utf-8?B?UmxOZEFzTXlwN3RINnhibm9oeHZWaHVlQTFwU2p6WEpBdVVkSmZXK0FHd1hB?=
 =?utf-8?B?K0w2NEJoR2VuSXBlTmp0TXhSQVZhSDdWbElGZk5kVEVMTTd6cmdOdW1oV0dh?=
 =?utf-8?B?cVkvRDE5VXVyN2Vkekt2dThQak1pVUJ6d0IzRSs0ZlZXSzJVdTV1RFAwNGhF?=
 =?utf-8?B?QUp4UDNhRE5rMzBwSyt6UnNyTGQrNnQ1dDE0RW00ZTJVK08yazcxUTRjVDhI?=
 =?utf-8?B?MUVlTnltMkNVK0t2UlBiOEZwWHhObnRLb2hPQzRYTmhPQUhMM1pRVFZKTFZS?=
 =?utf-8?B?b21oNWM1M1FFL3dKNTdqVzY4UEpWZjJyT1hieDZ5ZlhNcE45RWFQQ3RqWUVm?=
 =?utf-8?B?LythQXdIa0dOOHAxTTZ1cUtsN2lrS2J6VEJFMUNmdHVFT2ZKeEEwaVJ3RVBE?=
 =?utf-8?B?b3JQOUQvdWpmV2tOeW5nVW8zbHc2WFgvbkVmUWNVbWJvYW81dWgwZThBQVhr?=
 =?utf-8?B?N3d2Q2NDdDU3YndieUpqdURhdlNudmhoWHoyVmhpY29oZFRVQlZIV1EzOTBK?=
 =?utf-8?B?SlBGUTRYOFN2eWNQU3NVYUp5WVh0SU1QbnM3T0NHYmxZdkhqUmdUaEpXM3JI?=
 =?utf-8?B?T2x6d25lZkZaZ0RZbGlhSjhYTHVaQnlhOFBuOVM1aG9EcmlobEZEWmt5V1hP?=
 =?utf-8?B?bDREZlJPVEtsUUxlSjhzNldSbzc1VTFOT0NJS1NNSWlUMUdtcnVoVCthMjFt?=
 =?utf-8?B?OTF1anEvb0oyb3hxWWQ1OWZmWWxlMWlUa0FZT0VPR0s1OUZPd2UreWMrdWZw?=
 =?utf-8?B?bXJVZkdsRUc2bXJsVzBYUDlyVmxNZ0ZCK0VHcDdRNytpTXYraTFUcS9LYzdF?=
 =?utf-8?B?aU1LRW5qWGJXVDd1WWpRRmdOTlZVeDNUWGhEd3NQSFpRK0Z2VFlHc09pSXlr?=
 =?utf-8?B?UTVSQ29sRXRRWlhkVGZ2QThDR0NWdFcxZmg4aGJCSDNkaUtzTzhsTW1TaW9U?=
 =?utf-8?B?Z24xa1ZZNnF5aERTZS85aUkvb3NCVnJIUzdOV3ZyTk4zUXN4TVQ2YjVvVWpK?=
 =?utf-8?B?Tkd4c21qQVZDSmRVc3Bud0ExclB2LzM4UXkzQWw0Z0x5NUg5dmpTRHdTQWNi?=
 =?utf-8?B?YXVyK3VxbGE0UGlzeHIvdURNVzhUb1JYNElJRmV5cldtNUxKcFJLQk1lY256?=
 =?utf-8?B?VzZBUFZoY0xCQXhucEQvMGVRVWF6bzVKemRKWkpiY3ZiN3MyczQ5OWxXM0Qv?=
 =?utf-8?B?Q25KaUk4b05rSHRWWk1YL21SVFlGLzk3MFExelVBOVdpMHpTZ3dPT2s5NG0r?=
 =?utf-8?B?NXRKS0REOG4zUmxOV29DNXpIK2tsMWNZMDZEM1B1OU5JWmR3NXdwdTJMTGNY?=
 =?utf-8?B?NkkzSzZHS0RDeGdYeWl5TmljeE9NeXFvWUhPSXlHRWtacFRGdCs4MFY2Zm1q?=
 =?utf-8?B?MDVKWW1jNGtSUElnNDlQNWFnaVlhUTRJVHB2RzgwYjR0QzBNaWJFSXhETHNR?=
 =?utf-8?B?dDlMREFMTVBrekVFRURBVnNnUU1vdXNpcUNOdm9Hbm4rZEYreFZ1VDVpTXlU?=
 =?utf-8?B?dU5vNEt3UXdDSEQrd2t6SlFBT3dwbFRpdVAvcHhIMjNJVkZKWDFxdndGYUgw?=
 =?utf-8?Q?8W1IsRGDSyJE80rQ=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53f21cf0-aca8-482a-9b8d-08de677e8913
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2026 01:57:09.8062
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /9UIGsISXBWKMCrKT0IOk/yyXbvybW4ot9dzmrsPXkTZiTUsy3iOWZsfc8DMP0cq8yQPwflM0SreCZ0KQeendw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PPF5EBD457EF

On 2/6/26 10:07 AM, Timur Tabi wrote:
> On Thu, 2026-02-05 at 20:21 -0800, John Hubbard wrote:
>> +/// EMEM control register bit 24: write mode.
>> +const EMEM_CTL_WRITE: u32 = 1 << 24;
>> +/// EMEM control register bit 25: read mode.
>> +const EMEM_CTL_READ: u32 = 1 << 25;
>> +
> 
> Shouldn't these be bits in the NV_PFALCON_FALCON_EMEM_CTL register instead?

Yes you are right. I've fixed it up for v3 like this:

diff --git a/drivers/gpu/nova-core/falcon/fsp.rs b/drivers/gpu/nova-core/falcon/fsp.rs
index 5152c2f1ed26..fb1c8c89d2ff 100644
--- a/drivers/gpu/nova-core/falcon/fsp.rs
+++ b/drivers/gpu/nova-core/falcon/fsp.rs
@@ -21,11 +21,6 @@
      },
  };
  
-/// EMEM control register bit 24: write mode.
-const EMEM_CTL_WRITE: u32 = 1 << 24;
-/// EMEM control register bit 25: read mode.
-const EMEM_CTL_READ: u32 = 1 << 25;
-
  /// Type specifying the `Fsp` falcon engine. Cannot be instantiated.
  pub(crate) struct Fsp(());
  
@@ -54,7 +49,8 @@ pub(crate) fn write_emem(&self, bar: &Bar0, offset: u32, data: &[u8]) -> Result
          }
  
          regs::NV_PFALCON_FALCON_EMEM_CTL::default()
-            .set_value(EMEM_CTL_WRITE | offset)
+            .set_wr_mode(true)
+            .set_offset(offset)
              .write(bar, &Fsp::ID);
  
          for chunk in data.chunks_exact(4) {
@@ -78,7 +74,8 @@ pub(crate) fn read_emem(&self, bar: &Bar0, offset: u32, data: &mut [u8]) -> Resu
          }
  
          regs::NV_PFALCON_FALCON_EMEM_CTL::default()
-            .set_value(EMEM_CTL_READ | offset)
+            .set_rd_mode(true)
+            .set_offset(offset)
              .write(bar, &Fsp::ID);
  
          for chunk in data.chunks_exact_mut(4) {
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index 30a5a49edeab..a9a65f98d8a3 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -434,7 +434,9 @@ pub(crate) fn reset_engine<E: FalconEngine>(bar: &Bar0) {
  // GP102 EMEM PIO registers (used by FSP for Hopper/Blackwell)
  // These registers provide falcon external memory communication interface
  register!(NV_PFALCON_FALCON_EMEM_CTL @ PFalconBase[0x00000ac0] {
-    31:0    value as u32;       // EMEM control register
+    23:0    offset as u32;      // EMEM byte offset (must be 4-byte aligned)
+    24:24   wr_mode as bool;    // Write mode
+    25:25   rd_mode as bool;    // Read mode
  });


thanks,
-- 
John Hubbard


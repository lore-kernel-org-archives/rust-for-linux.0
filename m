Received: from CWXP265CU008.outbound.protection.outlook.com (mail-ukwestazon11020128.outbound.protection.outlook.com [52.101.195.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B883744A706;
	Tue, 20 Jan 2026 15:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.195.128
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768921297; cv=fail; b=hX5A0SB8JzAeQn8konPduUh98nkoVmvPFR42ZfCd5ZJYc8r2PKQyjiDEaH8/lWt42dSO3F2Zx6AhZdRZjnSZG+ESDRm+5epFxMWchVZMdpARfzADYMePdGhi8np3NgffRsQBYUuZ6z05/w5ya0YMlbDRApo0EnV6DTcz5YNhpPE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768921297; c=relaxed/simple;
	bh=pH5kd+GSY34yH8pUf1eugUk+M3hAnoyBbtHAHZeQNw0=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=cAVi0cC5T0WDXbJR7GixAMcS1h8SiHcqbnTrp2UGzNo+DWR5BhYGU0cRoJ5MxO6CyVt7JkdZKwNDhRNwXbMdadUThSSKpiaFezcIGP2L26PTC9O1weHZSUiWAVJhiDboZi8ghTLzFWzVw4M16hyiqn2yqTGDqYthm+ryJGrsfIM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=sBYaomsH; arc=fail smtp.client-ip=52.101.195.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="sBYaomsH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z631wEOk6rrxLFQFY2pdEAExIHt+6s8MXce5X8mWkz0EyRmlQ4miGbzrzNoktYaUBV72JJQxmnJOMUnbxMj+tpvWWZSswLNdShTlDSzQ+bhivMhDhr/Jl5r0PYm142zTu0B0i1FzdRnnsmaaro4pjhU9tJVd5BzxGeq/bKK4tLlWtb5DNwbuU4hvWn0QmeAuw14Gc4DPwPXZsaexIPWjnVJzuwW6Q2WgBHauWfHLN3psTb5QZ1OkIpn5eJ2H+I6qrwGSnoQslEtZRgqJ8ptt/QLMF+j5AR1HwhJtPnIteY+8XMie+oO0il4W9oHG2ln9KZaIXrDectvz+uqmGDcQmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0TBdS26ApiZnkypMA8vcGTdHb/PmATvT+7Sr5e0Yl2E=;
 b=qST7bll6IqExSbsuWYR1qE/ZdRcDey8T1oNM+Gc0zl7H5xXgetmTe5wQTKPD5by1pVn/hC2DYU+0ELVnJnL8ECyO8jresS9dCtKNnZAYCD2dA59InLMgwEcfrDlLVmRL7YIQIwiA26RYL0V2fARPkg3wOQQ7xOf5kZS6ufj6bRJvLcCpw2uNoCbBFgBqbjiOI/5OFl4PaTsFgGD5opF1F+uD5F7nuMYCOIIOoMQZmmXhNxczMXeK/Xh1Vvv/CliBOtPhQVVlA1DiBfLYTsmbda5ofVqSB2AI9aU3SbL0tXxJ4OrTycMq216Q5wsXu729gKZ0/wkx4rZnGhaI03xLvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0TBdS26ApiZnkypMA8vcGTdHb/PmATvT+7Sr5e0Yl2E=;
 b=sBYaomsHhHwzqObL6o0bAZXekI18Z+HKOF/o4WemPrz+XlUJxYsCmc4MSm/zv4CXkxV23ccBV954pE6qut3jsWVY6UFlO9ff/U9dqbnDqzIEB7ZoBt8itKIM3VfneI7ZFmcxCHKiQwncRmO+PQgEc4y2xzdtwk/Tp2ToiyaEp44=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LOVP265MB8632.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4a6::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Tue, 20 Jan
 2026 15:01:33 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9520.012; Tue, 20 Jan 2026
 15:01:33 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 20 Jan 2026 15:01:32 +0000
Message-Id: <DFTI9J7TZRYT.CT88BWE920DU@garyguo.net>
Cc: =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 <rust-for-linux@vger.kernel.org>, <rafael@kernel.org>, <ojeda@kernel.org>,
 <boqun.feng@gmail.com>, <gary@garyguo.net>, <bjorn3_gh@protonmail.com>,
 <lossin@kernel.org>, <a.hindborg@kernel.org>, <aliceryhl@google.com>,
 <tmgross@umich.edu>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/1] rust: simplify `Adapter::id_info`
From: "Gary Guo" <gary@garyguo.net>
To: "Danilo Krummrich" <dakr@kernel.org>, "Greg KH"
 <gregkh@linuxfoundation.org>
X-Mailer: aerc 0.21.0
References: <20260117094710.24301-1-work@onurozkan.dev>
 <20260117094710.24301-2-work@onurozkan.dev>
 <2026011725-contour-salary-d3d1@gregkh> <20260117140240.15d1120c@nimda>
 <2026011703-bony-unloader-9099@gregkh>
 <DFQVNVYZCDPB.3IB8IA2KWUD4B@kernel.org>
In-Reply-To: <DFQVNVYZCDPB.3IB8IA2KWUD4B@kernel.org>
X-ClientProxiedBy: LO4P123CA0159.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:188::20) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LOVP265MB8632:EE_
X-MS-Office365-Filtering-Correlation-Id: e58ccc11-2ada-448a-ee96-08de5834ccb1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|10070799003|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QWN1Wkl4cnJFUXJmYTJ0bXRxM3I5VVM3N0pHN200eG1YV1dmSkhqd1Uwem9n?=
 =?utf-8?B?d2k5emNBQjBNY0FIRVA1T2NqUG8vSUI4TVBmZHpPclQvV3FtTldhM2NuZHJZ?=
 =?utf-8?B?QnVrcUVLeENLV0N6WUd5eG9haXBYSEx6U2pqaVl6bWdNMlFzU3ZFQ04yYnlI?=
 =?utf-8?B?RXZWM3E0dmhlZ1NBS1BPemR2cVNjVk9nTTFrM1BpazZlZXZWeE9UQzA5N1Rw?=
 =?utf-8?B?YmxuNGZtZjN5NlFORVMwN05DQTc4T2FzVysxWVN5TXhwU04yNFVFbzJqcXhB?=
 =?utf-8?B?SkFsOWp2KzU0dnZIM3JhdnB0QXAzdTRjZlRScUh1bVNtUGwxR0lPZjVnTmRJ?=
 =?utf-8?B?UnNWZXlOc1U2VkxkMGkvZW5Hc0JrOWVNc212ZXBVb01wenFjaDZSRCt3SkVu?=
 =?utf-8?B?M21NZWY5NVlQQWZ2TG5GU1FqQ09vVEVJcFBhWCtPMGlNY0MycXVGVjFEOTZI?=
 =?utf-8?B?STExQkp2M1FVVmhYalNhT2ZPRnM2NEFETnZvYVgxS2ZiRDRJQTZIem4zeU9Y?=
 =?utf-8?B?VVpJemlUK2tVVWRKL2hrT1BLUEkvMVpxSHhicGhudHlrWjkrT3hYMVF6ZXJG?=
 =?utf-8?B?WEFlT2lUcXpEVlZRWFBSWW5DcjRTcVJKQlpibU1uQmV3MDFMOGNRTDhJSDcx?=
 =?utf-8?B?c0pnYjRwMlQ5NkRGdm4zelNoc0FkcEMrcktSVW1aWWUwQ24zLzRVZkpQSDJn?=
 =?utf-8?B?VGZNNkd1c2lBa2pFV1JuSVUrbUlJVENYSzQ0aG5HQUFaTDN1aFU1UjhtdzNH?=
 =?utf-8?B?OVVsdHAwUmVPUFAwME9QVHdGdm9ZV21uZTViMFBPSFk4Z252bVFPVlUzSTUz?=
 =?utf-8?B?eXlQYVROZCtqL0VjZDBWcEprMlQ3ZmdXTTdQU3hkWktqbmVZTkhFN0d1RVhS?=
 =?utf-8?B?SitBdGg4cDkrbTdJVHRCQS9wT1dvZTVIYytDU0s5ZmdkNFFGVzh3c21FdFhY?=
 =?utf-8?B?SnlIaCtWQTVPWWE5WlBBVTd5a0YvQWt4aFB1cm5HU2lhTVZQSVo5VHUwa21s?=
 =?utf-8?B?N0l1QUt3eUhudER0RHhLTWdkcEpxNGFCN3cvRWFmM1B4Y2NGUkZBOTVzTERP?=
 =?utf-8?B?andsNXJNL0dFbWttTTVuMVNWemZWbkh5UEd6Vmd2T0JMSVFJZ2pSRHFrVXBS?=
 =?utf-8?B?MTRzRDVIUnllcEpyUVVWY1lWQTU0RlVWS3NJbWVsWEUrSHdnUHRIQkJmRGVl?=
 =?utf-8?B?eUlORmY4TzBPNUZvR3lXRUt6QXc2Y0RITDFad1paaGEzVnMvWHREMVBwNkth?=
 =?utf-8?B?em1hQXVFb3l6U2orWkI1c012eW1KNk5CZVh2YUZkZ2lKOEpaT2hUTkV6RFVD?=
 =?utf-8?B?QmtEZjdjSDlBWHpXdzVjRGxGUVc4ck9KL1BhdHdBVHNBQnVrbUMyM25zRjBH?=
 =?utf-8?B?eG0xWWJLazMzenZpRlNqcVpMZmlxTVZvWUNXTEQzT2NoYzBrS0hjQXozdDlG?=
 =?utf-8?B?TGJSME5IMzd5SEtzalV0S1h4SUI3MkdJbEM1Z2dveWxET3I2bk1RRHJoWnpY?=
 =?utf-8?B?dHZ6WkJSTy92bFhwek1Ic3ZnK1BycnpHTTdaRjJqcjBrNFRqSmVFNE5CbVFu?=
 =?utf-8?B?alI5TDhWQTIzbytrNXprV25qUlk3aG9rVndYMWljNm9NczJ5VWpmTnJCMXov?=
 =?utf-8?B?NmtnVjVNbXpkT0lpVVcvY2QybXpTYXdVVThBajlFY2lLc1Y5YnlITUYrSXov?=
 =?utf-8?B?ZlgwSGgwMU1BQ0phTEl3UUNPMmZic3FWUVFYbHV4UkgxTkVlaGQwaGNxQkFh?=
 =?utf-8?B?aFRlQnorWkpRY3lOSHRxdTRjTEpybERySlAxZllxeEYxM3dYOEJkSi9yVm1y?=
 =?utf-8?B?eGYvQ0UremNrZFV2RHVzR3R2QllJZ1d6ZjdSb1ZsUkNpaTh4dVp6TzR5WlFT?=
 =?utf-8?B?VFJlcUgwSUZ6dTM1eHRiVlo5NEFFR3J3dGUvVmtjdzJVdlM5V1hSSjN5d2Fn?=
 =?utf-8?B?UDNRRmNHVzh5TEtKdjkzMHRVb1BEQ1BmT0doQ3o2SDhneTI5bUpXRFVlVXVs?=
 =?utf-8?B?M21BUE81UGZwWVQrVkJmMWt4MlA1bEZGa1BpYTh0RVFlRjhYZElSN0Y5V2Rj?=
 =?utf-8?B?eFcyZEsveHhBSlhPaEtBcFh1VEhvWWVQL0gwMzNlaVhZeXUwMmpodUJKZG5M?=
 =?utf-8?Q?sS98=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(10070799003)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?enRaQVZTZithNzJIUkJUekl2UVFGdVMvcHZuTDZjK0dWVzB4bkVyUzhOQ1Y1?=
 =?utf-8?B?VGNabjN1TnpWWXd1aTQyTUtnUTJSd1dCUzYwK2JmcGw5R3E2V1FnenRXLzJE?=
 =?utf-8?B?dUdKSHY2SExpaWEyM0xVOXVHK2t2U3pSN2ZXdzFBSWxtaGxOOUx0RmdRdk1N?=
 =?utf-8?B?cE1aSXRNR3NKVkFHTG4ydHJpWUNJMkxBblZhUitHTkE2K2VTcDlXOUZEY2hz?=
 =?utf-8?B?UWl5dTZ4NUcwSGg3V25Kb2laN1lxMHEyL2QyS0FNSWpFYU80MWJFaVV2d0Jj?=
 =?utf-8?B?VzJwNFhiMjNjWjdBUktlVWVCakNQaDc2SWdhbWlKKy9rcXl1bmlIUGtibEhC?=
 =?utf-8?B?bEplVFEvY0NkZHF0ekpQUUh0eFVraWE3U1RXS1VjWDJPdmJab3FkUlpQZXJC?=
 =?utf-8?B?d0xGdTE0WEZsMWtPaGk1L1FIM1NGVkg1K2dSYitTYi9Eb05LVnZsRHk3Z0pq?=
 =?utf-8?B?L0RjU2tKTmNRaWphKzMrY0I0N0IzdWd5azBHb2Q4cU9rblcwaE84QU5ac2w0?=
 =?utf-8?B?ZGYwNmMxZG9lbllzL29WTFJXd202UWhWV2RVT3p5TWdCOWpsaVd6YVpjT25U?=
 =?utf-8?B?SU9CZVd2ZmxILzZoNnQxcDVVeU9XUS9RaDVWeXJ1WnN3OG9DNldBZnBDMlgv?=
 =?utf-8?B?YW9ocEF3djdDd3JWWEtvMFpVWm5MMnFyWWI3a1gxSVIvbjkwTGdpaXNtd0R6?=
 =?utf-8?B?UDNneTZScUQxb1VkaEZVTmxHQ25yaXJrdU1OZXE2S0RrVGpFS0V2Mk44VHNH?=
 =?utf-8?B?WFcwYks0TXVFazFsTzU3ektFOEJPWi96QzJlejhDekEzNXVwMW5jMytJMDhR?=
 =?utf-8?B?dXMzSnhJSC9ZZ1RhM0h3blJXdFFVNE5lQno1dTR0dW9ITXpVUW1URFZLYXlF?=
 =?utf-8?B?RW5vYkcxSUVxTVpBTTNJdUZlZmlweTUvK245ME9sNjdlazNHWFNTcS8yY3ZH?=
 =?utf-8?B?dVpOYWZjWE1mN1hsUE5xdUNWdVJBT0JEWjMrUHRtSHlLanIvcGkrR2VZOHpp?=
 =?utf-8?B?QVUzV1ZkZmlyU0FIdTBmd0hGYmZDUW1PRjJFRCtWZEtaM01LV0FBc2RsNUla?=
 =?utf-8?B?cURMWVhOQ2xrR1I0cEZXYmxtbVA1VkptQTM3b0dqRXpZd0d0MVQ1V1cxVEMw?=
 =?utf-8?B?a2pLcHJUSmt1VStCYk5CU093UFI1Yy81YVB0TnlmeEVQbkVRcDBpSHlhcThq?=
 =?utf-8?B?ZG1HRndEQUtCU1Q4SXJUY3EraGdxbHFSWk9yQ2t1aTBXSnlSZkIwT1VYOWZt?=
 =?utf-8?B?Z0pVcmp4WWdqQTIzVjlUVlpxYjUxL0VydXA1c2xLOEMxdm9Sdyt1NTFyaWJh?=
 =?utf-8?B?cURlNW5xY2VtSWt2QVhRTnJjZkhOZWFEUzJLRnl2NG1BME1HUWF4YUh6eUVL?=
 =?utf-8?B?VnRydzZWQjlBeGZnU1dmVmdpY3FHN2IrTHM5UlFkQ0ZZRWZrSCtsaDJzbGdG?=
 =?utf-8?B?eHVQaldERER5MjlaVkh4UmY2cU81N3Y5dUt0bHpLWXVMN1EvZHkzY1pNK1NN?=
 =?utf-8?B?Qm1MNENPcC85QlAzSzFxWnFmY1lyK09VVjNtZ1FyMHpmTEV5YUhPYUdKZG1N?=
 =?utf-8?B?UVZUWHlDaEFwRmZtMWsyOThLdkxnZUt6dHNIOW1ZcENKZEtjQ1o5clFURG9h?=
 =?utf-8?B?a2V5R0FZRXZqVm1tWWE0K0Fma3lFTzZtbXp6SmVNelQ4RWJhcXhDRHJVS0tI?=
 =?utf-8?B?TktuUjVubDhFdy92Y0cxUVZyK1lTalhBYktWV1Vpam14OG9NSFJYVG5IU0ZF?=
 =?utf-8?B?Y2FhUTZ5Qlc2T3VIN0c1ZFFFMmRXQkc5bHNWVjZvazc4a0pnYlErTFRrU2oy?=
 =?utf-8?B?ejBjbEdlZ3R6dFQwWFdhWFdkcTZZei8xVlY2K25STG5RRzdYSlJiOXE2dm1i?=
 =?utf-8?B?bkRWTUY1Wk9aalBhQll4NERKVDBmM0pBMEFkcm1UWU1SU2N3NEtPaUMwWXB0?=
 =?utf-8?B?bU9qZkJzOG5McThZTkJscGpBeTEyNzc0dmpTTlJFSXVDTmxLOHg1MVBtbWNu?=
 =?utf-8?B?ZlZIOTRwNy9VSDFCWkFyQjNxSDMzaittaDdxbXlmYjJZWW9UcERLSnorYS9Y?=
 =?utf-8?B?THphaTBTZU5jQ0dDdWZDQjVZLzZVbEJWeGRRQjArUGxDMUhWU3VDbi9DR3JW?=
 =?utf-8?B?Tk5wa1lXUk1KcDBxNEJEOXhaTmVLdUNXNis1MHhldmlCaWo4Q2NCK0hGMmFl?=
 =?utf-8?B?QkttQkFoT1FYZmNXUmdSaTg5KzJzQkkwRktFYjdCMElCQmd1RFZaUzRaN1U4?=
 =?utf-8?B?VllYaTBGR0M3THhIREhMV2NuUy84L08wRENkWmszVE5lSzY1eUswRUlLZkJZ?=
 =?utf-8?B?K0JIUG45cTMvVmphS1pOQnRDV2tWK0N1U3lQUitkbWluZmhwUE40UT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: e58ccc11-2ada-448a-ee96-08de5834ccb1
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 15:01:32.9726
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yuvD5+NQJigY+yvA7E2jjKXaE7Me+7lkVsyejbY7oRffpN4iy6EiQybZklaciXKqq6i6LVdv3CkxaV45GHcB2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LOVP265MB8632

On Sat Jan 17, 2026 at 12:53 PM GMT, Danilo Krummrich wrote:
> On Sat Jan 17, 2026 at 1:07 PM CET, Greg KH wrote:
>> Does clippy complain about this one?
>
> No, it does not.
>
>> I don't have strong feelings either, but the original is "easier" for
>> those of us used to C code.
>
> I think it's a matter of preference. Personally, I like those functional
> characteristics of Rust and the corresponding possibility of compact expr=
essions
> as long as it is not overdone.
>
> This case seems pretty simple though. :)
>
> In comparison, this is code from allocating the level 1 page directory fo=
r the
> GSP (radix3) firmware, which is probably a bit too much.
>
> 	level1 <- {
> 	    // Allocate the level 1 page table, map the level 2 page table onto =
it, and map it
> 	    // into the device address space.
> 	    VVec::<u8>::with_capacity(
> 	        level2.iter().count() * size_of::<u64>(),
> 	        GFP_KERNEL,
> 	    )
> 	    .map_err(|_| ENOMEM)
> 	    .and_then(|level1| map_into_lvl(&level2, level1))
> 	    .map(|level1| SGTable::new(dev, level1, DataDirection::ToDevice, GFP=
_KERNEL))?

For this specific instance, it looks like it could just be

    let level1 =3D VVec::<u8>::with_capacity(
        level2.iter().count() * size_of::<u64>(),
        GFP_KERNEL,
    )?;
    let level1 =3D map_into_lvl(&level2, level1)?;
    SGTable::new(dev, level1, DataDirection::ToDevice, GFP_KENREL)?

which IMO looks clearer.
   =20
I suspect what people want is Elixir's pipe operator so the above is like t=
his
(non-existent, imaginary syntax):

    VVec::<u8>::with_capacity(
        level2.iter().count() * size_of::<u64>(),
        GFP_KERNEL,
    )?
    |> map_into_lvl(&level2, _)?
    |> SGTable::new(dev, _, DataDirection::ToDevice, GFP_KERNEL)?

But I think keeping things as `Result` (and not using `?`) just to use the
functional combinatiors is probably a bad idea.

Best,
Gary

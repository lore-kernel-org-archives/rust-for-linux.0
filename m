Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013067.outbound.protection.outlook.com [40.93.201.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ADF4374174;
	Tue, 20 Jan 2026 06:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768890231; cv=fail; b=bj3hx7IH+v7hrBBqRnRUWXORW+Bfr3Na3IKaJBPKQgnKNu42HZS4F/rX4bAp6hte9CA5+YlDWHVOvWbDXADrHhgjxMs5B6TEzntJWpCRu/wKzGg8RyvhcPpeVOQMQMpBKjkgSA9yD0WF8LEuOoDen0TCIgzftiYmoBdGcZiZ9c8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768890231; c=relaxed/simple;
	bh=NtliX/eXRkWxXHu9H6XW/Y9HlwwEus42sGB3Yz8bGxo=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=ZEf0jGUDWDkqKfqAZoR+n4rY7teOv8gSgAy7+NZ3ViAW7RnvyA+/l6upvRcWdFgqctzB7JCSi/qONTJQEkSIn9ObGbLwB3Orz56yz++IVEoe75ARhHyNralUUZ1lwXGJ0WwayPsFqGY3sqF+TW8O5FDELZX3ca2prJrd61g8Xf8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=D94QtiB5; arc=fail smtp.client-ip=40.93.201.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="D94QtiB5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PkjiqOuRF/oSiIXykKe8YHjFqQ0SCKk03/P5Tk5Qg1K/Eq0pXbDg6ULP9g13aU1rYmugNJSJriCPlj/q2xa1076EyDatBPwZ4rnGgil0yk30422LNC/Xlgml+GEMlRyEtujOuTIeVJ7ztaAcHUgGFwBw9gK3qsI3Gta0Tvffx/gslj0zU+GR0slRQwCGIyX+Sc7Rd3J0BPJyXrT0Vi/Yhr9r6PJokdkNP/ch137DO4yk+xUn2QSEj6+PzwZFjnAg9KObiQZtuoEDtgMyT1o8OdSHg/5ISIXAk2uTO0ka+rZsTk0Q4Fvv7ay2qTavMM05NtBr6g3K4QgBeTrmv+YYFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b4DqmCmCQMVkaZ/qFPEh0HEopf9VRh8xMO7OH9uMCnk=;
 b=PlZ9xy8si0OVXHJ3V1q+RDdM4/Qbw3PmYNIKwGE0oZHdcXSWxxrXfVK6w92DG6H6wsEZhgpOCiXA22KXhWKfIS5nFw8IpLn5wqnP5Q6dtBZW81HxmWtto0Yi26o9Hc1ws+vQM7nZxbOXqQwoNCcbuk/JKlMZOagnq5sMHP9nggip9t9oPlGyq9CwgnrqE9GnPAFkPtNnC5ytX94xZYt/h6eRD4VWCEgY7l5ZjCPeQCzqy3fC970COww6skbNZEFoOcsJdWBPSRvx13DBNxOSQfsWSc4jT6R7p4RDfu8vr8m16WIkyga3gi2X7kouNRoTMDfWdxqLN8h9cvF2SpJT9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b4DqmCmCQMVkaZ/qFPEh0HEopf9VRh8xMO7OH9uMCnk=;
 b=D94QtiB5ezlvudAQbaOftqL7PZU3at2pVbbp9mgplniGhwdHadtft+vSICtIhXYaviBoa/YhmCbz5V8YAxhL52RUFo04rcrhNTyQYEnfIP8Sxr3zTcc/Mx3oDJ6DnGez7TX5aVzpsSl/usxffcWcbJj+QCGGQySmQ8yb/UFAEFKEp/Iw7oHwuZHXKYvsJiOYnac+F19JbtmxqNxtZoXZWE9HkAEMkVAGr7C69gKGuZQSCEwRUEdEaELVS6VPPrJ6j7tZPMzQ4uTmNwXeUhmUlFp3Bt+p5/8E2KsclByCELpuh8PRHy0jYc8WUsjsiUAgLxt+2gOmXiWSIc4dtWKddg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH0PR12MB5606.namprd12.prod.outlook.com (2603:10b6:510:141::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 06:23:44 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9520.011; Tue, 20 Jan 2026
 06:23:44 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Tue, 20 Jan 2026 15:17:56 +0900
Subject: [PATCH 3/6] rust: add `bitfield!` macro
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260120-register-v1-3-723a1743b557@nvidia.com>
References: <20260120-register-v1-0-723a1743b557@nvidia.com>
In-Reply-To: <20260120-register-v1-0-723a1743b557@nvidia.com>
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, Yury Norov <yury.norov@gmail.com>
Cc: John Hubbard <jhubbard@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Edwin Peer <epeer@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Dirk Behme <dirk.behme@de.bosch.com>, Steven Price <steven.price@arm.com>, 
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TY4PR01CA0045.jpnprd01.prod.outlook.com
 (2603:1096:405:372::16) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH0PR12MB5606:EE_
X-MS-Office365-Filtering-Correlation-Id: de99d96b-e5d6-48ed-d69a-08de57ec761a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|10070799003|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bVNBUWloSWp1NjRwMW1iaFVQTkwxeXFkYThIaE03alJmeXVycWtVMlNKcFhO?=
 =?utf-8?B?VVZ0WUhJankrenU4S0tLMWlKbHp6UEdFc29wUzZrWEJJNCtPYWFLaUhLcVZt?=
 =?utf-8?B?N2J4UHhiNXFYMkJ4VVhFZnowOXJvblNpaHpXdXQ2NUhKMHk0djQrbVhGeW9i?=
 =?utf-8?B?UTBzTGZmQ1R2blFIczBXVG1CZTVVN2hhSFNCYkNzZXF3TExLdDZoTEZUTmxz?=
 =?utf-8?B?aEZha3hOODZXSVZtQUhHcmtoTXFtc01lNHlsMkh2Z0hCYlJiUkRBNk41OWZC?=
 =?utf-8?B?MUp5UWViME50WkllWmZ6MXh2R3VkQ0JHdkhSd3pWSW5qcGdxNldsMUl4aDdU?=
 =?utf-8?B?V1h6djhmU2FNU2xJT3dZb2FlYjdxOFhxYXFzVFd2TXN3emd5V2hpL1VWeFAy?=
 =?utf-8?B?Vzd5MnZIOUNVaHZaOFVMTmFTYjEvMDQrQU5NM0VtMEdzWHM2dE5NMXJEbE5j?=
 =?utf-8?B?L0lkbGRRdGJJanhkcFdDSEhaanBIc09nR0MxdEk3eGJCOUlXNnF2RE5IeUNh?=
 =?utf-8?B?d0lwdnJEZ0pMdXdaMFRmNGtNelFaeG8rR0FBL1duU3pHd25kTEhmdE5ZMTc3?=
 =?utf-8?B?dDVVZ0lOL2NEeVVCTmF1dXFJQ21RZmNSVVk1T2JyclVQSW1DdWt3Yi8yNXNI?=
 =?utf-8?B?ZFdPeURtQkFBeFlOSW0xaE9VMDFnaGF6S3hSdXI5a2kzVHBReEw1ck15UTlo?=
 =?utf-8?B?MXI2cG9ackQ3cGptSE1vY0g3YWtraXhQTFh3SWZ2V3V3Tyt1TmZwQ2dxOEZ0?=
 =?utf-8?B?YndMWlVIMnF6aURVL3JNb1M1Nk5DSTg5aEcvaUtIekJGNVpMeHNEKzE1QWZR?=
 =?utf-8?B?eHN0QmpmeklQc1BBd3JLdHBHWEcrbWVRV1ZsOWdDSXJUL0ptejBNcWY5T3dz?=
 =?utf-8?B?TVFkVG9RR1c3RTVXejRkWGFtQThOMWdBVnZKdUF3SHQxZGxncUVpSHlKS2R2?=
 =?utf-8?B?bU13T20ranJWWDZkN3dvZ1dMeWtPVmVZU1ZMRlI4MCtPcURDV3p1TytIaGM5?=
 =?utf-8?B?Vk1ubm5YTEJQdm5tWm93VGN5dnZuaGlabXQzZHBMekdLd3VwdjA5NWRmTFNH?=
 =?utf-8?B?c1lYUEN3enN6ZThCU0dPa1k1SVNxVXo0cnJiYVJBdjlwVnFGMWE5RlFiWlRN?=
 =?utf-8?B?cU5ONGJUcm9oRXI2dzBCcUxzK0hHKzZPdjkxZG14SCtxdnlaSStENzNxbGRL?=
 =?utf-8?B?MDdmb3ZCZFNxSFhXN2h5Tk1YaUQ0UDZvWHMyQ0o4UzYybUhpZWVZNzJvc0pM?=
 =?utf-8?B?NGtCRFJ0RlFKS25rNHZUL3JYMjA0WEFVVjgyZGRCOFBPdlBVbFlwemhVWkdv?=
 =?utf-8?B?NnZQSlc4NGkzeEV4SHp4UkRScmRlaVV3K2lxNzdGMkk0Y2ljUUZGZXdjbTJG?=
 =?utf-8?B?SDR1SFAxdmxhTFl3VlJjL2JETGR6dE02T2FZZjErblZFRWN4MHFCa25jcHE2?=
 =?utf-8?B?djRvUHdpbHZtd1NxNUkvcXlMTUx1TVVGNWhyVy9QMlp0SHlUWTlHQ1pyODJ6?=
 =?utf-8?B?d2RhSlhoazZrZG43d25PbnR2aXBDUnY4RDFueUF0UmFyMlJ4T05Kck9QRitK?=
 =?utf-8?B?QzEyRTBUdFpEeTdOdlhoaVNOV1dOMm5OT3ZyOWRUN2NmaXNUZ2ppc2JZZnFw?=
 =?utf-8?B?bmlPejF1QnF3RmJsdzZLNWorS2tlQXozSVI3eEtDMXRxb3haTS9DdHNDMFh1?=
 =?utf-8?B?Yy9LQ3RrNkpZdVQxVG9pbmpoQUtTVlgwYXp3Qyswa3lHbWdWaE1kU3c5cFBE?=
 =?utf-8?B?cEZ4cFQ4OWJpcVAxZ1pLRDhTVzE5MHM1NFpkVC9ycytWQjRMOXZuak4zTnpZ?=
 =?utf-8?B?VEJOR1B4dzA5U0tTVjRzUkRTNFFzclplSzNpUWs4dUNzeUREMzhLaU9qVC9a?=
 =?utf-8?B?RkRQUWMzSTZXaUxqMXlvZUJPOUR5d1RUeFVodmt5akZKMDdCOVBFZlVuYlUw?=
 =?utf-8?B?VDdIL3E0R0ptQXZhSlBUMWY3dS9UdFRIaXN1L2o0T210cXZ4aEQ2NkxBK1Bv?=
 =?utf-8?B?dHA1M3kyQXpPdk8rZzVRa0duSVVNSFVpazNraWlkdlZ0cG1MbUkwTnQyTE9o?=
 =?utf-8?B?ZkhMZk9LVUFRTkFhR3VHVmpiM0hQRUhQWW82MWQ3anV1bHA4LzBXeG5FTDhJ?=
 =?utf-8?B?S1FxZDBPb2wzV0hZZG1RVkFhZ1lkWE9zTFl2M1N5M25NMURlNVFLbHZZUURp?=
 =?utf-8?B?SFE9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(10070799003)(1800799024)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZldwcVNIbjZSVFV1eEw2QzFKVkw3Z1JHWjFoVjN3M1NxY1JlSjE2dzk4MTVm?=
 =?utf-8?B?aFVBS2lUZkZoazVaSlJiV0FtTWRJZS9ISnREVFErY2NXa2tpcG1iUjFXTTAw?=
 =?utf-8?B?b0pLaW56V1h5WHk1MCt1M05xU1FVNnVXdTg3UFQweFRNYXc3Yk4ybXZoN2NT?=
 =?utf-8?B?Nmo0N2lSVk05eUtwei9jd3JIaWxDMCs5cjBaWjNWOHZSVWRUblYxT0tzU1RF?=
 =?utf-8?B?LzRvSUFiTWVWbXFFQy8wTXZPK2NLalAvdXJsNHY0TDJyK2J5citMSWRyWmZD?=
 =?utf-8?B?WmhUOHBJRWlVdCtURzVZZHNKcFN2Rk5aay8wZGhjOG8zNmhCdkFiQmVTWW5J?=
 =?utf-8?B?b0RVWm1ROHhqWVNKWVZuWUVBMXVFTG5iTnVjV0daaWpRUDMwc0xSQmRzRkZW?=
 =?utf-8?B?SWZNdVBFYmRYNmdXRXd5MU5UUDdWWkV4TEU0eS96M3dYQy9qRC9scFRLcnNk?=
 =?utf-8?B?RzQ0Sjg2NnF1RjlsVEFNRmI1U1VlZStUemZZaXFMYUNtMlBrblJVby9UUEth?=
 =?utf-8?B?SnltaTduYjNZcjJqMU9GZ1piV1JrNzhYSllvRzZ5R1N5YVQxSEdmK1ZWSkVq?=
 =?utf-8?B?cnVYQ3RJSmordlZTbGNpQ2FXTVB2eXIvUlpZRFVad01SQnRMUmVUSDVRMWUz?=
 =?utf-8?B?ZlBqdzVETUF2WGQxbWZBa0w3V0Z5cCtIOTdjUFlOL1JLMDhERnN2dmxhMU1t?=
 =?utf-8?B?aG1MVWExR0ZUTDYzK3Y2NXN4N0NoS2lnZktIakVONTZpRTU5NG9TQVd4VkRC?=
 =?utf-8?B?T1JKb2JjaDFCWkFINjJhSXRjOU1jWk5VLytBb000R0NVbHIrTlpmV3FzZ1ow?=
 =?utf-8?B?ZFFmSWx3SG1ESjNWTHEyK3VrajUzaGZ4c25nMjhwT1pPWXlVTTRBb1ByRkZI?=
 =?utf-8?B?UVBxaWNTejU1OVcveWR5aEZGWStDa2Urb2tEanVldzkxMU0rSVN3YlFxcnBh?=
 =?utf-8?B?OEU4QU92RGxuMy93RWV2eGI3M296NDUxNU5YSlVZNFZoOWg2SlY0NkRKV2xt?=
 =?utf-8?B?STk2anN0dTVtY3JndDQyZFFBcExSd3ZtYTV5L1V2V2hFY29Za2NtYkxJQkRR?=
 =?utf-8?B?WUNtZ3lOb29Qc25kdk1xc0tOUllJMEJ0UU1CdmlxRFdveFdsc2JWK0dGemJQ?=
 =?utf-8?B?TTlTQ1p6SFRZQ1pRVkFzQTdWMUFnQ0dLdHpLRVl5TndkcTV5bVpiUjRMSmI3?=
 =?utf-8?B?MGdMcG5yZDhjWWIrZUNvQzFsSnYrUUFzWFloSlJtdElrZDRxSGoxM05vcC9J?=
 =?utf-8?B?ZU42eUFpRm01TG1EZ1N0RThUY0gyL216MHBQVGl2aDh0TnZyZWk4ZFR3V0g0?=
 =?utf-8?B?VGQ5dUU1bXdrR2UrbWpEamhqdENWUWI2WmpFbUxDWnhyRktLbTAzaGoycDho?=
 =?utf-8?B?MGdaNURza3pUMUpOQ2k0R1VnWUk1T0hNQXVlcFh2MnZ1QUk5bHVwMTRmVkNL?=
 =?utf-8?B?RTN3QlZtcGpqU3JOQkh4NTRManViajBUYWhWQnlGZ3N5SWd2S1M2czJuUVlX?=
 =?utf-8?B?ZEdpM0Z0bURWNXB6empaNCtqUGQyelBuOWN4THBiQTBpeHNpRHFDNUdEWTFY?=
 =?utf-8?B?a0RvU05GUno5bE16clNLNU5sdTFOQ2dOd01ycHcwSFdSbXM0VUtRckkvaXY4?=
 =?utf-8?B?akcvREpUeE5HVlpqa000TGliRTlLdHQrTDZZeHY3dzJpV0ZVUkI2TFcySmkz?=
 =?utf-8?B?dFdRaFJsdGw1aGRxTTNhY0I5WEhSd2I2emVFWnZ1SnlBWXlJOFB4czYwcjhU?=
 =?utf-8?B?QkI1UThjeGJrRE1aNzM1WVFDb3lSZ3BIc2lvRlAvOEw1QitjSkFDT3NCSUFn?=
 =?utf-8?B?ZUdzUUhnckNhN3dQTzl2eXBWSXFVS0xIeXh4VkJyNVE2MWx1OTErbTJ3K09i?=
 =?utf-8?B?RDVHZzZva1V0cUNNdHN5VlNHdjVkTGdRNTZaUEowNGpaTllsTXF5Y3M3clpL?=
 =?utf-8?B?MmlKTllLdzhvSEJkTnp1RjBmUjdjMEl6REl4UkF3VTExbS9wdnZZbUFXMmNC?=
 =?utf-8?B?ekpPVmI2YkFSa0lEWDBucTlwaUxDaHQ2TUVIS3hSTFhod0l4enJrRXNsMjhT?=
 =?utf-8?B?N2F3SThoTjU3UVpEYlc1VnZHMS9KSVgyOG45QWJGck9CK05ETzAvK0lkT0da?=
 =?utf-8?B?ZEh1a0ZSK2FxTDRWNUdUa2dncXZlYjFWeTJ5ZS83cVp0Q3RWM0lZY011MXR1?=
 =?utf-8?B?YktINW5XdEhXQ0wwN3FTUHlTM3dlbk56aXJDMWNXdy9vaE5LbHI4SG9tSFdL?=
 =?utf-8?B?SXhYUGtuWHdmV3lEK2lmK3FmMVVMdS9HdE1DSFF1VTN2WXY1ZTUxUlZ5cWZq?=
 =?utf-8?B?RVNlL2J5aDF5U0o3YnIzK0pwZUZOWlBtaTliM3J5ODhlcng4NWs2S1d4aE5p?=
 =?utf-8?Q?w5ePKJRRMdAVm/K8xX5Q6oJ4hHpWQMtRvGljChvmjIEEc?=
X-MS-Exchange-AntiSpam-MessageData-1: 2GfUc6NiTj5Pig==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de99d96b-e5d6-48ed-d69a-08de57ec761a
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 06:23:44.0432
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PnXMbKg3l1mjyU9dcuApRPzLaMg8jAht7q2I/gPJN6KQiCODzOGrd2yyeB5IEUYmLdrCwB8BvdPR6O0wpab+iw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5606

Add a macro for defining bitfield structs with bounds-checked accessors.

Each field is represented as a `Bounded` of the appropriate bit width,
ensuring field values are never silently truncated.

Fields can optionally be converted to/from custom types, either fallibly
or infallibly.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 rust/kernel/bitfield.rs | 503 ++++++++++++++++++++++++++++++++++++++++++++++++
 rust/kernel/lib.rs      |   1 +
 2 files changed, 504 insertions(+)

diff --git a/rust/kernel/bitfield.rs b/rust/kernel/bitfield.rs
new file mode 100644
index 000000000000..2926ab802227
--- /dev/null
+++ b/rust/kernel/bitfield.rs
@@ -0,0 +1,503 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Support for defining bitfields as Rust structures.
+
+/// Defines a bitfield struct with bounds-checked accessors for individual bit ranges.
+///
+/// # Example
+///
+/// ```rust
+/// use kernel::bitfield;
+/// use kernel::num::Bounded;
+///
+/// bitfield! {
+///     pub struct Rgb(u16) {
+///         15:11 blue;
+///         10:5 green;
+///         4:0 red;
+///     }
+/// }
+///
+/// // Setters can be chained. Bounded::new::<N>() does compile-time bounds checking.
+/// let color = Rgb::default()
+///     .set_red(Bounded::<u16, _>::new::<0x10>())
+///     .set_green(Bounded::<u16, _>::new::<0x1f>())
+///     .set_blue(Bounded::<u16, _>::new::<0x18>());
+///
+/// assert_eq!(color.red(), 0x10);
+/// assert_eq!(color.green(), 0x1f);
+/// assert_eq!(color.blue(), 0x18);
+/// assert_eq!(
+///     color.as_raw(),
+///     (0x18 << Rgb::BLUE_SHIFT) + (0x1f << Rgb::GREEN_SHIFT) + 0x10,
+/// );
+///
+/// // Convert to/from the backing storage type.
+/// let raw: u16 = color.into();
+/// assert_eq!(Rgb::from(raw), color);
+/// ```
+///
+/// # Syntax
+///
+/// ```text
+/// bitfield! {
+///     #[attributes]
+///     pub struct Name(storage_type), "Struct documentation." {
+///         hi:lo field_1, "Field documentation.";
+///         hi:lo field_2 => ConvertedType, "Field documentation.";
+///         hi:lo field_3 ?=> ConvertedType, "Field documentation.";
+///         ...
+///     }
+/// }
+/// ```
+///
+/// - `storage_type`: The underlying integer type (`u8`, `u16`, `u32`, `u64`).
+/// - `hi:lo`: Bit range (inclusive), where `hi >= lo`.
+/// - `=> Type`: Optional infallible conversion (see [below](#infallible-conversion-)).
+/// - `?=> Type`: Optional fallible conversion (see [below](#fallible-conversion-)).
+/// - Documentation strings and attributes are optional.
+///
+/// # Generated code
+///
+/// Each field is internally represented as a [`Bounded`] parameterized by its bit width.
+/// Field values can either be set/retrieved directly, or converted from/to another type.
+///
+/// The use of [`Bounded`] for each field enforces bounds-checking (at build time or runtime)
+/// of every value assigned to a field. This ensures that data is never accidentally truncated.
+///
+/// The macro generates the bitfield type, [`From`] and [`Into`] implementations for its
+/// storage type, and [`Default`] and [`Debug`] implementations.
+///
+/// For each field, it also generates:
+/// - `field()` - getter returning a [`Bounded`] (or converted type) for the field,
+/// - `set_field(value)` - setter with compile-time bounds checking,
+/// - `try_set_field(value)` - setter with runtime bounds checking (for fields without type
+///   conversion),
+/// - `FIELD_MASK`, `FIELD_SHIFT`, `FIELD_RANGE` - constants for manual bit manipulation.
+///
+/// # Implicit conversions
+///
+/// Types that fit entirely within a field's bit width can be used directly with setters.
+/// For example, `bool` works with single-bit fields, and `u8` works with 8-bit fields:
+///
+/// ```rust
+/// use kernel::bitfield;
+///
+/// bitfield! {
+///     pub struct Flags(u32) {
+///         15:8 byte_field;
+///         0:0 flag;
+///     }
+/// }
+///
+/// let flags = Flags::default()
+///     .set_byte_field(0x42_u8)
+///     .set_flag(true);
+///
+/// assert_eq!(flags.as_raw(), (0x42 << Flags::BYTE_FIELD_SHIFT) | 1);
+/// ```
+///
+/// # Runtime bounds checking
+///
+/// When a value is not known at compile time, use `try_set_field()` to check bounds at runtime:
+///
+/// ```rust
+/// use kernel::bitfield;
+///
+/// bitfield! {
+///     pub struct Config(u8) {
+///         3:0 nibble;
+///     }
+/// }
+///
+/// fn set_nibble(config: Config, value: u8) -> Result<Config, Error> {
+///     // Returns `EOVERFLOW` if `value > 0xf`.
+///     config.try_set_nibble(value)
+/// }
+/// # Ok::<(), Error>(())
+/// ```
+///
+/// # Type conversion
+///
+/// Fields can be automatically converted to/from a custom type using `=>` (infallible) or
+/// `?=>` (fallible). The custom type must implement the appropriate `From` or `TryFrom` traits
+/// with [`Bounded`].
+///
+/// ## Infallible conversion (`=>`)
+///
+/// Use when all bit patterns map to valid values:
+///
+/// ```rust
+/// use kernel::bitfield;
+/// use kernel::num::Bounded;
+///
+/// #[derive(Debug, Clone, Copy, Default, PartialEq)]
+/// enum Power {
+///     #[default]
+///     Off,
+///     On,
+/// }
+///
+/// impl From<Bounded<u32, 1>> for Power {
+///     fn from(v: Bounded<u32, 1>) -> Self {
+///         match *v {
+///             0 => Power::Off,
+///             _ => Power::On,
+///         }
+///     }
+/// }
+///
+/// impl From<Power> for Bounded<u32, 1> {
+///     fn from(p: Power) -> Self {
+///         (p as u32 != 0).into()
+///     }
+/// }
+///
+/// bitfield! {
+///     pub struct Control(u32) {
+///         0:0 power => Power;
+///     }
+/// }
+///
+/// let ctrl = Control::default().set_power(Power::On);
+/// assert_eq!(ctrl.power(), Power::On);
+/// ```
+///
+/// ## Fallible conversion (`?=>`)
+///
+/// Use when some bit patterns are invalid. The getter returns a [`Result`]:
+///
+/// ```rust
+/// use kernel::bitfield;
+/// use kernel::num::Bounded;
+///
+/// #[derive(Debug, Clone, Copy, Default, PartialEq)]
+/// enum Mode {
+///     #[default]
+///     Low = 0,
+///     High = 1,
+///     Auto = 2,
+///     // 3 is invalid
+/// }
+///
+/// impl TryFrom<Bounded<u32, 2>> for Mode {
+///     type Error = u32;
+///
+///     fn try_from(v: Bounded<u32, 2>) -> Result<Self, u32> {
+///         match *v {
+///             0 => Ok(Mode::Low),
+///             1 => Ok(Mode::High),
+///             2 => Ok(Mode::Auto),
+///             n => Err(n),
+///         }
+///     }
+/// }
+///
+/// impl From<Mode> for Bounded<u32, 2> {
+///     fn from(m: Mode) -> Self {
+///         match m {
+///             Mode::Low => Bounded::<u32, _>::new::<0>(),
+///             Mode::High => Bounded::<u32, _>::new::<1>(),
+///             Mode::Auto => Bounded::<u32, _>::new::<2>(),
+///         }
+///     }
+/// }
+///
+/// bitfield! {
+///     pub struct Config(u32) {
+///         1:0 mode ?=> Mode;
+///     }
+/// }
+///
+/// let cfg = Config::default().set_mode(Mode::Auto);
+/// assert_eq!(cfg.mode(), Ok(Mode::Auto));
+///
+/// // Invalid bit pattern returns an error.
+/// assert_eq!(Config::from(0b11).mode(), Err(3));
+/// ```
+///
+/// [`Bounded`]: kernel::num::Bounded
+#[macro_export]
+macro_rules! bitfield {
+    // Entry point defining the bitfield struct, its implementations and its field accessors.
+    (
+        $(#[$attr:meta])* $vis:vis struct $name:ident($storage:ty)
+            $(, $comment:literal)? { $($fields:tt)* }
+    ) => {
+        ::kernel::bitfield!(@core $(#[$attr])* $vis $name $storage $(, $comment)?);
+        ::kernel::bitfield!(@fields $vis $name $storage { $($fields)* });
+    };
+
+    // All rules below are helpers.
+
+    // Defines the wrapper `$name` type and its conversions from/to the storage type.
+    (@core $(#[$attr:meta])* $vis:vis $name:ident $storage:ty $(, $comment:literal)?) => {
+        $(
+        #[doc=$comment]
+        )?
+        $(#[$attr])*
+        #[repr(transparent)]
+        #[derive(Clone, Copy, PartialEq, Eq)]
+        $vis struct $name($storage);
+
+        #[allow(dead_code)]
+        impl $name {
+            /// Returns the raw value of this bitfield.
+            ///
+            /// This is similar to the [`From`] implementation, but is shorter to invoke in
+            /// most cases.
+            $vis fn as_raw(self) -> $storage {
+                self.0
+            }
+        }
+
+        impl ::core::convert::From<$name> for $storage {
+            fn from(val: $name) -> $storage {
+                val.0
+            }
+        }
+
+        impl ::core::convert::From<$storage> for $name {
+            fn from(val: $storage) -> $name {
+                Self(val)
+            }
+        }
+    };
+
+    // Definitions requiring knowledge of individual fields: private and public field accessors,
+    // and `Debug` and `Default` implementations.
+    (@fields $vis:vis $name:ident $storage:ty {
+        $($hi:tt:$lo:tt $field:ident
+            $(?=> $try_into_type:ty)?
+            $(=> $into_type:ty)?
+            $(, $comment:literal)?
+        ;
+        )*
+    }
+    ) => {
+        #[allow(dead_code)]
+        impl $name {
+        $(
+        ::kernel::bitfield!(@private_field_accessors $vis $name $storage : $hi:$lo $field);
+        ::kernel::bitfield!(@public_field_accessors $vis $name $storage : $hi:$lo $field
+            $(?=> $try_into_type)?
+            $(=> $into_type)?
+            $(, $comment)?
+        );
+        )*
+        }
+
+        ::kernel::bitfield!(@debug $name { $($field;)* });
+        ::kernel::bitfield!(@default $name { $($field;)* });
+    };
+
+    // Private field accessors working with the correct `Bounded` type for the field.
+    (
+        @private_field_accessors $vis:vis $name:ident $storage:ty : $hi:tt:$lo:tt $field:ident
+    ) => {
+        ::kernel::macros::paste!(
+        $vis const [<$field:upper _RANGE>]: ::core::ops::RangeInclusive<u8> = $lo..=$hi;
+        $vis const [<$field:upper _MASK>]: $storage =
+            ((((1 << $hi) - 1) << 1) + 1) - ((1 << $lo) - 1);
+        $vis const [<$field:upper _SHIFT>]: u32 = $lo;
+        );
+
+        ::kernel::macros::paste!(
+        fn [<__ $field>](self) ->
+            ::kernel::num::Bounded<$storage, { $hi + 1 - $lo }> {
+            // Left shift to align the field's MSB with the storage MSB.
+            const ALIGN_TOP: u32 = $storage::BITS - ($hi + 1);
+            // Right shift to move the top-aligned field to bit 0 of the storage.
+            const ALIGN_BOTTOM: u32 = ALIGN_TOP + $lo;
+
+            // Extract the field using two shifts. `Bounded::shr` produces the correctly-sized
+            // output type.
+            let val = ::kernel::num::Bounded::<$storage, { $storage::BITS }>::from(
+                self.0 << ALIGN_TOP
+            );
+            val.shr::<ALIGN_BOTTOM, _>()
+        }
+
+        fn [<__set_ $field>](
+            mut self,
+            value: ::kernel::num::Bounded<$storage, { $hi + 1 - $lo }>,
+        ) -> Self
+        {
+            const MASK: $storage = $name::[<$field:upper _MASK>];
+            const SHIFT: u32 = $name::[<$field:upper _SHIFT>];
+
+            let value = value.get() << SHIFT;
+            self.0 = (self.0 & !MASK) | value;
+
+            self
+        }
+        );
+    };
+
+    // Public accessors for fields infallibly (`=>`) converted to a type.
+    (
+        @public_field_accessors $vis:vis $name:ident $storage:ty : $hi:tt:$lo:tt $field:ident
+            => $into_type:ty $(, $comment:literal)?
+    ) => {
+        ::kernel::macros::paste!(
+
+        $(
+        #[doc="Returns the value of this field:"]
+        #[doc=$comment]
+        )?
+        #[inline(always)]
+        $vis fn $field(self) -> $into_type
+        {
+            self.[<__ $field>]().into()
+        }
+
+        $(
+        #[doc="Sets the value of this field:"]
+        #[doc=$comment]
+        )?
+        #[inline(always)]
+        $vis fn [<set_ $field>](self, value: $into_type) -> Self
+        {
+            self.[<__set_ $field>](value.into())
+        }
+
+        /// Private method, for use in the [`Default`] implementation.
+        fn [<$field _default>]() -> $into_type {
+            Default::default()
+        }
+
+        );
+    };
+
+    // Public accessors for fields fallibly (`?=>`) converted to a type.
+    (
+        @public_field_accessors $vis:vis $name:ident $storage:ty : $hi:tt:$lo:tt $field:ident
+            ?=> $try_into_type:ty $(, $comment:literal)?
+    ) => {
+        ::kernel::macros::paste!(
+
+        $(
+        #[doc="Returns the value of this field:"]
+        #[doc=$comment]
+        )?
+        #[inline(always)]
+        $vis fn $field(self) ->
+            Result<
+                $try_into_type,
+                <$try_into_type as ::core::convert::TryFrom<
+                    ::kernel::num::Bounded<$storage, { $hi + 1 - $lo }>
+                >>::Error
+            >
+        {
+            self.[<__ $field>]().try_into()
+        }
+
+        $(
+        #[doc="Sets the value of this field:"]
+        #[doc=$comment]
+        )?
+        #[inline(always)]
+        $vis fn [<set_ $field>](self, value: $try_into_type) -> Self
+        {
+            self.[<__set_ $field>](value.into())
+        }
+
+        /// Private method, for use in the [`Default`] implementation.
+        fn [<$field _default>]() -> $try_into_type {
+            Default::default()
+        }
+
+        );
+    };
+
+    // Public accessors for fields not converted to a type.
+    (
+        @public_field_accessors $vis:vis $name:ident $storage:ty : $hi:tt:$lo:tt $field:ident
+            $(, $comment:literal)?
+    ) => {
+        ::kernel::macros::paste!(
+
+        $(
+        #[doc="Returns the value of this field:"]
+        #[doc=$comment]
+        )?
+        #[inline(always)]
+        $vis fn $field(self) ->
+            ::kernel::num::Bounded<$storage, { $hi + 1 - $lo }>
+        {
+            self.[<__ $field>]()
+        }
+
+        $(
+        #[doc="Sets the value of this field:"]
+        #[doc=$comment]
+        )?
+        #[inline(always)]
+        $vis fn [<set_ $field>]<T>(
+            self,
+            value: T,
+        ) -> Self
+            where T: Into<::kernel::num::Bounded<$storage, { $hi + 1 - $lo }>>,
+        {
+            self.[<__set_ $field>](value.into())
+        }
+
+        $(
+        #[doc="Attempts to set the value of this field:"]
+        #[doc=$comment]
+        )?
+        #[inline(always)]
+        $vis fn [<try_set_ $field>]<T>(
+            self,
+            value: T,
+        ) -> ::kernel::error::Result<Self>
+            where T: ::kernel::num::TryIntoBounded<$storage, { $hi + 1 - $lo }>,
+        {
+            Ok(
+                self.[<__set_ $field>](
+                    value.try_into_bounded().ok_or(::kernel::error::code::EOVERFLOW)?
+                )
+            )
+        }
+
+        /// Private method, for use in the [`Default`] implementation.
+        fn [<$field _default>]() -> ::kernel::num::Bounded<$storage, { $hi + 1 - $lo }> {
+            Default::default()
+        }
+
+        );
+    };
+
+    // `Debug` implementation.
+    (@debug $name:ident { $($field:ident;)* }) => {
+        impl ::kernel::fmt::Debug for $name {
+            fn fmt(&self, f: &mut ::kernel::fmt::Formatter<'_>) -> ::kernel::fmt::Result {
+                f.debug_struct(stringify!($name))
+                    .field("<raw>", &::kernel::prelude::fmt!("{:#x}", self.0))
+                $(
+                    .field(stringify!($field), &self.$field())
+                )*
+                    .finish()
+            }
+        }
+    };
+
+    // `Default` implementation.
+    (@default $name:ident { $($field:ident;)* }) => {
+        /// Returns a value for the bitfield where all fields are set to their default value.
+        impl ::core::default::Default for $name {
+            fn default() -> Self {
+                #[allow(unused_mut)]
+                let mut value = Self(Default::default());
+
+                ::kernel::macros::paste!(
+                $(
+                value = value.[<set_ $field>](Self::[<$field _default>]());
+                )*
+                );
+
+                value
+            }
+        }
+    };
+}
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index f812cf120042..66198e69d1f5 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -68,6 +68,7 @@
 pub mod alloc;
 #[cfg(CONFIG_AUXILIARY_BUS)]
 pub mod auxiliary;
+pub mod bitfield;
 pub mod bitmap;
 pub mod bits;
 #[cfg(CONFIG_BLOCK)]

-- 
2.52.0


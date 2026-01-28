Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013047.outbound.protection.outlook.com [40.93.196.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8338C354AC5;
	Wed, 28 Jan 2026 13:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769606949; cv=fail; b=scT6u8yO1jgZi3nDa0AiC5nEB7Ex4gzDQXP45GpB1Upe1sOD7+qHo3xYYyHoNwzWcnpBp6SUA3JuLt0CCmmrjq6s64B4fM3xHLOBPvdpxUCNAw4Zt4NLNlQI9FMYxZ2RUMpTKEryszugCrTImoq6B+XYzyc3Bhg3AfH+wSr97Rg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769606949; c=relaxed/simple;
	bh=68vStx1IaYH9yisCf/FrCszTp3LLyQOWIqp8j4GQeRU=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=H/K5YzwDJev7gqHd4CapinSjz+UivLFhUl1Qdc280qgJCKzr4PmGfsPRhqYoTK8s3u3ENlWbPpW4K+BbbvWJXZ8Nrpnou/tRWXBbKz2EAzo6ZlcXp2/w16sC+Z+RclynIs8v51auxcaYq9W1j3weOjRtjSKr8kRg+1FE1OsYvZc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=p7h4OQFP; arc=fail smtp.client-ip=40.93.196.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="p7h4OQFP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sdAhNBjqtVjJLAvTgR+b+g8jaO4nKeGRkPkRH7vn/RZWSNK23s/eux1V82VV19UPJjRJ4x4GE0B42eloputaUJlw7/mTba4Lg1rT86We959cBgjSlZSj8UL5d7daX6Zjva9YjDmTEy1ipvglljcCt97AQXfs0k3eqHg6JOslH2sJKPVil4J+4pRBoAYTVt+D2nq8z94CbwEWXAD0PWCaO0IPSW5BXTAjh8+THhxMIAqy2lDGM2N9p0DAf6tlYPqzC0ntX4vspK5J9DflughgpX71xa0w+kVWV3eTjuJWzvAKkPliM29Ij8+q9G9o3OMv/g2N+uW/vVJ8+hvhd43JAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=68vStx1IaYH9yisCf/FrCszTp3LLyQOWIqp8j4GQeRU=;
 b=q5hCQCpILpRHSJgbGxWNulU2v6UGFvy/8t8q356MUdM5cK1BPBJEzDCpNZYmzR/oR2HW8KgAz1424AMyr2PTdv/OW4Sgiq322WEwXkzg317NQ1mTTQKVzi6jzl0PoDG2qUgX6kKJpMQTT0q9lssGhDJaEVryEd5XaS1PSJ0/dhmE7CwdExA/i/fEi3SncluqjwsfnmTPRTpcPCcunj+hykFGBzqT9VrmVg6aC8K1xUyFxkMGpNrH0y9NYC5LWMEHwddI8iERFySPd+k4zlO0cGVk9TnZShka6T17IpWj9a+5u/pJkl7XQCmNYphkcXPQfEkdMpU24YrAnLoNfB2NuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=68vStx1IaYH9yisCf/FrCszTp3LLyQOWIqp8j4GQeRU=;
 b=p7h4OQFPKFt4/a000tmWMlwaUufRaN1X6UIofsRm6YoN/TVl5sM0FhLxPaipVqFrITUimYZH1RSx6m4vVN7k+qVuJGmRo3D+CzRj2oPQ1eoh8UExWfdoryKAlmOlmKRa6sXqF6Trp4vakWgPO8CEggjiJnnWMk5KgbkFMILiRSqMAkbt3HIRGCVSL/77JG4SIOCw9rQ+GAhkUtekH8Asi6z++m9z+7acRqBI5ZIItkgiq7ZoQsNI6FjUN3ziJQfl4qrPhddpOg13gV0e3Ob+Gj49wut+YkOH5cRyVK4fQ3+7ovqnSw9tQAPMv0LpYsm5NVktwia0+c+7gcoKtwXswQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SN7PR12MB7785.namprd12.prod.outlook.com (2603:10b6:806:346::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Wed, 28 Jan
 2026 13:29:02 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9542.010; Wed, 28 Jan 2026
 13:28:59 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 28 Jan 2026 22:27:14 +0900
Message-Id: <DG099OR58D58.GQL20TH2D7PQ@nvidia.com>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "Daniel Almeida" <daniel.almeida@collabora.com>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>,
 "Gary Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 "Yury Norov" <yury.norov@gmail.com>, "John Hubbard" <jhubbard@nvidia.com>,
 "Alistair Popple" <apopple@nvidia.com>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Edwin Peer"
 <epeer@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>, "Dirk Behme"
 <dirk.behme@de.bosch.com>, "Steven Price" <steven.price@arm.com>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 6/7] sample: rust: pci: use `register!` macro
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Zhi Wang" <zhiw@nvidia.com>
References: <20260128-register-v4-0-aee3a33d9649@nvidia.com>
 <20260128-register-v4-6-aee3a33d9649@nvidia.com>
 <20260128143522.434f75f6.zhiw@nvidia.com>
In-Reply-To: <20260128143522.434f75f6.zhiw@nvidia.com>
X-ClientProxiedBy: TYCP286CA0068.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31a::8) To BY5PR12MB3986.namprd12.prod.outlook.com
 (2603:10b6:a03:195::27)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SN7PR12MB7785:EE_
X-MS-Office365-Filtering-Correlation-Id: 1dda5a81-f78d-446b-03ec-08de5e711a08
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|10070799003|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VUFPVHhBV0hsTzB6MTZXNitFajBEajJhSlJocVREOVBKZkNrNk5TTmUxbklw?=
 =?utf-8?B?YTI3eEJYaUdtTnczOVdJUjdBUXlJbk4wdkwyUXBDS3gzV1hzaG9vQmF5SDhj?=
 =?utf-8?B?Ync4cjVkck9zazdrelVwTTR6MjBBWVZabHdSOU1WdGVIK2lIeFAyVVdnZHVz?=
 =?utf-8?B?Mmg1Nm5UMWpzdytub0RFaW01bmdENTM5WEQ0OGVCQlNUdWNMQ2ExVGJ1V0hp?=
 =?utf-8?B?Rm1vSHVUNzhqUGdOY0MrN2tSYjVZdFpXRmdRSVh3Ti9FWVM1OHBQcjgxMFJC?=
 =?utf-8?B?Q0NmUm9tNm0wcXQzeUhJcUlaZ2J6WWlvOE1hUWpLcjQrWXA1QXlPVW5DU3R5?=
 =?utf-8?B?azErV1ZKZjJVWXV2OFFIUmlFZHpYUHhCY21sN3dneUZKb1ZmeDdoMUVYempR?=
 =?utf-8?B?TGtrQWo0dVcyb0lSYzFaZUZHRHJqaWRrbUNDR2xOUE8zZmF6Sk10MEpNVk9S?=
 =?utf-8?B?VUhZdzFuOXV5bExFRGVySFVUam1udjUxTVhLaXpIV29mQ2N5VGVVWHEzVHZI?=
 =?utf-8?B?U2VtVGJiKzEvQW9OMTBMZXU0U3FkaG9OSzFLRk85aE8vZzBnVnlsN0xsODFG?=
 =?utf-8?B?T2w3ZFhCbHZNN1JkVjdOZnpLYXJYOTJoSlFBUm84RXJ3VmwwYTBaUGVnQnky?=
 =?utf-8?B?Q0QwOHRYVkorSngyRmszWlQxZ0NCcTVvWXBpTjFlMzhyK0tTd3Z0Ky9FRHdv?=
 =?utf-8?B?bEpGTjF5WHltNTM5YlM5ZExDeEYzQ3BZUVBoVlU5aXBMblVzWXlka2ZqclVr?=
 =?utf-8?B?R0JDOVZvOWRWa2J2MTFGbEhldGFhZExhSnR3NTh4aEhNV1ZtSHZtTW5vc3dH?=
 =?utf-8?B?Q1JoS3g0UXphdVRnK09TbHg2QURmMXhMZWFZczg1YTVQTFQ2NzF2OUxzM2RX?=
 =?utf-8?B?M1ZzUWxUaC91VGwzLy82Z21FTVYyRDJlUEpCTzJvWFNRRTJRenk0b1dsM2Vq?=
 =?utf-8?B?b0FJZXBuK1hSdWFXNU1Ga0ExaEN4VHFoeXFNUFFta3Y0c1BSSlZqaDUrZ3p3?=
 =?utf-8?B?cVlHN3JTTFROTitZUC9pbmlQaVlPMmk4cDluQStLUHlFWHgyOFFkQ3RMQUNK?=
 =?utf-8?B?K2ZDWjB5MUlFVk5BZ3J3d0xqY1BaNXJTSTMzMVMzUlNPMDF4QVRKRXk0Yks2?=
 =?utf-8?B?U2REOUVWWmtSWDlaT2RBNmVjYmY4ZjdSOTdNZm1FbndlckU3TW5yVnZhZ1F5?=
 =?utf-8?B?NFdsZk5ISThzaGpVUXpwd243Y3p5Mm5VUXREaVI0RkNNeDRYRTFNMlRtNy9T?=
 =?utf-8?B?L1FuamR4Z2lpLzdiYjBlS1FEQXBaVHU3TlJsc3pPQUZmU1BUcHR3Wmc5dUlD?=
 =?utf-8?B?OHVkaVRCMGZWWjM0Wk43R0h5YXg2SDBReGdCYnE5RUZqL253YmIwUCtXMlpR?=
 =?utf-8?B?cHdIOWYxZ3IwZ2x0dHZBUjRFaXVzUFBNc1NlR1FaaE85QnBIOEhXT3h1SGtF?=
 =?utf-8?B?QmxLcHE4Yjl0Vy9YbFphUkdKRThLaWNjMzZzVEFhS3FEVXdMc0xQaVFqOVFL?=
 =?utf-8?B?Tk55amI2cGhQVlJXS2FNVm84c1c2cmE2ZmJSMmErQXVBbUo2WWZnNlNyZVJX?=
 =?utf-8?B?T3NaQmFRSHlFTUxrOGZWTGdaeTA5RWMzYWdHQ29teFZQdm1ESWxiNmtxWCt6?=
 =?utf-8?B?bEk2Q0VhTysydCtjYWxZOUxBUTlyb0ltS0xtcmozc25IQStPMkVwWk5Zcmw4?=
 =?utf-8?B?eFhxeTlBWm9DRmhDWW1BTEZ0K3lyM0hHS3ltM0VQaVYzVDVwMGpibXpoSWRL?=
 =?utf-8?B?R2cwT3NPVFA0Zjkva0JFT1Jmc0NTU1VjM2ZhTVRsYUR2YUNwUGF3d2pUSTRi?=
 =?utf-8?B?VUJONlBleUVxY1VNL0xXQnp3V3kvTnFiS1dDNzlCeWZQN3BUdnZ1RDg1Qjdx?=
 =?utf-8?B?L25IM0FFVzVDZW9ubnZhVjdwa0xjaE5wVlFSbXdFWjU2ZTgvTHFtM0RPZ01o?=
 =?utf-8?B?aElnY0pxcU9ZNFhteW5EdGYzZXVxY051N3I2bVFhOVpYcE8zOFIwTGNlellt?=
 =?utf-8?B?a2xpa3I3ZWxmZHQ2RWtENWlFRXVkRVZOTGZxamhtY2w3bjVBRW1RaE52Uzk1?=
 =?utf-8?B?WWRSU3V6QnMzYnNqT1FGNlFFSGordG5uQzlHMC9NbkkwMm5jektsSm1HbE1E?=
 =?utf-8?Q?Icxc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(10070799003)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TEFIVWNIUnIyMVErSXd6dUd4aWhxdUp2ZEtFMHA5L0RUNHF4U2NyanQ4M3R2?=
 =?utf-8?B?WFJUUnRZQUJZeXNJM0l2dERtYjJFSDg2dGQ1OEwzYXBsSXJBeUMzYVJLUkZs?=
 =?utf-8?B?cm5ZNGs1c29oYnNWeDl1MEl0NC9tSkJMSzBrdHB4V2pCVURiQThlTk9VdUZ3?=
 =?utf-8?B?akZHNGFDWXBPYWVEWUNxbFhMWEtuWnJvakJWUmJpekF6ZEtWL2tsbXA4c2tT?=
 =?utf-8?B?RlVCTStFc1dJYmh4dGh4VkplR3BRRFpsS09FYTNUd05tbUhFUzI3VlJXbkdH?=
 =?utf-8?B?blE4SDlpaHhPdjBCQTlLektOSS9hN1FLUDVKbVBDMkVHclFYRml3NFVrNDE0?=
 =?utf-8?B?M2tRSThXREprS2N4NEQ5aFExSTZvMlljVWhLK1VIcWkreXF0NkNaaTBMVmdT?=
 =?utf-8?B?Z083bWhyUExKMnZldmNoV3d3eG9WOHRjYWZJdFE1amYrZW9kRHpjYytZY2hQ?=
 =?utf-8?B?SVdwRXBuNm5Vc28zYXRGT3BiTmh1L3VTZnAzRHdnd014ZWtXR2Q3ai9ONWRJ?=
 =?utf-8?B?cTd6alVyUkVNcnZrYWh6ZTluN1p4dzkrZWxWL2hMVXBVZDlrS1RtdVNaVFFS?=
 =?utf-8?B?eFgydGY4djYrb0hmNDZnT0pkdkNibHV1Nk1NZDJDcHAySk5saldRUmUzdlI4?=
 =?utf-8?B?eXY1enJGVVJ2NnpPMmwwSjB3OUZiM0prSEJVL0NCNFdJd1FLb2lBcGxrRFYv?=
 =?utf-8?B?TjdiUWhDQkgvQW1BVXFOZFg3V2JZbXZlR0ZkMTdRTHYyRm1zeTdVZnYwYS9y?=
 =?utf-8?B?cTNxQ1RtencydHlNM01kWUUrV00zd1FFS3Uyb1NNeUpFNkd4KzZ4SUluUXR6?=
 =?utf-8?B?R1IvaU4xdXFZSVhJSTlZejdqakZJQ3JuWTFBRm0wNDBmekhPU0E4bXNvK2c0?=
 =?utf-8?B?d2N1YWJJRTh4OWppOGNJVmliYzZGMC93bGZhamJSVitla2RCN1ZSOTJKL0Vn?=
 =?utf-8?B?akVlazhWT3ZzcVJEa0thNndYdkFKMTdlam5LempNRm9VZ1NOSC9VYnBGS0tw?=
 =?utf-8?B?dEhTcUs4QnlpK0pPbDc0UG1iYWs3b05Ed0paWUZ0R2dLTmRkWFNTVm5LMyt6?=
 =?utf-8?B?VXFHT1Jmc3VxS2M0TkJDUEZ5WitPUjVlQzl0WXIwQUZYYnB6Z1FSd0VySnpP?=
 =?utf-8?B?amF0YnhMYXUwVzBDTzRIVlpzZmViMkxqdFNUTjNHWlhoZVNaQzdNU2NZVjdN?=
 =?utf-8?B?TEZ3ZVh2bTcwaUdxS2RwL0NoZUxtZmFaNHZITngxeWc0RTNTUmxZZ0hDS2dN?=
 =?utf-8?B?d3ExdnNPZVliT0dQOTlpdmZDeTU5N3FhaFZHUUNoM3pLK3JLQmRDWFBLRXBU?=
 =?utf-8?B?Qk9DZ1NoV1RPWjV5b2tlb21XaEZZV2hZbnR3cy9QMWJwbk1pZXBNYXFmck5z?=
 =?utf-8?B?SStRaWp5aEhETWR6b211V1EvbUxPczhvcHRHanRJT3lnSWFlRTc4UElQWmtN?=
 =?utf-8?B?QlNWVThZY1JCaS9pMktXUS83cnpUTFZzS0xsdituaTZMemwyVGJQTHRhL0pO?=
 =?utf-8?B?SkdaZGRoMFBkM1VTd2N1dkh5R0pINGI1RzNqYVdleHlKRVhUbXlaeWR6VTFk?=
 =?utf-8?B?ZG5nbFh5THZQNldHUUtvK0tLZDBRZTdLeEkxZTROVm1xaXJud1BrMXhZZUF0?=
 =?utf-8?B?d1phNmlQL21WL0ZrclYzcmQxVWJGRHdBeUs0dHVaS2pvMEZyUHlObmNCankx?=
 =?utf-8?B?U3BHbUhEMVZDNHFMWU5URktraytuS1FMOHRDZGg3Rmtib0tQM2p3MXRPTjRu?=
 =?utf-8?B?Nk9GKzJMamhSeHNkRzZrYitCUzYyNXJMZEFtTDJ0L3RuOUJUbWk1K2JWRmhT?=
 =?utf-8?B?K3J0NWZ5WUtyd1BSUW9MUllLSXFMbXJMRWthN1JrUUl4SE5BMEJIQ0Y0VU5r?=
 =?utf-8?B?UGJ2N3YwS0lZQ0JodmFkaFVISFFDK0xsbDQ5VU45OGVlU0ROLzVEczdnNTRN?=
 =?utf-8?B?MFNmNy9VMkhIQkVxUVprc3p6S0k3cVBmUTV1SVBCWjlSYVJTNm16b09CQnJr?=
 =?utf-8?B?aG9YczB3Z2U0SW54dUM5QlpodmN4R3JkbVlpYlYvQ1ZrZUVqUERBempWSUxI?=
 =?utf-8?B?SzBIaXMxTklOSkphWHp5bHlWM3JYd09CS1ljcUh6Wjh5SW82S2U3RjdvOHFI?=
 =?utf-8?B?NWdqelhJS3YxK0pkelVLcEFxWTFIZDVNQzdNTTBzVHFCMTZNSTVZelUyK3RC?=
 =?utf-8?B?b3BrTWtyWmMrcVlDak04bFRyTS95Z2VFZGNaemw1dHpIcHl6blNWcUdlTjVI?=
 =?utf-8?B?N0VnK1RsaW00QS9HOVdrNThKUHlIc0JiRUhaU29HL1RqbTUxQnJTa2pNMnN3?=
 =?utf-8?B?M2R0NjBxWXFiTDJ6cHA3aDlXOHJWbWwyVE0rNk02SzhnajhyVFJjRU9WejhZ?=
 =?utf-8?Q?zqaziIbPMGLjU/3H5eM9EZHf6CbulPLFJaLgnz/P5yGLD?=
X-MS-Exchange-AntiSpam-MessageData-1: FB1niMQriKc7QA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1dda5a81-f78d-446b-03ec-08de5e711a08
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB3986.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 13:28:57.4116
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rHPWv1AimJtgCa0ancTuhHqZ1AHdGLZSTn1z6NgbZRQNq053+rp0+FLpTo9arzeOTYWpA8u5ix7ptd+ONb5XkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7785

On Wed Jan 28, 2026 at 9:35 PM JST, Zhi Wang wrote:
> On Wed, 28 Jan 2026 11:37:32 +0900
> Alexandre Courbot <acourbot@nvidia.com> wrote:
>
>> Convert the direct IO accesses to properly defined registers.
>>=20
>
> Tested-by: Zhi Wang <zhiw@nvidia.com>
>
> I can see the correct value of the registers read by the sample driver
> from the demesg.=20

Thanks!

>
> Additionally, Clippy was complaining about unnecssary unsafe blocks and
> can be fixed by: (I haven't fully gone through the code, just applied thi=
s
> for getting rid of the warnnings.)

This is because `Bounded::__new` has become unsafe in `rust-next` ; this
is not reflected in `driver-core-next` yet, but won't appear in -rc1.


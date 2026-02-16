Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013055.outbound.protection.outlook.com [40.93.196.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 919172F4A05;
	Mon, 16 Feb 2026 08:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771229132; cv=fail; b=tPfbHl1GbDZayTdswRzYsNPE5PccRQNtwI0v9B3/i6u70gWk42bB5tDFXNByWfpgEx4wX6g5ursgzTmalA3o0N0jyXTcF0lrm2Tu10j/n7IGTRfOouJb9OzJc4nMMKuJ2QOCA4qFmiPfFBpRCrhtw49yLJbtdYapmF9jkwvjmBI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771229132; c=relaxed/simple;
	bh=obXefh6S8juI2ujNf4KX3cCM1Nm7Y/39+LAkZm9KBKg=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=f70P3yPpeb40iHMD05NxYGuOoNo/aHLWOR8z821kfsssCpT2/hkTK4mQ0+taICynYSLQ7SRdm3sfusE1Op/Ncg9OTj+lGd0gRNB9pnzDmNdZbiIcRJhPXwfW89lJXhE+bSu3Ax3VqE9ANNLQcS+CfwykxRez4i4LA4Vk6mssyHU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=fDmNzCr7; arc=fail smtp.client-ip=40.93.196.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="fDmNzCr7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bB/45waVMXB+yl2oUhmlIHuyfCNCnbGFGZLn1HacVtQq7ODEfV5YwnJL1wqqOUGoFiZyvP5CvLOTskTtoadcziOFueF0Pb9ENKeYAevoB088UeCaVpcEtevtQHgzImRLEV30M2uzDLtiiuBR1vpx2+IC5xJkqy5CwSIzJpAozgxH5YcwuiEZYygqDQyqcbWHP7Oe/gKNEKgwLtZW6+FAE8eSj1dyTDtElF922gpC8zy2Uc7hAcXZDD61kCt75ZWWEGTLgI+m2wENiiwFGQfkaXBtKiXK0vFQDkP8ZupHVySYItjmk5mKONWvwM0y5L8yctDbt4XUMCRqQl5sEhtPSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L5BikZhNTr9M9wJaW/ROMdXaTgtMIyNNRLZkGsl9z7Y=;
 b=pXEh+XRP5n41Oi5Wxjfym89rhhmBYVXsm9nHyfbQqjKBmleeRsk/CGOafSSx6RwvTnspfPHk/gZ+iSx3hy5wu6APUSOwac7gZFwPZyIA2lWv4OmfLMLukVHnQ3CiS1AGqXCMBX2D0wml+X0xhHJd4Q8Dbp0rPEb3vruORLGNmQuGPy6lUWKUqtFYdIjg/M1x+mYL6nmPsX8AtOtVRHdWKjQ4jh+bxBVkr/XlaLHJxtYPi761OgK9KwFYyDI1v/mGTGapPmNNvAWF1BlTFEPj2dKWN/KtheoIgG6otPPMyF5exR9EOMF9R0uW+g1LAeJ+/GlXeSztLcd2tExywOPNzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L5BikZhNTr9M9wJaW/ROMdXaTgtMIyNNRLZkGsl9z7Y=;
 b=fDmNzCr7kizyuF7AeK4r5SDRniuKVyOitt5eeIB9IrDnhnolY1ebjs7NoO/4F5Idrv3nWmIsnjtlP1M9rk0wPKwD/IULs1du/B7qtCQnBG444o69uf42OGH8DFD8MRD9g2bO373KB02/JJ2vZFewXt+lrgduKLnCVik0P/jYzS/PQkTvlBOevIbmtmr+8hda+Uzv/TJee/YEGtw5kdxtUuG0F/O2YGtG3hwkomlyxvXh4ran9ni+EpeqsUz6XdUHygvmmDLK3nK3x1cw5WTPO8dL2BFZi8Avjgxvp8cxXZcMEgVLzieh3NwXhn6KAoXHiv3YsueGMZ4WMRz6jGnxZg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SJ0PR12MB6832.namprd12.prod.outlook.com (2603:10b6:a03:47e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Mon, 16 Feb
 2026 08:05:26 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%3]) with mapi id 15.20.9611.013; Mon, 16 Feb 2026
 08:05:26 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Mon, 16 Feb 2026 17:04:41 +0900
Subject: [PATCH v6 5/9] rust: io: add IoRef and IoWrite types
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260216-register-v6-5-eec9a4de9e9e@nvidia.com>
References: <20260216-register-v6-0-eec9a4de9e9e@nvidia.com>
In-Reply-To: <20260216-register-v6-0-eec9a4de9e9e@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>, Boqun Feng <boqun@kernel.org>
Cc: Yury Norov <yury.norov@gmail.com>, John Hubbard <jhubbard@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Edwin Peer <epeer@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, 
 Dirk Behme <dirk.behme@de.bosch.com>, Steven Price <steven.price@arm.com>, 
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TYCP286CA0040.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29d::15) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SJ0PR12MB6832:EE_
X-MS-Office365-Filtering-Correlation-Id: 52edd071-a3c4-40b6-4986-08de6d3224c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|10070799003|366016|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bDZiN2F1bUVST3Jyd3JnQnNDWFZGUGV3NHA4OUMva3QxQXFQYWtVdkNpQU1N?=
 =?utf-8?B?aFlGMGRTT1ZpK3Q1ZmdJa0dTbG5hQUJ6WUFIRlE1TEt6T2hKclpwZ3AzbUhB?=
 =?utf-8?B?YnQ0emdNa2tYblNGTy9peVBFcXRma2IwNndiOEplMVJRblN4Ylg1ZzJ5RHJT?=
 =?utf-8?B?Vkx3VysxcDdkR2g3SVBRTWdpWEJxQnNWYWZ2SmFCaXdiZkRLaWVlR2hPbmhy?=
 =?utf-8?B?Y1d1eVloSHRYSEczc0FyZ29UV29FTVBFNFc5Q1lzblNNRDNrVlZ1SVRyc0pv?=
 =?utf-8?B?Y0Y5NmkwSmkyNHhMRUtIM1JsZkZsMzFSKzVoV0t4OUhYTEIrNXR5Nm96R2dz?=
 =?utf-8?B?Ly82MkFjRk9RZXlmNG9mTTlTRDZBVk1NT291UFJFUVlVV1hFaGdGNFJJd0M4?=
 =?utf-8?B?dkI4aHNJZmdGOFE5TVhSdjVCZzVNZ0ZEV2JLUXI1alk0SVJ5SmsrRDJvSnEr?=
 =?utf-8?B?ZWpHUDRDcCswb0IzQ2FwOXQ2ZHprTUdHS0pDMDBhQk9OeEV2Nmx3S2kwK1Nv?=
 =?utf-8?B?dldobjhOb1M5OWhnRmpzNmhVeFVFTml5TEVrTVZLWXhiZy9wK1R4YW9wRXhw?=
 =?utf-8?B?U2preWhlSzZzVitZY0tXK2x5TVhnK0N1VHBZNGI1Z0hudFN0U2I4MVJ2Ykw1?=
 =?utf-8?B?bmtIdXZWSmlUK1cxcHJiYWMrUnpZV1NxK0UrR0dqS242RGk0c0FTd01XUTd3?=
 =?utf-8?B?alFmZlBDekMvMTF2VXhhSnJxSkVQNjR2UjdEc0NJMzhMWXBubm5qY1JkWW5j?=
 =?utf-8?B?THpod3J3b0FVR1FGUWFINVg2WlhRS2VyRjBmaVc3bnl2M3dTMFZMcGxHM29t?=
 =?utf-8?B?RjJsaXNuTW1meTFXbzJoQjY1NUYwUkNxZlE4OTZqRTcvYkg3MjUzL0MvUlVa?=
 =?utf-8?B?OW1zK1RIN2VWcWFvMm55cHBKZVlRZWpGUlZwMnJjd21uTTdvSUo3SDlxTUht?=
 =?utf-8?B?Wiszb1VMOUFVL29EMjlyeW93amM5aTVWMEpobCttS2lrelVXQ0gvVHNFWHZY?=
 =?utf-8?B?ZEVic0xFMUd2VXFGL0JmaUNUSkxXSU8rMlJ4TURXTGwzeXR0cXYrMk1kWVMw?=
 =?utf-8?B?Zk9jSWs2Zk1OWGI4UHVabWFBOU1WU1NoaFBUYTFncmFkcTdhaUZnbXg2UHNC?=
 =?utf-8?B?cXdqSGtDdGxpVWt5QVVpODUreWxKSmtIUlVKRjY3bitielppWTFzaloxWjh2?=
 =?utf-8?B?RlNveE5jY3AvMVdQNmdnMk9UVU9scVcrby8wNmlXOTNmRHVmWjhmSDNhbFFR?=
 =?utf-8?B?MUhWQktzb09aOFl2Z2RCY0xicHA2c2ZTZEdNUzFKUW5lMEhLSUIxZDliSW90?=
 =?utf-8?B?ekpwWGpqWDdvcm16YTdocW9Ja0Y2a3NGZWRKZ2s1NHgxaHBUcnNBd1JwUllX?=
 =?utf-8?B?QlZGZmp5YVdndXRteFRYdHJmZUNXRGRmOE1WbkNyenVDc1NBRTZYSkwveWRi?=
 =?utf-8?B?cEdVZW9GUmpZanNSVG8rUnpLVTExcnI5Nm1URHliWXR1VFNSZUVRYzBvREJu?=
 =?utf-8?B?WVZrZU0rcGRTNTl4TlBjWnh0eTl4RGdDeVVPVjRDcXlWb3lLdEZWWlovVG1j?=
 =?utf-8?B?eDI4R2RXOEV6UXhiekkvVEJzUkpHenZ6RlR6T1U0SFZQRkJJL0dlOVpDb214?=
 =?utf-8?B?K0F5dEc3bUhLNmxOWEpxb2FrWXBqYmRlTko0RUtEa1d4Q3p0NURRc3g5NEpz?=
 =?utf-8?B?VDZ3VnRES2MrU2RmMGJGNGlLU0FoWk9QSHZmNEFWL3F1WHo1TityUEtMN2g1?=
 =?utf-8?B?MXpZTWdiNFJ1c0ZKRitvYjBrRzc2TFg3VTJrSnhCVEJ6VUJTZncvSkYwdmgr?=
 =?utf-8?B?WVFVMHk5blU2ZW1DclVSK0F4WWJxMzRIUU13VDdXa001RG0vYXNBTlE1NVdS?=
 =?utf-8?B?OE1SWnFVbGJZSUhlMExYckQvd200bEg5eml5Z0Yyd01KUStRb3JjU0hxeURL?=
 =?utf-8?B?RDJldW1jYVNVMFBCQm53cmVvczJ2SXBOY0FWd0kxWlZOc25xUThnQit5Y2dr?=
 =?utf-8?B?RTUrRjErbUVwamVZUzNsVS9rL0RsZWJXN2lqd2VlRjRYc1NpUzlFYmozcGl2?=
 =?utf-8?B?cSt0cThsL0g1ZXBVOTAvQXB0NDZHdTRIVW1GZXNSMWNCdC9rU0FEY0V6SlBj?=
 =?utf-8?B?dFBBUzVMWndDS082QXpnVEJMZ3I4M3hKNlRsRi9kNVM4QzJXcGpib0RjUjJp?=
 =?utf-8?B?UEE9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(10070799003)(366016)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a0JkdzcxYWduMWVYdDVNbVRtd1RBOVBKYWxDRzhjdWZRbDkzVHlmSURuSGhB?=
 =?utf-8?B?b3lKVER4M0Y0cjJiNGhESUV3TTRPekxlYjhsS1lKZVU5b2NBSHRVeFVjUzZq?=
 =?utf-8?B?QWFWdnQ1M3k4Ky9iRjdOZ25RUlVyZDh5Qkh2SjZXcUxCdWlsL09lSW5VMndT?=
 =?utf-8?B?TGxzK24vQUs4Q2NhMWQyVjNKdHhkVlQzdENrekpXN1FOaGVSUFBHWEovbjJC?=
 =?utf-8?B?Ni80VGlVK3plNktCYW1qTlg5T09LdmhvNVhQdk1Ta1VoRVhYOFZ4V1FCOHVF?=
 =?utf-8?B?UzdVVmhRUnZQazhQZnFZbGVJOHdoalZ3eFVVTXVETXFkOVJjMHlrcUhKTkdk?=
 =?utf-8?B?UHJWZWVYT21VSHpsMzFwL2ZKa2NuZGpNbmFvSzJDc0Z1RXF6SGZxaVNwcDNz?=
 =?utf-8?B?SmFGNzg0MFZ3VVNobDdwUlR2YlIrc3ZIck1BdEk4MUc4RkpPREVpbjhpOWhq?=
 =?utf-8?B?ZGZvbERWMHNybzBKK0oyK3poRllFY2J4ZTM1Mmh3M2NQYi9ubEVOUHd4RCtJ?=
 =?utf-8?B?Vjc3K0lGNlY1WnNQLzZDRS9TSGU3NzFpQkhCWmxtUW8ydHJYM1RFR25sY3BY?=
 =?utf-8?B?NnUvb3pqanNxeVB1T1E0blFYRjlXUTh2bzNIT2doQVVZZlU4MHRobTUwU2xK?=
 =?utf-8?B?bGtvTW5IYnVoUWZBWkpKSTE2aWdyM1Q5djhsM0ZPOUtZM2hYdnFIenlyTy9y?=
 =?utf-8?B?SWxuRDdZckcyZTY0b1B1KzliOFlSTnhJSCtqSTZzQzVGTzFnc1JXWkZzWW1S?=
 =?utf-8?B?UlJjQ1FTeHlFdE1ianRVcStURHI1dlpOeC9rc1VjY3JmMkxaQnQ5KzFqT1dG?=
 =?utf-8?B?VFZ6OGYzUFFIQzYwY3hwa2JkWHJpWlVpSHZUK0VxVkRpc2RYcVFRMHJOYlBx?=
 =?utf-8?B?cXZhWWJRMDFCZEhZYkhtaURxN05nLzNwME81d3VwbDBpUHBpNGdHOXJ3ZlZz?=
 =?utf-8?B?ODgzUng5RFM2bmd2ODRsbkxvTmhzVnEwMjhNYy9KZCsyNURqc0lqN2Zlbm5V?=
 =?utf-8?B?WmNaMFdKWTNJcjNjN3c4RHJHWjJITjB3NGZiVVN3ZTVGSkg4M2Y0UGxrTDBF?=
 =?utf-8?B?cEZPOEtzNWhrcHNkTVdKS2lHZ3FMS29zMGs5Tk45T1huZmR1QzBiUGpOR21o?=
 =?utf-8?B?K2hVWklKSFlJczEwK1VvajhMeEVHNTRNQ3lwRm50UW1ZTXIvVzhVbStoNnpO?=
 =?utf-8?B?S3RRbHdQdUFBcjFYZUdZMEJzZmh6Znh1YmE2ZEtjUEVzM0ZBaVg2THloY0Q2?=
 =?utf-8?B?VHJBUVhIRXRJZGVVZm0xaG9JN3hyd1lZdjNLeENPWFlEamd2dDNBakZLY015?=
 =?utf-8?B?MFFOK2pObjlud1dRTEtxQzlwM2d5UmIrYnEvdXB2QWVjV1RKT3BoSFI0djZI?=
 =?utf-8?B?YVZlcTdaU0h1ZTAwMHBKWWVWOW0xSlBZSUU5UnFpWTVaR25tNHRNY2JOZ1o1?=
 =?utf-8?B?ekJDVi9wbXFJWnZjQXBzQWt4dC80V253SVNCTmloT2FBY0hqcituU0ZUOXZF?=
 =?utf-8?B?T0ViRm13b3dRdzVwaXQxYjFRUDZBSzk1RHhtd1FtNUF3SmI0VGdBR3JjZnRt?=
 =?utf-8?B?TVUwZnAyd2s4S3AyMXBCQWNIa292TjlYS0E1RGdDVHBPK0VZYm1URGlHSGZu?=
 =?utf-8?B?dE14WHZhcmRBZGZ1UUxybFBoWVRMcnc3aCt5UXNTcUVhd3hrdFVZdzhWRnhP?=
 =?utf-8?B?b2dNbHdoYlIwR29BWkFpcXhCQkpRT0VIUU5BR29CdVQzc3dJdnVzOVVxWERr?=
 =?utf-8?B?ZGJTMnE4VHpMQlBTZmhldmZIMFpOYS9JalloNm4yTFU3akRacVh5cm01SGkv?=
 =?utf-8?B?allZVHJvcGxOd1VMekZxalBJRlZnK1BsZkE4aVY4aGpsVXg2eGdGczdreEJz?=
 =?utf-8?B?NVJCMituaHpqOURYU3daVGlwYVVRNWd2VWk4M2NyeGI4T0hkZmk0TmVSTVdK?=
 =?utf-8?B?aXdwWTZoVGIyKzFNaGNsbzQ3WlFOZzZ2V0dmMUUxWFB1TGJyUnVWNEd4V2Fw?=
 =?utf-8?B?Yy9ydEZ2K0tNb0UxZVRsMFVZK245UVhoWldicTdvb3oxWTM5d05YWkUvYzd6?=
 =?utf-8?B?MktXY1dvVGRkeU94VEVQVVRBZXpmaHJHTW00aFUwRHhhY29tZXp4TGRxMS80?=
 =?utf-8?B?SU12TVF5UnY5aWRuMU5HQ3cvMGdjclZkdFdlOTZYaDNyZlM4N3lLUVhpYzgx?=
 =?utf-8?B?T2hMaTFJb1FDV1ErQmNmNGc1SThJNW9XejVwdVRrWVg1RWFDcUxBUENLVFcw?=
 =?utf-8?B?TENZSnpySThkWVBvMVMxalJKalptM05WUnlMeHp6aGVVWGRBUFh5bHk1azJO?=
 =?utf-8?B?ZzY5aXN2WS9IVUlGYXlyaXprZ2xFSXZPaVBnQkplZE9qajJ4YTVrNUhPR0p1?=
 =?utf-8?Q?R8kTVljP/lJKMiO4p/z+1igxzU5X0kMOp/Vc0ma3i0KGZ?=
X-MS-Exchange-AntiSpam-MessageData-1: lXVacPY0RSZHPw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52edd071-a3c4-40b6-4986-08de6d3224c0
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2026 08:05:26.7503
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5CoSgHOSS39eEKX9HN+oMyKotrdk1BH/vphCRbVlzpi+3+11ybkg5UfBvxgDYny+C5GVmX/6y21YkL7k6NYjdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6832

I/O accesses are defined by the following properties:

- For reads, a start address, a width, and a type to interpret the read
  value as,
- For writes, the same as above, and a value to write.

Introduce the `IoRef` trait, which allows implementing types to specify
the address a type expects to be accessed at, as well as the width of
the access, and the user-facing type used to perform the access.

This allows read operations to be made generic with the `read` method
over an `IoRef` argument.

Write operations need a value to write on top of the `IoRef`: fulfill
that purpose with the `IoWrite`, which is the combination of an `IoRef`
and a value of the type it expects. This allows write operations to be
made generic with the `write` method over a single `IoWrite` argument.

The main purpose of these new entities is to allow register types to be
written using these generic `read` and `write` methods of `Io`.

Co-developed-by: Gary Guo <gary@garyguo.net>
Signed-off-by: Gary Guo <gary@garyguo.net>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 rust/kernel/io.rs | 243 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 243 insertions(+)

diff --git a/rust/kernel/io.rs b/rust/kernel/io.rs
index b150743ffa4f..6da8593f7858 100644
--- a/rust/kernel/io.rs
+++ b/rust/kernel/io.rs
@@ -173,6 +173,160 @@ pub trait IoCapable<T> {
     unsafe fn io_write(&self, value: T, address: usize);
 }
 
+/// Reference to an I/O location, describing the offset, width, and return type of an access.
+///
+/// This trait is the key abstraction allowing [`Io::read`], [`Io::write`], and [`Io::update`]
+/// to work uniformly with both raw `usize` offsets (for primitive types like `u32`) and typed
+/// references.
+///
+/// An `IoRef<T>` carries three pieces of information:
+///
+/// - The offset to access (returned by [`IoRef::offset`]),
+/// - The width of the access (determined by [`IoRef::IoType`]),
+/// - The type `T` in which data is returned or provided.
+///
+/// `T` and `IoType` may differ: for instance, a typed register has `T` = the register type with
+/// its bitfields, and `IoType` = its backing primitive (e.g. `u32`), with `From`/`Into`
+/// conversions between them.
+///
+/// An `IoRef` can be passed directly to [`Io::read`] or [`Io::try_read`] to obtain a value, or
+/// turned into an [`IoWrite`] via [`IoRef::set`] to be passed to [`Io::write`] or
+/// [`Io::try_write`].
+pub trait IoRef<T>: Copy
+where
+    T: From<Self::IoType> + Into<Self::IoType>,
+{
+    /// Size (`u8`, `u16`, etc) of the I/O performed on this reference.
+    type IoType;
+
+    /// Returns the offset of this reference.
+    fn offset(self) -> usize;
+
+    /// Turns this reference into an [`IoWrite`] with the initial `value`.
+    fn set(self, value: T) -> IoWrite<T, Self> {
+        IoWrite {
+            value,
+            reference: self,
+        }
+    }
+
+    /// Turns this reference into an [`IoWrite`] with the initial value `0`.
+    fn zeroed(self) -> IoWrite<T, Self>
+    where
+        T: Zeroable,
+    {
+        self.set(pin_init::zeroed())
+    }
+
+    /// Turns this reference into an [`IoWrite`] with the initial [`Default`] value of `T`.
+    fn default(self) -> IoWrite<T, Self>
+    where
+        T: Default,
+    {
+        self.set(Default::default())
+    }
+
+    /// Turns this reference into an [`IoWrite`] initialized from `0` and transformed by `f`.
+    ///
+    /// This is a shortcut for `self.zeroed().update(f)`.
+    fn init<F>(self, f: F) -> IoWrite<T, Self>
+    where
+        T: Zeroable,
+        F: FnOnce(T) -> T,
+    {
+        self.zeroed().update(f)
+    }
+
+    /// Turns this reference into an [`IoWrite`] initialized from `0` and transformed by `f`.
+    ///
+    /// `f` is expected to return a [`Result<T>`].
+    ///
+    /// This is a shortcut for `self.zeroed().try_update(f)`.
+    fn try_init<F, E>(self, f: F) -> Result<IoWrite<T, Self>, E>
+    where
+        T: Zeroable,
+        F: FnOnce(T) -> Result<T, E>,
+    {
+        self.zeroed().try_update(f)
+    }
+
+    /// Turns this reference into an [`IoWrite`] initialized from [`Default`] and transformed
+    /// by `f`.
+    ///
+    /// This is a shortcut for `self.default().update(f)`.
+    fn init_default<F>(self, f: F) -> IoWrite<T, Self>
+    where
+        T: Default,
+        F: FnOnce(T) -> T,
+    {
+        self.default().update(f)
+    }
+
+    /// Turns this reference into an [`IoWrite`] initialized from [`Default`] and transformed by
+    /// `f`.
+    ///
+    /// `f` is expected to return a [`Result<T>`].
+    ///
+    /// This is a shortcut for `self.default().try_update(f)`.
+    fn try_init_default<F, E>(self, f: F) -> Result<IoWrite<T, Self>, E>
+    where
+        T: Default,
+        F: FnOnce(T) -> Result<T, E>,
+    {
+        self.default().try_update(f)
+    }
+}
+
+/// A pending I/O write operation, bundling a value with the [`IoRef`] it should be written to.
+///
+/// Created by [`IoRef::set`], [`IoRef::zeroed`], [`IoRef::default`], [`IoRef::init`], or
+/// [`IoRef::init_default`], and consumed by [`Io::write`] or [`Io::try_write`] to perform the
+/// actual write.
+///
+/// The value can be modified before writing using [`IoWrite::update`] or [`IoWrite::try_update`],
+/// enabling a builder pattern:
+///
+/// ```ignore
+/// io.write(REGISTER.init(|v| v.with_field(x)));
+/// ```
+pub struct IoWrite<T, R>
+where
+    R: IoRef<T>,
+    T: From<R::IoType> + Into<R::IoType>,
+{
+    value: T,
+    reference: R,
+}
+
+impl<R, T> IoWrite<T, R>
+where
+    R: IoRef<T>,
+    T: From<R::IoType> + Into<R::IoType>,
+{
+    /// Transforms the value to be written by applying `f`, returning the modified [`IoWrite`].
+    #[inline(always)]
+    pub fn update<F>(mut self, f: F) -> Self
+    where
+        F: FnOnce(T) -> T,
+    {
+        self.value = f(self.value);
+
+        self
+    }
+
+    /// Transforms the value to be written by applying `f`, returning the modified [`IoWrite`] on
+    /// success.
+    #[inline(always)]
+    pub fn try_update<F, E>(mut self, f: F) -> Result<Self, E>
+    where
+        F: FnOnce(T) -> Result<T, E>,
+    {
+        self.value = f(self.value)?;
+
+        Ok(self)
+    }
+}
+
 /// Types implementing this trait (e.g. MMIO BARs or PCI config regions)
 /// can perform I/O operations on regions of memory.
 ///
@@ -406,6 +560,95 @@ fn write64(&self, value: u64, offset: usize)
         // SAFETY: `address` has been validated by `io_addr_assert`.
         unsafe { self.io_write(value, address) }
     }
+
+    /// Generic fallible read with runtime bounds check.
+    #[inline(always)]
+    fn try_read<T, R>(&self, r: R) -> Result<T>
+    where
+        T: From<R::IoType> + Into<R::IoType>,
+        R: IoRef<T>,
+        Self: IoCapable<R::IoType>,
+    {
+        let address = self.io_addr::<R::IoType>(r.offset())?;
+
+        // SAFETY: `address` has been validated by `io_addr`.
+        Ok(T::from(unsafe { self.io_read(address) }))
+    }
+
+    /// Generic fallible write with runtime bounds check.
+    #[inline(always)]
+    fn try_write<T, R>(&self, access: IoWrite<T, R>) -> Result
+    where
+        T: From<R::IoType> + Into<R::IoType>,
+        R: IoRef<T>,
+        Self: IoCapable<R::IoType>,
+    {
+        let address = self.io_addr::<R::IoType>(access.reference.offset())?;
+
+        // SAFETY: `address` has been validated by `io_addr`.
+        unsafe { self.io_write(access.value.into(), address) };
+        Ok(())
+    }
+
+    /// Generic fallible update with runtime bounds check.
+    ///
+    /// Caution: this does not perform any synchronization. Race conditions can occur in case of
+    /// concurrent access.
+    #[inline(always)]
+    fn try_update<T, R, F>(&self, r: R, f: F) -> Result
+    where
+        T: From<R::IoType> + Into<R::IoType>,
+        R: IoRef<T>,
+        Self: IoCapable<R::IoType>,
+        F: FnOnce(T) -> T,
+    {
+        let v = self.try_read(r)?;
+        self.try_write(r.set(f(v)))
+    }
+
+    /// Generic infallible read with compile-time bounds check.
+    #[inline(always)]
+    fn read<T, R>(&self, r: R) -> T
+    where
+        T: From<R::IoType> + Into<R::IoType>,
+        R: IoRef<T>,
+        Self: IoKnownSize + IoCapable<R::IoType>,
+    {
+        let address = self.io_addr_assert::<R::IoType>(r.offset());
+
+        // SAFETY: `address` has been validated by `io_addr_assert`.
+        T::from(unsafe { self.io_read(address) })
+    }
+
+    /// Generic infallible write with compile-time bounds check.
+    #[inline(always)]
+    fn write<T, R>(&self, access: IoWrite<T, R>)
+    where
+        R: IoRef<T>,
+        T: From<R::IoType> + Into<R::IoType>,
+        Self: IoKnownSize + IoCapable<R::IoType>,
+    {
+        let address = self.io_addr_assert::<R::IoType>(access.reference.offset());
+
+        // SAFETY: `address` has been validated by `io_addr_assert`.
+        unsafe { self.io_write(access.value.into(), address) }
+    }
+
+    /// Generic infallible update with compile-time bounds check.
+    ///
+    /// Caution: this does not perform any synchronization. Race conditions can occur in case of
+    /// concurrent access.
+    #[inline(always)]
+    fn update<T, R, F>(&self, r: R, f: F)
+    where
+        T: From<R::IoType> + Into<R::IoType>,
+        R: IoRef<T>,
+        Self: IoKnownSize + IoCapable<R::IoType> + Sized,
+        F: FnOnce(T) -> T,
+    {
+        let v = self.read(r);
+        self.write(r.set(f(v)));
+    }
 }
 
 /// Trait for types with a known size at compile time.

-- 
2.53.0


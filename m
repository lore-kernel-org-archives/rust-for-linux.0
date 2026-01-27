Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012011.outbound.protection.outlook.com [40.107.209.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AADB838D;
	Tue, 27 Jan 2026 09:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769507862; cv=fail; b=JnS3vaG/Zcwipu4/AqpV0rMXIlKOA/TML9Luv1VPJB9nSJv9KDgrgmUTGHL5OYmLt342dDn8/MJdliImxUazGtweHAg4oERMIu9IJGJCHJxzIm8O96HNqjjP0B+za15UrF5jZH1zseII5UAKYIlU6ZKOBmZWziZCAy+jxAg4Gb8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769507862; c=relaxed/simple;
	bh=VZMA/EY8aVgqDCoLax5d3x929yFIQpl/26Ool5Pp6QA=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=iT6Ez75lDsnEXVz7fhumIi8bDh9ivZGt2Pc4lm65moTfWZS4OLRIO/ioh5sKMfsWA0cFOS4+UYZ+eBp+WZ4SFkVOeW/osx+B6mgANpE8fFTlfOsRV1Vp1pqL3eVeDjm/P1s0AoxuqiyTJAUbeR+fkHj0g6gas7n/N/8nNOnOOFo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=rTjuH3eP; arc=fail smtp.client-ip=40.107.209.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="rTjuH3eP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tu5jgyFFjmtQdluzsg1PjiaINFEpaNeixtXlM5WVHHTMdgdiBlXFonARZiFgLOxXIO6LhKyEsKGcqUpuLQgS2WCM4O8aKhB5gmnnQcuNgI62JQE2m4/ASPUByAzyTPKAqP2LN+//rrUm/2WBfxd4EwDUy2AY4KWWsilCp2oe6G5/cFyMFsqtfgYJd9/zQguP+BUn071EPEyFQfcUrnSSwSsLwD4RIie51JeYJBayICJkvsy+70m2pciB11s9kSsvudHAE51FV3B6NGORs0IDwDHfDQaVP64hWixFSXX88QWA9yPoLIPk94P92E8p99GEa4TT7lbQ08u3GLzr94vDvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=35QnSQNefwrXvHMMwnW5d7W6VLtQ4eBLMlPTCG/+hGU=;
 b=Yoi7iuAzE2p+KMArf3O3goWuskWxYgBGk8Ic+EtdWy6WnEZEENdFkiv5iuhYRF/v9BYTruATo8DN3Z+4g+/sfje+MmhspjRkxwxTaKsLhzxl8ZXlvmRGksGgofB0gXPT5t/jtDaMgC6czUKxqKmvSTEGs7yPAA1Ur8Xlz0Yl1nR5/4g5go2vYpS59SSO2jBJ5q2wRA+KlouwKcIF+tDQu1Wk1cxaF3CLVa0e1fbcHMCuN0wtNiQ9CWkC3RsHvy96kpiZPT4C5MuHQzK5F9LXb8eoNW+yFkK1m+hMyVrT1QASi+0eNVMOG1vm2dVAu0+7j8ES680TIClyB66t2inDVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=35QnSQNefwrXvHMMwnW5d7W6VLtQ4eBLMlPTCG/+hGU=;
 b=rTjuH3ePKJRpXQtpSER3Iv8464VXLNc1y295I8hxDc1kY3F6GITPEwUqftppyv4Rbhv88kS1P2Vs7g73hKhSahzpM1+wziRj/ltnkTDtwnFse/LgGZPUaY4C2JudBsl6vQYObcJcHi8/49ykBGdcWBM7BruqwJTKi5qKettK8HMM+QEFOMSiTdKaMxsaV/kmz74Csn+Ct4Zdk0ZZIiApxYtIeQS+LaMfwQxlt0TnFOqv2o8W4qAZHhY8fOwIsxI0O6SCv2I7Q3foDAEvH1unsnHl+D2YxZCG0vPZFIJWbRYkSeY/t7eGGur4Mx3cSBKrCL0Gj2P6ROa8mo6F9qh+FA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SA5PPFE91247D15.namprd12.prod.outlook.com (2603:10b6:80f:fc04::8e8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Tue, 27 Jan
 2026 09:57:33 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9542.010; Tue, 27 Jan 2026
 09:57:32 +0000
Content-Type: text/plain; charset=UTF-8
Date: Tue, 27 Jan 2026 18:57:29 +0900
Message-Id: <DFZA6JOT6OVO.FWRPGW2GN9Z0@nvidia.com>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>,
 "Gary Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "Yury Norov" <yury.norov@gmail.com>, "John Hubbard" <jhubbard@nvidia.com>,
 "Alistair Popple" <apopple@nvidia.com>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Edwin Peer"
 <epeer@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>, "Daniel
 Almeida" <daniel.almeida@collabora.com>, "Dirk Behme"
 <dirk.behme@de.bosch.com>, "Steven Price" <steven.price@arm.com>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 3/6] rust: add `bitfield!` macro
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Yury Norov" <ynorov@nvidia.com>
Content-Transfer-Encoding: quoted-printable
References: <20260120-register-v1-0-723a1743b557@nvidia.com>
 <20260120-register-v1-3-723a1743b557@nvidia.com> <aXCZeVqkDrBWr1uq@yury>
 <DFYK76F1W6QC.CCHFHL1BSD6K@nvidia.com> <aXgpKOHAmvZuMVSt@yury>
In-Reply-To: <aXgpKOHAmvZuMVSt@yury>
X-ClientProxiedBy: TYCP286CA0033.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29d::7) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SA5PPFE91247D15:EE_
X-MS-Office365-Filtering-Correlation-Id: 275b500e-18f1-41e2-b4b7-08de5d8a7d70
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Mjd1Z1RKendEajlTQkwyUm1ab3V0MFBaNlNFWVVQdzRIaFVEazlleEdmRjdw?=
 =?utf-8?B?bmc5MHdyTFNxRmRHQUptRmVDUTRYRUpXUGNsVkREKzBSSjd3WkVGMXJKUEY5?=
 =?utf-8?B?Y0tPMXJtYU1QT1I3QTIxKzdnemtKWjQxT0tuTCtYYVVIblVBQ0d0b1BCWXdx?=
 =?utf-8?B?d1Y5ZFJIWi82cWk2SHhEUVBYZFJQcXdCTkd0Zjk0SmNIdGpjbjBqZ2tVS0JZ?=
 =?utf-8?B?d2JVUE1zZXM2YzNtUyt3YlRGS0FGcVhZTGs4M1NjaXNLTVIwU0RNNTlSamh3?=
 =?utf-8?B?RnVFRktHTUcrSm56V3NqcGJNR01EbzFrOGhYUFgrT0V3TnA3UmFGcHhOaU9V?=
 =?utf-8?B?TVNDcVNGajY5Q2FpWFpjZEY3NHVOWXh3N3BZN1htMmZvMUdtMVYwSlJBdXV1?=
 =?utf-8?B?Z2JCTXpOeitiMExvM2RXV1BDbVlHcnZma1UrUVFnWUdqQTV1YmNJczF3L2hY?=
 =?utf-8?B?Z0ZaRTlpaVd6N01GTytGMHFDNnA3M1BBbkRZeHFmZnNoLzh3anQwYXBxSGJv?=
 =?utf-8?B?RTZob29wN2d2L2R2aG9OdktKR0lhZWFPUmFuNjdPVHYwWkhHdmVmaERBcTZS?=
 =?utf-8?B?UnZHaTlBL2JpYk1hV2VzZ0ZyMm5KL2FJUzFRRS9WSjRJVk9acjdGaXJ1YVJy?=
 =?utf-8?B?STQ5VjdJZEYxb1JTV0Z5ODh2UE1ZMlljTjEyeWMrVjRoV2NnTE9xbXZTU250?=
 =?utf-8?B?M0RVUnhkc2ZuZFNzUWhPNGZPQXFDQjRmVEJSOUVtUUZRUmowbEI1bUJwcUE0?=
 =?utf-8?B?aW4yM012K0ptSEtPeXJUN1lTK2pGQVNsem5YRGlUMnJPbWVlYThIcUF0TElQ?=
 =?utf-8?B?QXhJNHRIMDgyUllLS3JrbDl3WWlSOVF0cmlOQlozTGdWbE91R1ZTVE1PY21p?=
 =?utf-8?B?WFIrWWhXd2p4dGlUNWtBWEtUR0cvYVl2SUV2VTJWalBncDh6TUxWaTE1ZTZ0?=
 =?utf-8?B?Z1hTYTY4clljV09keEJ5czZXN0VjaXh0QWxvUHVFRkY0OW5tcFZzcUpQSmJE?=
 =?utf-8?B?c0pqUXEyTDMvcm54dVVQZFBtc1FmWHN6ZnBiUndpUUR1S0trVkVrT2tJN3dT?=
 =?utf-8?B?WURDZFBUUmxaLzdNSCtVQ2NhaW5kemhyM1luekJBa1lFR2p0T0krRE9lTEFZ?=
 =?utf-8?B?aWNPNE5DUmZoRjRkS2pyNnFhRytOTXcwY0RJc3hRRW5hdDNWZVplRElCTVBn?=
 =?utf-8?B?Tkd4a2VxTjlJUUNkekZlZTFLd3Bha0U0dGtzMVlFL1UvRW9rRkRRaWd1U0dP?=
 =?utf-8?B?L253cHI2SWVhVFRpSXBNaWVGbklNS0pVZE55L2hIYkplbHVZY0Ezdnd0Mkll?=
 =?utf-8?B?eDc1TFFJRnFUeGdwdnZvOGNyT3J0V2xJcjhLOWhSRzV0NVVWQzBUcklhSG1H?=
 =?utf-8?B?RWNPOEp2QVVXUmRJSXpBMWlFNGEvVmZUbHUwVU5RY2JxR29sZXJXbHA4Qnd5?=
 =?utf-8?B?YmM2RWFZVkEwQ2RKRlc2MjQ3M3Blc0t3NnNVZy9jZkRDV2tQeHQrWGVuTkY4?=
 =?utf-8?B?bUZIV1Y5QmtvNjlaTnFieGdiTkhGS0Z2N2lpYTdpSEtOQkNURnA3LzJxR1R4?=
 =?utf-8?B?Q2JnR2d1RDlkR3kxSHBNckFka3JqY1B6aE5HWkRqZmVYRmxLdnoxS3V2YXVh?=
 =?utf-8?B?MmpHQmwvSFR5a05jS1dmbk9MS1cyd1MxR1V3dXZyMjN1THJHbUtPNm9Pc3hQ?=
 =?utf-8?B?UFZpSU5STmdreUM5RlZ5UGlZUFJ0dE5aZ25VNDh1THEvaGhzcU5GNW5PbWZI?=
 =?utf-8?B?c0lRTWtPY0FXcTlhNU9xZkVMU1I5QkNuYkowQ1l6elJuQXpuRitpcXNLRE9k?=
 =?utf-8?B?dGpOVVJpTHo3TjE1WTRlZ1BIVXBEZFZrYUtQQWFGVklmWko4alh3aGliY0dE?=
 =?utf-8?B?Ny90ZzduSE5kVkFCV1NuMWVXUWZpTzgyUCtTUHFrVG5BeHRRS1dOZGZET2d4?=
 =?utf-8?B?MUNQalJFOXVQcXpnSEM4akZSeWhPckIrc0JmcHliR1kwcVVkaGFlZXl1alhE?=
 =?utf-8?B?Tkx3bzVSeGg2TkhzaTY5SmVaN2VlQ1hweVA5N3FBTkF1Zks1RG1YUjNwdTQy?=
 =?utf-8?B?ejRXYTJEWTdERzVkQWJiUDQyeGxxblU0dWJZQTNHVW1oTFppc2tkdmU1Rk0z?=
 =?utf-8?Q?OpqA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(7416014)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T2dXbTl1K0FQbVU1VnpOZm1NR3FFV2MzRE1JUnc1RS9oTllqam81NDk1S0Jo?=
 =?utf-8?B?N1lPeFBUYThTc3FhZkJMN3QxczVnRTF1dDJHRzFZZTRVand2Z0FCd0JHMVJI?=
 =?utf-8?B?ZEU1dER6MDlsZlJpT0NPMFp0TExnZWhUSzZPellJa040M2RXV3NKQjVtdmw5?=
 =?utf-8?B?aUFXVk1keEhERVp4Vk1ib05WdUVBTnFCdW53MHd0UlNzazJOQitWSnpFNnRv?=
 =?utf-8?B?cG5mNEZxOHB3T0MzakQ1L3Bac0pmUER1NUxhejZ3T1dJK0pBcHU4NG9TWHBw?=
 =?utf-8?B?S05HUDlySTVqRlMvdUN2YTFJRkxKalVSUG5VelF2cnMxWmoyWGZrTXZCOGJp?=
 =?utf-8?B?OC9kNHcycjY2UEhUMmtUd3RrTHB3UVBZbk5YNFIrUU1VOXd2QnYvUjR0TS9m?=
 =?utf-8?B?T0hEZUxqSzFPTHY3aUVZMHZTMTJRU05TeVVicy9HYVVJVnVHWCtqSjBQMitU?=
 =?utf-8?B?cFErRkQ0TlNxczRsNXp1VHc4ZmhRTUZVdWsvZmR4ZzVzQktIc2Y1VE9wTjFj?=
 =?utf-8?B?SVBnWW14ZDFWNGJOa1BhdUhDZFk3MWpXYkZIMmVFK3h4Uzg5N3RkUEVZbjMx?=
 =?utf-8?B?Q1dLeURXdVB0UVZYa2FPbmo4MCt1eFB5YngzYTYwSGxURVdpajhPRm9qNVEx?=
 =?utf-8?B?ZkFGVStMNUdmOVpwdUlWRXJhdkxKVkcrUEtOd1lMY0JQZ3NBTEpZeEtmR0d3?=
 =?utf-8?B?LzhPb3dVK0pSWGlja21XNEtGWmJhZ3E4WlBwbDdudDhwbVpnRjJrT1ZyVnVK?=
 =?utf-8?B?emVWbDZaOTkxVWhWWGhzdldndThVVlhVOGVRaWNJYnZzL3cvOC9oNGI3a0JP?=
 =?utf-8?B?RUN4UnU3N1hlcGNDMkxGTzU4TEZuQnFWLzZ0c0VBMDFJSkhLMXhnMlIrdmor?=
 =?utf-8?B?aTFqTjdmTE5zb2cvcVVhajdJSmY0cEg3WWJvb3p2czhMZ0l5eWpldTRaY1Qr?=
 =?utf-8?B?dEtQUFhvaHRHNFFVRDlzM0hVRjNxamxVNC9jMXN6V2Q2K1c2OE9abEFMaWRE?=
 =?utf-8?B?Q3FrOHhadVZ4VE05a3NxaFdTMmdML293ZmIyUWpDZ2RmSUVLZlNHSlQvMVBZ?=
 =?utf-8?B?d0c4WW90VG4rVVZGSW1RQTRnZDRpMkE1WTNWTjA2dy9GaWxvVWpHOU8waDM4?=
 =?utf-8?B?QzIvZTdxYUk1YmZCU3V6d2I4d05RS3BvVnc1Y21KZFdhc0hCa3pyRHlLTzR1?=
 =?utf-8?B?MnBJRFBCMzVackJpeXhhVk1WQ090N0tCWkc4TGhDYXJobE5sNThEU3ZVRGpO?=
 =?utf-8?B?M21qcmZ4Ui9yS0xLbHRNQkRyMGp5cjFwNUdOMlZwVXROWVd0cVZmVEhyODBD?=
 =?utf-8?B?eWE5YWdCak55b1JEbXJzMjU4blRERGd6M252eTZtajNCeWFBaGxUa1N4U2Fl?=
 =?utf-8?B?T0FEQ01kakVQMXdTZVNKa3dOU2lGWmU2aVN2cHhIUW55aEZGakpiU1RKVXdk?=
 =?utf-8?B?OWZuOGczbEp6RHFnZVo4SHh1NzFsV283Wlh4M3RBQkRwU20xT0lVdk1ZaHlF?=
 =?utf-8?B?ZDROTC9BWndqQTJNM3UvN2ZkSmM2dVdsN09lYnYwTDJwb0twZ2taWTFDM05P?=
 =?utf-8?B?YVN5ek13Y3QwRWdmR0ZPMkNmTmZjTWFVck5RbGxObmVBYk9lYUVubjRhcVQ1?=
 =?utf-8?B?QmdNc2w0SWUvMnkzV2NXWEo1SUlHYm5HZlozOVZWWEVUOXJ6RzY4Wngvak1N?=
 =?utf-8?B?Sno3WXdFb3ZraTI1WDZtanhadmtkRE55cjZZZi9UaXozMlJPUUtOWFRXdEtM?=
 =?utf-8?B?d1kyMXJlSnFKV1dlZ3loQjMvUXRLdTNqandoUTVncm1Nc0haekxWWHFOT3Mw?=
 =?utf-8?B?UUtVUHdwZzJDdWNYL1JmTG1uQW51eFc1bkhKekNzMEo1c1ZHVVp0Vkgxanh5?=
 =?utf-8?B?SDVrc20vcFhlWjUwUUViQXBNV2wzWVdwSHE2Si9rQjM5b1V3ZWpXZjhvTVh1?=
 =?utf-8?B?Y2NCK2txSVlpYWI5WEVFMEVqUzJxZXM4NHVvNDBsazJxZksrUmk3WVdKQkpB?=
 =?utf-8?B?T1lDY1ZWemtPT2s1LzM2K0N6VGYyMkZ6Zm50RnJDdURUcmhxMEtIdnV3VWRH?=
 =?utf-8?B?dkhsdHltRytoVFRYZHc2aDRtbVRmOUQvSkF4anZPZDZ4a0ZpYVVLOXZWZ1J2?=
 =?utf-8?B?S1FQTjNlMmVEQ3FkQ0MzL1FDY2wzdFF1TElaZk5vYW4zeU0reG5ZMjhRWk9B?=
 =?utf-8?B?S2RxZzBycWowK3drRTlaaWFHUEJMVUNPNjVGUWJLSWVjOWdKNVZ2b3YxUkJ2?=
 =?utf-8?B?RVFGemhobVZKSU1PQlY1RmR3U0V3bVZlZGlNNWQ2dHhtUUNLVnVsbGxiMlVB?=
 =?utf-8?B?N2M5ak9ITGFxN0xpaHBUelVadkVpUTUzUVpBSzVnajhiV2JXZ1pyOUx3Tnhz?=
 =?utf-8?Q?leduVdfARW8OvdlT3auf+21i+INIvHAKCfWRvtxPo0QsY?=
X-MS-Exchange-AntiSpam-MessageData-1: wVmW6GpmLkdVcw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 275b500e-18f1-41e2-b4b7-08de5d8a7d70
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2026 09:57:32.7965
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L0cSoh7I2wbKfNrMOCht+PzPLJ05AGWc+QG8owMf02HBXK8nBNMWkSTt57KLzu0vAv+68CCeMXst5nOQecyJeg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPFE91247D15

On Tue Jan 27, 2026 at 11:55 AM JST, Yury Norov wrote:
<snip>
>> >> +/// // Setters can be chained. Bounded::new::<N>() does compile-time=
 bounds checking.
>> >> +/// let color =3D Rgb::default()
>> >> +///     .set_red(Bounded::<u16, _>::new::<0x10>())
>> >> +///     .set_green(Bounded::<u16, _>::new::<0x1f>())
>> >> +///     .set_blue(Bounded::<u16, _>::new::<0x18>());
>> >
>> > Is there a way to just say:
>> >
>> >     let color =3D Rgb::default().
>> >             .set_red(0x10)
>> >             .set_green(0x1f)
>> >             .set_blue(0x18)
>> >
>> > I think it should be the default style. Later in the patch you say:=20
>> >
>> >     Each field is internally represented as a [`Bounded`]
>> >
>> > So, let's keep implementation decoupled from an interface?
>>=20
>> That is unfortunately not feasible, but the syntax above should seldomly
>> be used outside of examples.
>
> The above short syntax is definitely more desired over that wordy and
> non-trivial version that exposes implementation internals.
>
> A regular user doesn't care of the exact mechanism that protects the
> bitfields. He wants to just assign numbers to the fields, and let
> your machinery to take care of the integrity.=20

So while we cannot achieve exactly the short syntax above (which has its
drawbacks as well, such as the inability to operate in const context),
we can introduce a new setter than works with a const argument and
spares us the need to invoke `Bounded::new` ourselves:

    let color =3D Rgb::default().
            .with_red::<0x10>()
            .with_green::<0x1f>()
            .with_blue::<0x18>()

This setter knows which type (and thus which Bounded constructor) to
work with, and is much more concise. It also makes it clear that it
operates in const context, i.e. `color` will directly be
set to the final value. Actually let me check whether we can make the
whole chain `const`.

<snip>
>> >
>> >> +///
>> >> +/// // Convert to/from the backing storage type.
>> >> +/// let raw: u16 =3D color.into();
>> >
>> > What about:=20
>> >
>> >         bitfield! {
>> >             pub struct Rgb(u16) {
>> >                 15:11 blue;
>> >                 10:5  set_blue;
>> >                 4:0   into;
>> >             }
>> >         }
>> >
>> > What color.set_blue() and color.into() would mean? Even if they work,
>> > I think, to stay on safe side there should be a more conventional set
>> > of accessors: color.get(into), color.set(set_blue, 0xff) and son on.
>>=20
>> This would just not build.
>
> I know it wouldn't. I am just trying to understand corner cases that may
> (and would!) frustrate people for decades.=20
>
> I understand that this implementation works just great for the registers,
> but my role is to make sure that it would work equally well for everyone.=
=20
> Now, for example, Rust, contrary to C in Linux, actively uses camel case.=
=20
> So, the blue vs Blue vs BLUE restriction is a very valid concern. The
> same for reserved words like 'into'. As long as the API matures, the
> number of such special words would only grow. The .shr() and .shl() that
> you add in this series are the quite good examples.

The strong Rust naming conventions are actually (partially) shielding us
from name clashing here.

In Rust, fields are by convention typed in snake_case. So the blue vs
Blue vs BLUE example would only be relevant if one breaks these
conventions.

That being said, we could also avoid the capitalization of the field
constants to avoid name clashing. Or we could have a const method
returning the shift, range and masks of a field as a structure. But we
cannot avoid adding new elements to the namespace, unless we start doing
contorted (and probably quite verbose) things, like having an enum type
describing the fields and a unique setter function using it to know
which field to set.

>
> Let's make a step back and just list all limitations that come with this
> implementation.

We should at the very least mention in the documentation what members
are generated so users know the limits of what they can do, yes.

>
> Again, this all is relevant for a basic generic data structure. If we
> consider it a supporting layer for the registers, everything is totally
> fine. In that case, we should just give it a more specific name, and
> probably place in an different directory, closer to IO APIs. =20

v2 and v3 of this patchset actually embed the bitfield rules into the
register macro. This is designed to be temporary, but gives us more time
to iron the details you pointed out before extracting the `bitfield!`
macro and making it widely available.

In any case, I will include the `with_` setters in v4 so we can use that
in the register macro already.

Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012057.outbound.protection.outlook.com [40.93.195.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A16BAD2C;
	Sat, 24 Jan 2026 00:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769215555; cv=fail; b=pRI+VrDj/wU8srNErOzrHEYVBWrxeemJRGiBAIOZu3NQWJVFQw5i9cDYmTzYCq6aR+UMnWCS731sh3daBZHWH2BlN7VNNv8kLmOrZFbOYDVSdLGqDCESHmSvq2ubwdNoNH+8VvcnY5gAm5ePdg6r4Nb12zaviNXYE3ir7M63/YA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769215555; c=relaxed/simple;
	bh=s4OI6kUusTy+8ch32VMYnbuHqXTa19Mx+2qvRpCs2/g=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ApRBGH0Ml5i923gC5MyYPNjQA5+zfszSoprOyjKFv4fJMWieIb7D8IzE3UDJ9ni2sHrUz/dI79DkThPkWOa7p8Fws2CBmIJ2Deksu3X9Jxy2i8GH3pldXff+sUXOCHJlk2BANTrKnPNUXT5fYeUGr6zYC5QJWIchL5FJtg4yITg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=K3rDV2PP; arc=fail smtp.client-ip=40.93.195.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="K3rDV2PP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qrkOut0Lb/SZSAGIfHKzRgY8BtmH6fqge864jprqCJ3hnQtIy6BBqzL6//AyD7NpRVxj4Flx9TxZsT/cor3uwRGU8EozDOLsvAnLXYb+PApY4mKiZoo5Gu5SjknY6JRlWHVd8lhal7bxnZCwajmvTmha5Dten9pNr2NedY/zoGesO+dqWvQZ01VmCjz7FAZOwMYp1luY1ylbOSjmLoUJuG4OPUUakHCLJ6refcSQJ6z+iXTcZiWiQty7jActF0RnYkoJSNY064qq7+LWD5Fi/c5yGopwifzYkL8T8Jm9bdj40VIRfEeFuW3BaHbG8UeQEXzrKisRcQau2aV0v+6q7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=za0E6DwGUrboPDhT7JBqclKZzBbOQN2kcENTnsocz6U=;
 b=W3A10d9PxlfHswdnWVlRos9NhB4bgkSo0g9rqYXSaVgHTPDQQsRnt61JlGaySVypReC+XeHiLDO2mLYCZOGJGSdgcmUn9VSv8t1mBJb2yAuN4E+Tg+nR1nES8AtKW6GIlD8R8HibL3YYO0kkDm7/Q40oR3JZ/PlFUwGtTnMDLL++3kvPKcB9JczIK1u+A4W3v14/hgJMQQcbKjiJsd1y5MdD1J+PXyu3GN8yljTr0Bejur+wMxrOZLFiNqoN+CYmOSu6XQGEyJKOT0AfWWe+MjiVDNWdmw0ciy7N9sLK7VBZDYPk8Q7MX2M2DVAMzP9KLs/dy8y0lwDqcmzEcOvzeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=za0E6DwGUrboPDhT7JBqclKZzBbOQN2kcENTnsocz6U=;
 b=K3rDV2PP0Juz5r7QwOp2tgS52uVyw0dCu2aZtDOQf8iTiWwmSJY3cRSw045EV+jJLPc5Up5HtLZd/HjK9E0HRS7LbHek5XYgJw4AgIy6wcFJU8cvok7pWtyqhGv00m+oFfVue4u69VkxolFDzkUjQUqjwM54EmtinHAMAwiLCseVRzl4JLj2l26zxIX44g7wq/xT5UQOIE6sSXCErQo3b01N8QRbkgYsGFq+OskhRO7Qn2AGMK6ThqKoC/Oa/b/mGOgAZyU6F5airL8bioaIBAt6rLbZwGbHACvMs5Ec67sraP4nyenGbeEgQKFycTdpqUi6xgl7dbw8TiqAPtVtbA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 CH2PR12MB9496.namprd12.prod.outlook.com (2603:10b6:610:27e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Sat, 24 Jan
 2026 00:45:48 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9542.010; Sat, 24 Jan 2026
 00:45:46 +0000
Message-ID: <452b321e-f4a4-4b02-8449-189573a132e0@nvidia.com>
Date: Fri, 23 Jan 2026 16:45:33 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 21/31] gpu: nova-core: Hopper/Blackwell: add FMC signature
 extraction
To: Gary Guo <gary@garyguo.net>, Danilo Krummrich <dakr@kernel.org>
Cc: Alexandre Courbot <acourbot@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Edwin Peer <epeer@nvidia.com>,
 Zhi Wang <zhiw@nvidia.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, nouveau@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
References: <20251203055923.1247681-1-jhubbard@nvidia.com>
 <20251203055923.1247681-22-jhubbard@nvidia.com>
 <DFUEH29UJBR9.1I03EHD1ZO88G@garyguo.net>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <DFUEH29UJBR9.1I03EHD1ZO88G@garyguo.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR05CA0087.namprd05.prod.outlook.com
 (2603:10b6:a03:e0::28) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|CH2PR12MB9496:EE_
X-MS-Office365-Filtering-Correlation-Id: e4180bf7-9946-44f7-90b1-08de5ae1e946
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TEpYczJub0JXdWUxeC9jNXFWMVVTaTN2OWk0K0gzaVRTYUsxMHRpT0N2dFE5?=
 =?utf-8?B?OXVmd3dXNXNIdG5FNmNhY3I0TTJBZytRQlg1RldYYTFSelpoQWo2TXdiUkxE?=
 =?utf-8?B?dkd5cWNwYmF6d255Y2paVUdYUStUWUlVNE9wL3pFbzBVcHFhQVZTaFg5dWFX?=
 =?utf-8?B?UkloK3MwWXdUVVM3WlhaaSthMHE3Q0Q4c2lDR0t2bElBUlJMQlBnMGdKOTJ2?=
 =?utf-8?B?SVpuZ2tmNmdwcEI3SWtXY3gwSS9tRC9rd2Y5RXppNUNxeWlWT3o3ZDBpeU9F?=
 =?utf-8?B?aDVEekM1OERHbFlNaDZKdTNOZVNSazZkSXJRbGVmdnR1S2V0ODE3YTRWMXAw?=
 =?utf-8?B?SGNLL2V2dHdrbFB4cWdDTjczTHZuQWc4SG9ZK3JSd3Y2S0VqVnduNjJLbDkw?=
 =?utf-8?B?NDE3TlZLZ2pYdFBNdklQNzczZ3dSYWhoSGg5Myt6Qy9iS2N4bHA0MUpMK0J6?=
 =?utf-8?B?Tmd3dVZmYXFVM3BReStKTkJpNHNzeGlsTWw2aytlUVduV0NtbGVLdzY2bU83?=
 =?utf-8?B?Wnl0YjhQeHQyajRVak5pTWE2UGNFcWVOUENVcFlzejMwb2VaVVRuMWhGYjZX?=
 =?utf-8?B?WU0xTzdJTzJ3VHBRMWl2TndwdmorUXV3c0JKSHJKbDVza0xlc2JpSUsyZ1Rm?=
 =?utf-8?B?eHFFS2d0SEg3ZHl0QmJpbmlkQlBoZkg2ZytPcEpac1BCRjdWQ0xDNTkvTjdX?=
 =?utf-8?B?R0dPNGErd2h0N0FDemw5M1czalNpeFBNSDVwL1E2SFB5d2haVGFCYjRPM1Bp?=
 =?utf-8?B?a0FpakR4ODd0d2lFby83Y0IrSy9Jb1llSEpxbVh3Y2gveWkyNkFpZTdSYVM2?=
 =?utf-8?B?dGlGRHI4YUVYWlg0NGFESDJmUXptNDk2dzRBdktPSDhaMWVoU1IyVU5wOGlY?=
 =?utf-8?B?YmdYeU0zQ3VrUlZiT3ROMXF5c0lJTzdLMGh5VzkvSTVzb0g5NzJHKzdDbWx3?=
 =?utf-8?B?a2tmcGtPeFNFaWV1YlZUR2NUclc3L01vNzRnc1M3WXZaenJPbmVBZE44VCtB?=
 =?utf-8?B?a0p5YzMyZDNUMHpRcXJRWm1oRjBNNlZ5SHViOTVnR0FiRG8rZTRxRituSUhC?=
 =?utf-8?B?Vnh4L3pWS3ErOGdaVW1EdXBKU3Fhbk1aOXNIbm01ZmFIOTliRlE1bnpzREpL?=
 =?utf-8?B?cS8rUFpHZFpFTmVDWDhjTmVuWkhKS3pCUEk2c3B6eXg2U1dHbTNTR2RlelU4?=
 =?utf-8?B?bHRjaVY4QzIreVNRaW0wREdHNG1WeXpuMDkrSjlOVTNRa0pFSDdaSnQwQ3ND?=
 =?utf-8?B?OVcrbHlVTStPSG5jVEFneE4rUkY4TW51Q1VoN3ZTZXF5SUN4SGNXSG9mWUtY?=
 =?utf-8?B?NjFibXNuR1hPam5YZm9oYUYweS9vd3RVbW1TYW1Wc1gyL2dWL3hIMFB6QmRX?=
 =?utf-8?B?eGhlK3FDZy9uUVhuSUU0NVhUODV0My9CWEtQYjJUYTdaZG91aERHVy9tODBr?=
 =?utf-8?B?WnhjTFRQcDg1YWs1L3Q4c29pdkVsUU9aMXRsUnNlb2dkQnBFOExFZ1FlNVg0?=
 =?utf-8?B?S3drbFBWQytFNVgzbUo2RW5NWmVVRkxGYk91YUVHNjlxQTNIUDlSTjhGMFBU?=
 =?utf-8?B?anpxcnV4dmdCMDlpU3ZWdDduazhTRnBqUjMzTVdEN3dId3crWjZNZk9VSDE0?=
 =?utf-8?B?TGJpNzZLcEdNUmlWV0hMTXJLL284Y3lwSjJGd3RGWHFBTGRiMHZGQjdXNElE?=
 =?utf-8?B?WXBiMy9TNVdXYzgxZnNXaklVQXFWNjBxTjV2Zm9tVmxTQ0ZDZUhQUEl1UkhJ?=
 =?utf-8?B?Uzk2SE9MV2ZWdEhqcnBJSGtnVFZsb1JxNTNnRml3bCtYN0VXRmtkM29FTUtC?=
 =?utf-8?B?TkIvckF0c3VtcVRtMVI2QWtVYXFqK0dWb2pqRG5KNlZSQWI4Ymp1N1VUUkRN?=
 =?utf-8?B?aEQ1aXpNQ2NLZFo5dkhtZTRERjllSUdobHVkZHc1cFBocGVTZm9ZOUZiZG9y?=
 =?utf-8?B?SjIrWlVZeFd1QW1ReG9VV01COXorcjZiaWdwcmRWbzlVelI4a2xjMjVTMEln?=
 =?utf-8?B?TWNiUFgxem8veHA5cXRRNnZKM3ZrZW13ZVJ6OFp0WEVJT3dua2ZFYmVKRmd3?=
 =?utf-8?B?ZXViTnNPMVZoODFtL3A2Rk1QQXFON1NhMzJtZ3EyeWxLRjVCTDVkYlJNQjdk?=
 =?utf-8?Q?lUCk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WHhoMFJKOXN1RERvMXY3NXZpOENIZG1mTXA2emNrSXhKNXhRSit1MlRNczV4?=
 =?utf-8?B?ZkpKL2p4eWwzUFdVQ3d2OGcrNXFBaWJOcWFkTTNTSEZnYzNHODRSWHV3L29L?=
 =?utf-8?B?Ym16TlZvS1N3UXp1Z25vNFZhdlVHRHp2eVZ0MnR5QTU4a1I5cFhLSXdMV292?=
 =?utf-8?B?SXB2SmtGNGh6WEtiUnZBV3Y3cHBHSllBWEF0NS9IdWJtY1VvV3k3TnphakhI?=
 =?utf-8?B?VmtJVFNHZDhpN2FpdGZvZlRxWDQweXE2anhXTVl6Q0xEb1lwR2xaSW4xa2Nt?=
 =?utf-8?B?cUdSWnc0cy9VNDl3eWNPelZNanJqKzdQRTd0Q3pBS2x5SlQwcndTai9PRlI3?=
 =?utf-8?B?dGhaSWVyMjB5V0xrS0ExMUo5c1ZXT0tNYytFTW9ISWRXOXVpWWdWUFVOUkll?=
 =?utf-8?B?ckRTeE5kZDdXcmNZN1c3ZE5oZFk3VkNpMTF5ODVoMlE2WFM0NHc5Kzc0a0ZD?=
 =?utf-8?B?NjVhTzQ0b2ZFWDVrcHRQcHJoOXNvNnp0cVEzbUJ2Z1p2Umg0WUZvcldpd3BZ?=
 =?utf-8?B?dGJMNFYzNHVKdUVSQWZXNVMveDNlNm1yK09TaG9nYWxZUDNQenVmTVZDU0Zm?=
 =?utf-8?B?VUhFbzczTW1Jemx5MVg4Zmd3SFJBWXZtOGFKV0paYmFNVzVHSDVhWmsrKzhq?=
 =?utf-8?B?czZsK2MvdzZxZmlsb2kyWk5LYTNkVnNRRmw2K1ZyeE15ZVhiSVVIVjBacU5M?=
 =?utf-8?B?alFSM25kWUFBL1ludWtxZnVmQkVjN3dYVjQrR2dKR3BNalZPQks3VklvY25w?=
 =?utf-8?B?c3BYclpZTWFWaDY2a0dYMkVDcTdobGJHTWxXcTF5dEFiVmVYU2MveUQyMnB1?=
 =?utf-8?B?dFNnYU41alJsUXFqcXErdDkrR0l1dWhxT0Zqa0gzb2hocUdObmx3TG5GSTdZ?=
 =?utf-8?B?MUI3N1VsS3RBQ3k2VmFlUGdNZXNybW1xTy9sckNITmgzVHYrd1Vscjh4eHlp?=
 =?utf-8?B?MGx0MUtCZXVBMDZubHhDWTBodHJtdjAzRzF2djVTWEZ1KzR5VVoyOEhtakZG?=
 =?utf-8?B?NTdsVTBJVlZUUnI0ZU9RbXhkdUMwR20rUnlWemo3M0M3RldGM1pQQ2hXcEo3?=
 =?utf-8?B?RmJRRHR5UVVmemFyZXZ5YnhyREtlQ1ZlUmllckx3aUI2ZzJ6Z3N6T2lvdGFq?=
 =?utf-8?B?RE9pZ1ZrU215VmlnRFhMQU9hTkhBZ05QajJ2c29KK01yQmJnb3lkZkp3ZFVr?=
 =?utf-8?B?NVRpMU5ydWd6cmdmT2hsaitKdzVZaEZmaEJ4REdBOVg4c3V5K2tJSVZ0SEhP?=
 =?utf-8?B?K3VtalAyMnBTNGJwK2w5SXAweDZSODNSQzY0cE05dTRtMFFsZ3MyYUp4WXlN?=
 =?utf-8?B?cUxEOGVjUm41cUFFWmFFR3ZNSlMxYXlreWVhdXJjQklRL0JWZEplYjgyRmV0?=
 =?utf-8?B?MDR1UGhKUVRYWURwZlZPTW1ZcCszVHdPZmpNVnFPKy9WYThVWXcwb1JSSi9O?=
 =?utf-8?B?djRFelZoaWxJVTIxTnk3UENWdWZ4eGlJSjdDMHUydUE5WGM0bTFRcENOUXYy?=
 =?utf-8?B?aHQyK2N5T2RPMDRTcEFpMnlYUUJrbDd1V2EyTkxLanJMSzFRQm85MHpCNk9z?=
 =?utf-8?B?MFRvVWFTOXppK2FSUkR4eUc4ejNlZ1ZFakUrclpxOCtGNHVwejhHRVBRN2hx?=
 =?utf-8?B?NTZDOEVYZ0lvMWdOS2FPOThPL0lUQ2IvUmlPWnRMMk1BblR5VVdkWm5kSFRW?=
 =?utf-8?B?dFBKbkdaeklnVnhyem5qRVJjZDhMbktVc3lveWhzRkpERW9IWEdpblpERFNW?=
 =?utf-8?B?UWh2YXJabSs2MHluZFp6K2pRNWNkd0h3R3pDTFRQZ1ZwWEhxd2JBdVZGZWcr?=
 =?utf-8?B?dmNhQlpJK2xjNHNBSmFaUS92Yk5Td3ZJVll0QUlqdmpjckZCUFJodUE1Z2RS?=
 =?utf-8?B?UzVlcjlRU2ZTV2duN3RPU3NJUjZsbzA1SzB3S3VGQ1k5M2FGMjkza2hacHV3?=
 =?utf-8?B?NllxTTNTaHZlWWZEeTNWUm0yWFF5bWt5UG1mZ1hFUm1VaHRxVGJqM0hmT1kz?=
 =?utf-8?B?eGpSdnRJZ0FFT1lERWh0enhBR0RXRDgvdy9VTVB3VkZWQk9oVnFrUm85K2Q3?=
 =?utf-8?B?djQ2WGptK2tidHp5RTU1Z0FXczhsL05EOGNVYS9BT05tS1o1Q1hscE1LVDUv?=
 =?utf-8?B?YUhyME02cVd0RCtvKytDS1dBT3kxOGxYdnhOd3VCM25qRjJ3a0ExdDREeDlR?=
 =?utf-8?B?TDJJUWdQb1hoRU1lVm01N0kvVnAwNGExTzI5RG9qNEV3VzhVSjRiWmpiZDBC?=
 =?utf-8?B?Ukd5ZUtlYklFOTNEVDJ1MTFaU29GK1NTOTN4YXNXMWpQMlQvQ21CUks1S3Ny?=
 =?utf-8?B?UFRTdnY5b0RMNGJqdjFLNXd3RjVNbGRiaWg0dWFzOTYrNUVkVHJtQT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e4180bf7-9946-44f7-90b1-08de5ae1e946
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2026 00:45:46.5588
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: llPLMUXZdJISBHaFxA/5JhwL1QGEml4m64erDg0HLDccUyDfT/UeMxkCb2DwU5a+hSs9DqjYGjnesSICZB81kw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB9496

On 1/21/26 8:15 AM, Gary Guo wrote:
> On Wed Dec 3, 2025 at 5:59 AM GMT, John Hubbard wrote:
...
>> +        // SAFETY: hash384 is a [u32; 12] array (48 bytes), and we create a byte slice of
>> +        // exactly FSP_HASH_SIZE (48) bytes. The pointer is valid and properly aligned.
>> +        let hash_bytes = unsafe {
>> +            core::slice::from_raw_parts_mut(
>> +                signatures.hash384.as_mut_ptr().cast::<u8>(),
>> +                FSP_HASH_SIZE,
>> +            )
>> +        };
> 
> This can be `signature.hash384.as_bytes_mut()[..FSP_HASH_SIZE]` without using
> `unsafe`. Same below.
> 

Done. That's a lot less code, too, great!

thanks,
-- 
John Hubbard


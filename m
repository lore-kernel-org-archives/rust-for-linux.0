Received: from LO3P265CU004.outbound.protection.outlook.com (mail-uksouthazon11020127.outbound.protection.outlook.com [52.101.196.127])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E0B8366DD6
	for <rust-for-linux@vger.kernel.org>; Tue, 20 Jan 2026 16:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.196.127
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768925055; cv=fail; b=hAZ4euIqh6WiKMviWGdrxHaBllaXDOkw4T84kTrVABrkUQy6VAyp8heIco+3cTk7ck5/n5sEtvY3a2pMz1RXl2NUnqDXOILuCqNA7dHul8k1NdirqfqlAMjCBz5odxY6xredShiELFLuUwiQ1jNRAZoU0INkYspBvOBdhWL1DQo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768925055; c=relaxed/simple;
	bh=yMHCBNAiuumdneMtDYzqwlJuOyALLvJWSgJ/Be37i+4=;
	h=Content-Type:Date:Message-Id:Subject:From:To:Cc:References:
	 In-Reply-To:MIME-Version; b=pewDiYFvgiFVaFbIhvpFZOb6iLOBkn/NqOtMxLxjRPMfWc1Jb0aha8Nna8eWZopcop2FeA2mZNrYn+YN3r1LvgHgY0gBz1Z/X/4I1Bat7oYJWfqOUdkRoVrual/QyS2b+h8hyVemG9mG91D8BQNPb7v/zhhlrG7m+38y8n10NHo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=UuaGYYR7; arc=fail smtp.client-ip=52.101.196.127
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="UuaGYYR7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GSjoy6UUrQ5E1EnL4gxv0OB/bBGIYHiaHHRhni5l9b8Sv0jMSQnayYlf3m38G9cOUcwmnIteoZuTz4ePYNDmxLOMMSx8Y61AsIdFigPSSvxdFUjOOBhCtqdQ49/MI2XgVrecbeIIyJfpLXs3vkiSYRvY2v9QFosOYlk86/5gfYgUoig1fWkwZRN8R74nWmOAAYnFO//Pf0NnH5fVyBMc2gFi2usV8a1fYrA6t0H6mKFxlFjYvxEEn9tqr3nh6ng+Z5zD03dwJw68x/YRxPmQYP15I525rNIpFrGn/akllSybaXLyeFpxZRxhEAD/EmiCfGsY/ThxQPlbwCUoe+sblw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dOA+5b/nm/dLXr0Vm/0qaYOwIIo6UApufHXcpl+2+5M=;
 b=n/FpYVt1ZFGJK3XFzroqpeLghTm+9zqWACqcC01jBkRlf7vJ55TGtEFxlcJ5/SzuP0ppqERefVlgYxyfRkIDtDIXJDrNUrODjLMy3+DpIZYJylxb/5hrod8BqXoWbxZpXKqDqIgd6vIX+zFj3MLh/eycOq3qCv3XSPXSqbPKr3+LRMILLd6rAc/7Td6HQ3i8L76KMBpP84O6Earmq6YAHKU8E5pMj20nAga0rfCDEPYRfAduhNXlXcF+Ikvy0d9bRJHznxYor5FUSACupQSFl40Tyw/+96Ey0uZNgbsJqHYXO3VzhMcnlVO58ePQRus57r3WKp7sz7JxSowxkGocrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dOA+5b/nm/dLXr0Vm/0qaYOwIIo6UApufHXcpl+2+5M=;
 b=UuaGYYR7kExaj9572IXo/CydACEN3WfCKp76MCwwaLyKs+XSH5gVDm1OtNIpmJ7Uk0rVjwrZo9yJovrLVYtYMc6emtI8bgCUiwAJn1IvEk86OQ/BZMtT7nSca6fwrKinIJpRCuwciWxRQ0lKTflJVy8WvS1cPXhVSijuXrtBdD4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO0P265MB6375.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:2c9::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.13; Tue, 20 Jan
 2026 16:04:10 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9520.012; Tue, 20 Jan 2026
 16:04:10 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 20 Jan 2026 16:04:09 +0000
Message-Id: <DFTJLHEU0B1I.30GBS9E132RJ5@garyguo.net>
Subject: Re: [PATCH v2 0/7] rust: Replace unsafe core::mem::zeroed() with
 pin_init::zeroed()
From: "Gary Guo" <gary@garyguo.net>
To: "Ke Sun" <sunke@kylinos.cn>, <rust-for-linux@vger.kernel.org>
Cc: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Danilo
 Krummrich" <dakr@kernel.org>
X-Mailer: aerc 0.21.0
References: <20260120083824.477339-1-sunke@kylinos.cn>
In-Reply-To: <20260120083824.477339-1-sunke@kylinos.cn>
X-ClientProxiedBy: LO4P265CA0324.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:390::8) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO0P265MB6375:EE_
X-MS-Office365-Filtering-Correlation-Id: f91be73a-2e74-40be-b774-08de583d8c4e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|10070799003|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cVJTUmZ0R0U4T1RQd21qcE5XU2hva3d4RnFmVytYQm9GYXIwamxwVUlaN3VM?=
 =?utf-8?B?alBKMmFHM1cycUx1ZTRjblJPNjRGWHFJb2MzL0RpSlR3Nk9ka3F4OHIzcEla?=
 =?utf-8?B?V2h5ZnJreCtGZDA2dk1TTHBYa2pMankrV2RZNzZoWHM5S1lXSFNYaTRsMmF1?=
 =?utf-8?B?R1l3OFU5SGZQYWVaQWtPSDg4U1pRd25MV2xpN2puTk5ic0UzYWhrTzJFOURE?=
 =?utf-8?B?M2lUc2JRamxDNlVYZkptQy9TN2FSSW9pSUprV3dMeUFlZE0rNTR3RjlLQVVl?=
 =?utf-8?B?NXZ0Z1A4bmRjZzY3NWR6WTlnRlcvbjN4dUI3UjVhRXBpV3kzVi93b1lmRktE?=
 =?utf-8?B?UzMwNEJLNXhMVUdYT1NjdEpDQ2dQZGNHUUVWanNiWnFFaWZoQWU0T2lZWW42?=
 =?utf-8?B?Ny9mUEJLT2RoRzc1M2pFOTFKQi8wNURhWWgvUkYzb2gyclV4WTM4NHBJSWR2?=
 =?utf-8?B?anFpVS9ZSVJSNmZCS2kzV2x0akVzK01SV2lrTWpDUTI0NVNOQkx0UHkrQVlR?=
 =?utf-8?B?cGR5TnhSc0hSVXNYUHR6Y1BxVVJLVDY0em11S3UzKzJablRsSmlGTWRid1ZB?=
 =?utf-8?B?c2lEZnNqT3hJOCtORDFwQ0owVjJFNlZGYjg4bTI3VTlrSkcyOGcvdmIvZjJZ?=
 =?utf-8?B?YWhlZjNUU2NrMGU0NzVuV1V5ZWE1TDZnZ1BXS0tyeEhMc1U3SHdGOHk4TFJt?=
 =?utf-8?B?SjdLdTZXY0ticzVMd1pmZnVWK1E0SzN5dUtqWmlzVmN0eFV1YzIrNkFxeDZ3?=
 =?utf-8?B?cCtTaDkxS240VWlPUEVpN1dCNzFWemhUU3V1NTUraHZmYnFOZHljUnQ1VEd1?=
 =?utf-8?B?V0ZLMm9YcFpPeEZndHRtdEU1V2Y0WHpwUlQ4SXR4Y0lrOWppYlFaWkFIeFJ3?=
 =?utf-8?B?YXZFL2YrMHh5YVZpY21BWFJEMEhoZkVYditNT0JtRmZheDBlMXRXeWUxaElN?=
 =?utf-8?B?VCtFN0JGY0YxZmdYV0wvcHczSzFCWVFJbldIQW1YREJDdzZ1OTd6N2hsRG50?=
 =?utf-8?B?N1NJZk9XNElUNnd4U1JIME5PRFlGTVVpYTk1V2hXWk1PZndtb2wvMndwbVFK?=
 =?utf-8?B?QURpM2FpTHpDaGk1ejQ4Y3pVUDU0Qjlaa2s4dU1iMS85clJoNkhscTF0NUQz?=
 =?utf-8?B?VVpoU2FNcVJEMDl2WjcxMm82b3dpMVNSZUFqZm05dnA5aWEreGhzeENOTTJh?=
 =?utf-8?B?MHRDcU41dWl1dEV1Z3JMelZTbnJFa3FqOEN4UVkrcEVsK1ByQjkraDR3Vmdj?=
 =?utf-8?B?THNDN3RUdDB3T2xDcHM4cXFUOUIzU0dGc0daTWovbk1OWHNnSE5zWTV0NWxz?=
 =?utf-8?B?TTlYV2VVNktmUWVZcmhzNkNXNUlJSE9zTGF6S2x3dGtWMmtCdHZJNW96a2tQ?=
 =?utf-8?B?OHBOMzJHMTJIK2ZmVzVjSWFhQXFTUXpCeHZnVlVhak4rTndKdnIyaHgvZ3Z4?=
 =?utf-8?B?YkZneWw4RGZBeFF4OUZVK2tITDJ5akZObnkweC9nT2VzTkpyL3psTlhuRzJM?=
 =?utf-8?B?MnB4OXdwUG9qSWQweG1MWEhJYjJEeEhwQ1ArMFFSWGJnblFzWEZhdDVrenpW?=
 =?utf-8?B?OWlNY2UvcXRRRWVsZVhVa2RZejlidnZGc1dQRzNKY1Bma20rditDNUVoMVly?=
 =?utf-8?B?RWdXcGpDQmtyYjhpTDN3eURVVjQ1dFZ3TThmRVJ1K0hnbVdoR2Q2YzVZY2g2?=
 =?utf-8?B?NjIzT1ZYMVRDdmp2UmtIOGJETm1nVmlQNGtMcjJJU1JFWDlleGlhb1hZaDkv?=
 =?utf-8?B?cmZlaWpxYXJOa0lnL3lwNXRyTDhGUWlpYjNqRHlPV3FEY05sNkRTMUxBQ2sw?=
 =?utf-8?B?OUNmTmpmOTllNlVvY0RwUDRnTlZMdlJWV3ZmZTB6VEttOHJMTjhpc2VJSlV1?=
 =?utf-8?B?NmlpK1U0VFZYdkF5YjFXdGZMdE5VTjZ1RHcyVkVTSDhhUHVNeHFPZ25LZktX?=
 =?utf-8?B?cEN1Ujl4RlhKVThLVE5LWGt3eGhGTGc3TlpFcmNYV2dpZ1R6Z0RQQVBtNTl0?=
 =?utf-8?B?dU15UWI4RWJIaGYxenNtWTFxdjgvZGd2RWVncTVlTkROUk8xSUZycnppMGYz?=
 =?utf-8?B?b0FqT3kwK29PcGlicHJIZUwyWlF2dlgrZS9uR0NVUVMvV045c3ovWnRVcUFl?=
 =?utf-8?Q?GO8Q=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(10070799003)(1800799024)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y0hSSUVBcUJjRXU5NkxtTmg5d2dyVVc3M0I0SUlQUFV4UDNsQVpzcFBnbTBK?=
 =?utf-8?B?ZHVFRWFSMi9xcUh1eDMzRHdwYkxDNm9GOU5LSlNWYmVJajI5UUdlS0IvTUF1?=
 =?utf-8?B?NDJ5cUg0NmJsZTJQSVpLNzlFd3ozWmxrZnAzVjVodEdGN0NDR01TTTJuNzFu?=
 =?utf-8?B?UmJVK1AzdkxOd2JtMk1kMlhqejA1N2lqaENTbDMzMGdRWHBiS3MxL2Q4cjdu?=
 =?utf-8?B?Rml4QTByakhleUV2Vi91R25abTcweW0vNm0rSFBYM20zb2NUdVBnMVpLQ3hy?=
 =?utf-8?B?SHJHYWw3M1p3SWpHOWxMUHBWZXRsd1JOaFV6Nlp3dXg3cyt4RkpVb0J6eDhu?=
 =?utf-8?B?cDdyOUdZclpsVGg5R3BRUGNINEthNjVYL1RKNFVFYVhRdGdMMkR5UXJvUzkv?=
 =?utf-8?B?YWgvNEs4Q01HM1JCTExwY2RHeFNRK0F2Q3NTN1NqeitMM1ZDRnBCYXE5MkdH?=
 =?utf-8?B?Y0xJNGNrVE9hdVFIN2I1WnYybXZPdzlLVmw0azIyRlhHOGkxcXd1Vk9Cdy9W?=
 =?utf-8?B?R01KR21DN0VoV0RiNUxxT3pYRWNFWkNwZFN5MWtzVEM5VWJKMkJ6aEFHRTlu?=
 =?utf-8?B?TWEwOWZRNWpYeCtFUnpBYkErR0F0K2FvOE9VOGtGSGs2R3FWZ3NjdnJXbHhY?=
 =?utf-8?B?dTlJeThkeVhUL05XNGQ4QU5HeC9LWnZEWlhTTnFSMTJQL0ZKaTFQOUhHWUZD?=
 =?utf-8?B?cnJqOW9OcmRlWnlkblVjRDA4QkdzNUkzMXA0djBEbVhIYVlwbm01SVRPenFO?=
 =?utf-8?B?ZHJnY1pFamlpYnJCZW91U25XeWZLK2Y5U05TbWEvNzFTOUtSU0NOQWNiUTUw?=
 =?utf-8?B?dThNTmdoWkFBWUxaYjZzRDU1a2E3U2h2WHptOVZxcVpuWjlHTnVaZUVwVHhZ?=
 =?utf-8?B?UTJMVVBnVWZsMENkN2RUdGppNGFITE9jaVNoRGFWSzIrUDQ3aEcvZHFibS9v?=
 =?utf-8?B?QUd3VmYyVkZkbE9XcGVPRzk0am1KRFJ5YzM3clpwdmFlYmc4dFA1UmRwUVIv?=
 =?utf-8?B?cUFyRFp2a0JHN0xMakRVbUhVdTF5KzFuSTlNMEQyRUNEMGZRNXllVUJIY3or?=
 =?utf-8?B?dm9ucUFpTFUwdXpsKyszeW84c0RMaWU3bEwzdU16OWt4OG1FR1JrSHMySmkv?=
 =?utf-8?B?NkJENWVlekJaWjdTY1N3K2UySHhRYXpXZ1NxZmEzRGJpazVkMCtjME5VR3pm?=
 =?utf-8?B?UEN2TzJyTUVjbDlXT2dBaVVoRnZ1L3BaRDM3RmZPN0tQclM1c0FuSDJyNlNs?=
 =?utf-8?B?ZE9CRHVuRkczaUpSRmtPaWwwMEJkQlY5QUR1SzdrUDlkV3lueGxhZ1ZtWXBC?=
 =?utf-8?B?K3dhSGRvc1pWdXlxQVN3MEN6ZlFQL1lOdXpmM1ZYdGpuWXR2Uy9rYTdxSEVn?=
 =?utf-8?B?Qkw2VjJQZXEvYjBaYjEyMnBPQnREK2VBb3Q5NkRiaGJzelNZMUVUL0dGK01X?=
 =?utf-8?B?bkhSLzZsREhONlk5UGVESUN4YVVUVUgyeVlwV1VVbmdaUlZlOHpldjFvYVBh?=
 =?utf-8?B?TEJLYVlpTEMvalBZY1BWRDFONktyaDVjWDlJWTg3TDIxT0UyTVR5YTF1TU8w?=
 =?utf-8?B?YjBrWDFkRDl6eHpEYklEQTNoUVdOYlU5UlVNVCt1TFdEa3NBUW1FSXhvZWJr?=
 =?utf-8?B?R093Z0xpVWZIZTUxeGk3OHl0c2tuZ25ReHVIOWRnM2I4VUdHWENaVXFxYjh4?=
 =?utf-8?B?cDdoTzR2KzZTQ29ZTTQxd2FHSlo0OTllL2lUNkQyZnM4SVZmSExtK2NZVDFY?=
 =?utf-8?B?LzNWV0NidXpua1Y4RmN5WXNnUFJndkpFY2UyZnJZenROd2gwVUVQS1NaMVpw?=
 =?utf-8?B?cVZrV2l1WUF5Z2hUMk9xVmMxRVhaRmpFcFpPSFYrUDlWSm5Sb1J4UTZtOHVp?=
 =?utf-8?B?SDNJUzh3SFNObVkyRVpYOWl1eVVIcjZERnI0c3hRRUM0aGlUYWZjMmtjNk1t?=
 =?utf-8?B?UjFkV1dqRHZEd2dGc0VvOUk4bEI2d2dBbHdwNFRaZWc0bTlPb0xNcjZ6ZGlE?=
 =?utf-8?B?OWtKZm1CTzIyd0lXaG9yQzdWcmhCTUYyRHdDa0VDemZEcUU0aFdlRkhqclpM?=
 =?utf-8?B?YnZyKzIxWHBxV2NWL2EraXliTW9rSmhDNkJYRHRBL3BBYzltd3dMTURRUk1t?=
 =?utf-8?B?MktKUEViUTQwend0bVJoY1BUbks3aXpyZ2JSVzFUUVloU0Yrc1dENnFmZHhq?=
 =?utf-8?B?Z3R5WmxuNnQrWmdtVExKWkNPZ1BYVkJGWGszaHFlbFpjUGd5TWZpeTJyekp4?=
 =?utf-8?B?N29QdmgvSWFvUWp0L00yU05vWHFFeWhLRzVTaitrT1BwTEwrMnhrRlZpSjh3?=
 =?utf-8?B?V3VEMHIrM1pSRHplMXVXU2c4V0JmVlhiR0RqQ0xGOWExZEMycjdkdz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: f91be73a-2e74-40be-b774-08de583d8c4e
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 16:04:10.4218
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tf9rWwGmRtdu34Ec15UdVHAvoMQnC34Tc8DNBp6EfFawpyWq4AjuYrv16JwRZzjeKmrAe5989ROwf0H+Y+k4aQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO0P265MB6375

On Tue Jan 20, 2026 at 8:38 AM GMT, Ke Sun wrote:
> This patch series replaces unsafe core::mem::zeroed() calls with
> pin_init::zeroed() across multiple kernel modules.
>
> ---
> v2:
> - Remove all the comments about zeroability
>
> v1: https://lore.kernel.org/rust-for-linux/20260119065859.1914178-1-sunke=
@kylinos.cn/
> - First version
> ---

For the series:

Reviewed-by: Gary Guo <gary@garyguo.net>

>
> Ke Sun (7):
>   rust: auxiliary: use pin_init::zeroed() instead of unsafe zeroed
>   rust: block: mq: use pin_init::zeroed() for queue_limits
>   rust: block: mq: use pin_init::zeroed() for tag_set
>   rust: debugfs: use pin_init::zeroed() for file_operations
>   rust: of: use pin_init::zeroed() instead of unsafe zeroed
>   rust: pwm: use pin_init::zeroed() for pwm_ops
>   rust: security: use pin_init::zeroed() for lsm_context
>
>  rust/kernel/auxiliary.rs         |  4 +---
>  rust/kernel/block/mq/gen_disk.rs |  3 +--
>  rust/kernel/block/mq/tag_set.rs  |  4 +---
>  rust/kernel/debugfs/file_ops.rs  | 18 ++++++------------
>  rust/kernel/of.rs                |  3 +--
>  rust/kernel/pwm.rs               |  4 +---
>  rust/kernel/security.rs          |  3 +--
>  7 files changed, 12 insertions(+), 27 deletions(-)


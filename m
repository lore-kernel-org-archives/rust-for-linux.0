Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012045.outbound.protection.outlook.com [52.101.43.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C96327146A
	for <rust-for-linux@vger.kernel.org>; Fri, 16 Jan 2026 15:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768576958; cv=fail; b=LOBZXLC5JVhPuVsbyVFi9SGsMTKC4F5UYnuKTy+f4WIKh/N6SFEAnUVB3BaLSMSKSUUo5yZrpT39iPnfCyWNN78IiKKrWaB6XXGgkWqqKfetHib/NcjeNBzBN58R5fSdR248/p/7yuv9yWeoCXyzGpvGI6si+cHJT9JUFBSv11Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768576958; c=relaxed/simple;
	bh=WjyQCKMVVoD6ZD5cNlEygaqrxBx+h9bdFYC9d8244VE=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=sDHgliHleeUujdm8/0ubEF0583GzgS7BdVs8GtTti5+0kIIx5rSigsaNIZ6BKKTLNMi/bgJJwf43i7dnyMY0oEmGiMjFvINYG5SGWbbq6jj7260a/o7kocQiD5IFGymhra1LEmXIfK7gkA3IrAipMbIvRmnidXGj9Gu3pkdFKYQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=oCpuixRG; arc=fail smtp.client-ip=52.101.43.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="oCpuixRG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L1TjtrPU5eKLiC2OEuBaJmGpA8sPb8pKOs6iQJ+Q0r/1KhJGhTbv3Rie8WiQmiMFKkO26AdoeWzDpeq60huy9iFu4BAcr1L3L76ZaWqk+kSuKclgFFR0MU2Y3wpk2lPU1u6l0o81WNBosHcQY9NrBdkQV38Hf6ZbEzvsNsOI12MFTzcTkGYzz1psbe7sQGTF1GHAmD4+aibNAnyUwyktTRY23Mn5kcGtp+rYWw5r/nWigNfZaMRQvHNUMYWVU9vsj4UIA6isthA407eBgx9V5anz56vSnysi1xOKbhVc3yiQtO0lxZChQkIPUQ0iTR1Qpmh8hrGVIXpkdew2+DSurQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WjyQCKMVVoD6ZD5cNlEygaqrxBx+h9bdFYC9d8244VE=;
 b=bd0q3dZS0N2FP8pbv0qETgwfbLMBmxaXqZ/3H5jxSmdum4TdsQtpGQfcM5vwMnQMr1Orbmsh5BNsLommxWlFYofr6Jlp96q5YfciM91F8wRhrPEYcUI/HRtBbcopuVjygM80lCUy7JkS5EKgIBXeDqmZKrWOGOgv2OnSrbYhNzFjytuP57BB5Jkb3uuGFrQLfwqXjj/w2xDYCFyrtRelOyFRL0pQq7EMGnFqVbXxTg/LUEtZyeiFg/c3VuA4uLBgOnLxgvYiQ3oPXEkqvaMBkkLwgpKvhT9naff3uD+VKUbLqfLi+uRhzJTf44fl2+LMwG1GNy3DFVUxDOYcv5PyhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WjyQCKMVVoD6ZD5cNlEygaqrxBx+h9bdFYC9d8244VE=;
 b=oCpuixRGhAjumU/bWn2eXC6ELaxldfeKTdrGHj2SX1iDX1A5YTc2Klc+mfkC/N+m4LdAIMdq8vo3O3h+D5zikZ9vI4iCGq3cpodeAXPG7ZeaiUQcM4lWGF2AIAOxfEQRESeDtGN/rpsCnxB2H00zKbc9hSnTfQwx2Btafjvgun3wAxOe+tIgSCYm8b+6/8VaBPFBvLgdlECXyWbo6A68NZxBVFpEXiYJ8GT2WdN1P/i6nD3GNqzz4kdDu5b9Fw0mb1L0gvILLDjQtrH/B7lfyjI4RUzjrvnCbo4X6up53VPsmRB0mABv9vG7gtuPxXZeL3tqPtQhxFBHCNBKDbJICw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CH2PR12MB4309.namprd12.prod.outlook.com (2603:10b6:610:a4::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Fri, 16 Jan
 2026 15:22:32 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9520.005; Fri, 16 Jan 2026
 15:22:31 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 17 Jan 2026 00:22:27 +0900
Message-Id: <DFQ47DJUYCD5.1F1DIGGIB8TCE@nvidia.com>
Cc: "John Hubbard" <jhubbard@nvidia.com>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "Danilo Krummrich" <dakr@kernel.org>,
 <nouveau@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v6 11/11] gpu: nova-core: add PIO support for loading
 firmware images
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Timur Tabi" <ttabi@nvidia.com>
References: <20260114192950.1143002-1-ttabi@nvidia.com>
 <20260114192950.1143002-12-ttabi@nvidia.com>
In-Reply-To: <20260114192950.1143002-12-ttabi@nvidia.com>
X-ClientProxiedBy: TYCP286CA0200.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:385::6) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CH2PR12MB4309:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b7bbd33-f76c-4954-a2a2-08de55131152
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|10070799003|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aFNud2duVjNRSEhtTGZFMDBkOGl5ejArZkNxaXBZcEtMbzBwbHV4cDAxWmx6?=
 =?utf-8?B?d1VsQTBwZ1RvdDBUQ0xDMTkzcVE0QkFMUEdaSkd2Y1dQeC80VldqM25pMEVR?=
 =?utf-8?B?d0EzS09RdWVwYVQ1cmFIb0VJN1FISEY2T01nNTgwM2NhZi94M3JqUDBqSEF6?=
 =?utf-8?B?SjhjT1ZIZ3J5enNjaFd5UVRaNForTkczZHYxT2RXYjZHc2JRaDkrL1IwbmdO?=
 =?utf-8?B?allBS1VveW1tazMrczRmV3pHNzVaMUhncC9BMXN6c0dJOTROcUVLdHc2MFo4?=
 =?utf-8?B?aE9iZjMyNkVpeHhUcGFEbTg5RUlPNERoblhPUzdGMXpCSmVHcHRGYWJlam5p?=
 =?utf-8?B?VW8yQ0V1MUxoaUdoOVUzOFhWSmp3ZVhHR1M4dnF2bXFUSGExR0puY2VVaW95?=
 =?utf-8?B?UGVWYUpQQzg5dUVTVDZVT3VGaGs1K2dVS2hMcmZGanczdnNZdTY0bC85Wmpv?=
 =?utf-8?B?Si9nV1VCbU9mZTdWZnV2Q05sOWhpaW53K2FacTduNmFqYTFCQ3JSaGJPUHlt?=
 =?utf-8?B?dzlmSWJqamtUN0pwd0VXMm1kTGNlOTJhdy9JajZEbHVkUG5ZRHZSOVJ3cjhv?=
 =?utf-8?B?dkVVeHR6TCtaSHZMNW1CVkNWOVdjcUgrSEVlMHJtZGlvVXZoRmdxdmJoaXpF?=
 =?utf-8?B?UkxYS2xJalZjWFNOV2huZnNlTlBkRWVpdmtqK0ZwRnJTVDZ0cmJkejhhSG5Z?=
 =?utf-8?B?dDdKK2RTTUNNL21IWXFRem5KZFZod3M0MGxBTEhFZ1I1NWZDTmJRdEtaMUZY?=
 =?utf-8?B?N0JVRDUyemQzSmFiWnh0aml1eWFvck03UXdHTDExbzJGbURoOGsyOXY2Uk5O?=
 =?utf-8?B?cEZIeEpJakVxNG92RDlkNFdEaG83d0UrSHlmbjJGNE5tYXJ5SUk3Wjd6VHN4?=
 =?utf-8?B?eGlxSTVIMW9RWXNqV01ZMWk5YkFMUzFwdjVXY3oyRHd5bm9sa1FyNzVTbnNW?=
 =?utf-8?B?a044NkNna3hhWFNDTlEvQ3AydVJEVXdHKzNBT2JnNHVIV293bVRDNFMxYTZX?=
 =?utf-8?B?NXpEc25iRS9vKzJGMmxLTkhGTmtWNTlIYTZlcVowbGQrYWRoM1p6d3M0cUtJ?=
 =?utf-8?B?NjR0blNpcnFTZWlTWDBtQlZZVEt3ZWoxdGduNVpjYUZEblFXYVRjWko2czVD?=
 =?utf-8?B?M0RpUjB5dGg3OXA4Rm9Ob2Y2YUVpMkQxNWpHT3lqc0NmOUE4bG0yZUUzeEor?=
 =?utf-8?B?K2c4L2s4U2M3dWNsTU03ZUdDQmFoZzUrRmR5ajE0OWhqY09uVHFGeHl2K0lt?=
 =?utf-8?B?UnRRNGhWVmJIZFIwL0QrWWZjNlBtOGt6ZzdqZzNRK2tJZVpZdG43ampyL3k1?=
 =?utf-8?B?UWtDWXUvczFWSkI1bE9TRVpUUVZsVXF3eGZyVmRvL3M3VXJoYVJZWTdIMDRE?=
 =?utf-8?B?NmZpQWxUZGRHVUpTY0NZZi9uZWZkNDAvazBPSWl6dWI4VzFGa3k1cnRlVWxR?=
 =?utf-8?B?aGZUOWtIWENGL05zbjByZ1oySUpMcGtjWWRBK05hTjR0NVBRamZmN0xCcnc4?=
 =?utf-8?B?MldNMWN5RVFHUWVFZUJKeDlQdlpPd0pYMXU4UUc3c0FyaCtkZGF5bkhNTHpF?=
 =?utf-8?B?Z00rMWdsMUlXQzhXdGFtTEJjcjk5elFJckcyRnB3a041c3M4YnZsUTg1cWlO?=
 =?utf-8?B?NlFsbmd2TjdiVFJsOWovRXBsZ3pJUmdzNi9TekVGK214Vnoxcm5Fckt0U0U5?=
 =?utf-8?B?dDduakZIbXdaVlE4TXNUU0JrU2graWh6ZDBXb0pCUjR4ZVVGOHZnMGdyOHc3?=
 =?utf-8?B?NnhQeklEZWVpNUExQjRZNTRQRXpwT3cvNEZ0KzRCb1ZGdkRSRGg1RTlUdlI2?=
 =?utf-8?B?RWZVZkdPQzNqR0pzemZPbmViTWN2MVQ1QUs5RXZlUFA2YXRxZTQzS2VhTWNR?=
 =?utf-8?B?YmVGSkVVMjRZeVBnQnpmWDFxTVdER2Q0ZlFNOVR4Z1kvZzVlenUwVzIzaG9H?=
 =?utf-8?B?VGVTcXdiL3Z2TXFORTdKbXNiOTdZZk9pU1NCT3N1ckZJUzNRL3BGTk5FVnNV?=
 =?utf-8?B?K1Rwc1QvQXpKMHB4ODMxdGh3ayt5a2h2aDNBYk92enE4TEtiQWduRDJVcFMx?=
 =?utf-8?B?ZkZlQ1gxTXd2QWI3c3Q3L2lCMEsvem5MR1dlYzcwRHFoVURxYjMrUDZxdUVG?=
 =?utf-8?Q?/bjo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bXZlSjN6MzBkSUhXUHMxWmI0aTVzY1RpMnRNVTA1YThlR01jYVRFbmdmemhU?=
 =?utf-8?B?UEhMUlFjSlAyQkFEcjh6UExlY0Jrd24vbHd2R3gzTzFhdlo4NmlIVGdtUE4x?=
 =?utf-8?B?OGZXa0hJWkVpaXcvcHhZTlArNXQzWnVDdGsvUzVFQUg2a1kyY25raGRsRm9D?=
 =?utf-8?B?UGRRdGNoSWtFUDRRZ0p4RnMwSEVWMnVOMjBZaFRSVU9IZFFlbmdBVzU4cm90?=
 =?utf-8?B?UUhYUVk1YVFkT3JMYnBDZXQ3T2FyOS9jTmEvSWZKSFJQRVZoYnJwTDNVZSt3?=
 =?utf-8?B?cWtpaENGdzJIYWVaUlBacjNadVpXbWM4SURBVnJjWlFydmFEMGRWWUFUdS9i?=
 =?utf-8?B?cFpUVWlRWlZXd0NWWDlYMUhmYU5QWXVuWlJ1WkFlUEp3NzNTWjhEU1RMVHJj?=
 =?utf-8?B?Z2VYcE5KUWY1QXBZUjYrVitNRzVYYmdiNHJoOTZUK3VySmpudWVrNEJXV2sv?=
 =?utf-8?B?WVhTa0ZzZHZFZld3ZkRDYU1SU3lUaXRGL1hTTmNsRG4vak9INzVkUXJka1Nn?=
 =?utf-8?B?eUN0N0tIWFF5TTJMdCtJWW1aNzJUdGhXY3ZTLy9CaGN4NVdrd3VYMFl0V3BV?=
 =?utf-8?B?WW9Pb0lIckVqaFN4NFFmSGN5S3l4M3d3Y0NJQy8yaW83UTdmdUdzZkxKTTZ4?=
 =?utf-8?B?ZmpmVlRRK295SWZoWUJlL09OVStxcG1qUTEzb2VFc2pGaDN0MlNYT2duWXpt?=
 =?utf-8?B?R0ZBc3ZKdG03blVJUGhIdHlSTkRETUpuMnRqbUp1R3JjZmJrMWoyeW1ZRHhs?=
 =?utf-8?B?QXd1enF0T1pCLzdWRnRkaEg1dVlRdTZ4bk8rTjNIRHU3UVFDMS9GNy9FaDZr?=
 =?utf-8?B?N0NKL2NHN0FQaVNjM29BK0JKbGxzalY2K1VacXR0T3R3WG9nM05lRUNrdlBC?=
 =?utf-8?B?RG12RkRxVmFkdnVnOWI5cC96VkVEKzlCVkc2bnZ5djB5RzFNT0ljVDZkWmYy?=
 =?utf-8?B?THhaVGJZL0ozSkRqQTNEWEFRSVIyZnIwTnhzbFNYWDdwbUZCNFM4ZklUZm1T?=
 =?utf-8?B?czFsakNCRzhERis4YUdvWGlwSU1jSXhCQlVxb0Rpb0J5WVI4TysxYXVOWFNw?=
 =?utf-8?B?RTZxWm1nK08reU1uZGhaR0hHUTFrSXB1MzZ2S3Z1VlNubCt0cFMzbEd2Qytu?=
 =?utf-8?B?Q2ZpQS9JbTRzRWhzZkZOTll0TXpyaGN0a1FjL3FLb3ZTbXFuUG1sNGFCaGtB?=
 =?utf-8?B?Uit5cmx1dWhsWGZnTlNmZzlDTmhxZ3UwdnJjYVlvcU1UdXh1Z0N4eFJEQ1hV?=
 =?utf-8?B?SU5mZDZOK1R3T2lZbVhNMWJzNTVrY0FaMlZ3SklQb3pWSnVFcjJkL1p1NE1G?=
 =?utf-8?B?WGIxUTlKVHVkNWRoNDRERjRMUkxuTlB1QVMyNWIvbStORGN1T3ZuWnFWZFFU?=
 =?utf-8?B?WForU0VpcFdGOHBQL01KV0xRVUk4ZHpsMjVQVTNQNEg0d1VheTdYUjd3dWQ0?=
 =?utf-8?B?aEZjUjhRMzlJZ3JLZlJRQnZsdmFNN0doMXF0NkdzUzJFZ3FpSDl6Sy9JM0g0?=
 =?utf-8?B?YWkxcU56MEtmL3lNRGpydU1BRzJzVVowS3REd0M4NW1WQk1YZzZ1UTc1WC8w?=
 =?utf-8?B?V3hodmxpbllNRWhVdHNhQjlGZVprcEI5Q0FDQjFPOE9ZYWQ1bkUwVUs5QzJs?=
 =?utf-8?B?SUhub3FXQUVWNWNsWEtQR05YZzVMNjdFNTRSZlR1aFFoMEJ1WWlHTURVaE1Z?=
 =?utf-8?B?Wkw1SnovTFh6L2wxNVRBdXhDRUJaNmlSYjN1UXV3eHRneCt2SldVRnJ3Qk9i?=
 =?utf-8?B?aXMvQ1ZiN0hPK3hCWkVTeTUvRXJyVzd1NzZxYjh3cGJrQ0Z0dXpsL0h6LzYz?=
 =?utf-8?B?aG1xZTNIazd1ZzRBZFVNMklYTWNwSlZZSkxIalBaM1B0YnZxeEVCVU42L2dz?=
 =?utf-8?B?elFTUG9yMDFNUHhpMjBNbnpUK0o4SkVTT05JbjRqUEdRRk02a1k5RmlITVYx?=
 =?utf-8?B?NFZtSnZFd3A4ZlJSeHBHRlMyUEtXcFNvYnJQVVdMcXR5MGRiVmxBTTZMMllz?=
 =?utf-8?B?VHFpajBXR0w5dWxnSVBrQmdrVGY0Z3oyM256VVhwdnFvOFkxMTBQZ2x3RHNU?=
 =?utf-8?B?MEtSaU8wQ1hwVC9mZmpCKzNpajVIczl0RGpyUVUvaGx2eXJrN2pJZlhXMFFK?=
 =?utf-8?B?K3paK1h6WFEva1lseWlFalJLdGo5ajBITmN0ekxYSWlTOHYvZ0NhVzVxQTNh?=
 =?utf-8?B?encwOVdQL1E1bTRFNE5XaWZ1OThFQm5PTHlGd3c2Wi9vRFFPeDZ3NDEzMEl0?=
 =?utf-8?B?ZTF5dHp6KzVaVmZ3eWN6TW84alpmczE0ay8waG03TVVMN09PTUJJMUU4czhs?=
 =?utf-8?B?RzZHblpTODlwT0NvdHB5QzJoMCtvZmE0aFdEZ3lsdmg3RkIzQS9zcDdueGdw?=
 =?utf-8?Q?b/BsJ+xsic7RfrVr2iBUCnAxB2UeiNK107EPf7ubgSm6+?=
X-MS-Exchange-AntiSpam-MessageData-1: d4ZvuoGHN/7rlA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b7bbd33-f76c-4954-a2a2-08de55131152
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 15:22:31.8117
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aMjMQdT2nMeewBCYpv47DlGSmgpGhLNXe7m7gH374xr61drhxBWs9OQA1J8MT+dnLYEK+ScYmp6fuct4ICARJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4309

On Thu Jan 15, 2026 at 4:29 AM JST, Timur Tabi wrote:
> Turing and GA100 use programmed I/O (PIO) instead of DMA to upload
> firmware images into Falcon memory.
>
> A new firmware called the Generic Bootloader (as opposed to the
> GSP Bootloader) is used to upload FWSEC.
>
> Signed-off-by: Timur Tabi <ttabi@nvidia.com>

Just a heads-up: I have a bunch of comments for this patch, but also
want to write some code to validate them, which is taking a bit of time.
Just letting you know so you hold on v7 until I submit my feedback for
this patch.

Thanks!

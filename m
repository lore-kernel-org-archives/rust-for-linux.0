Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010068.outbound.protection.outlook.com [52.101.201.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D8FE2309AA;
	Fri, 20 Feb 2026 06:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771569541; cv=fail; b=WI8hy/Rzcz8PLU9nRMfXYYSZejN2mir7dirvzbbz0q/FszMqFGLpYJiQaHnw8V7N/V7Bm38QLkTylxjuPyP6ADPOillJLQXPNKTKaRYsN4Haso+ECWwUIGEU3Q1zdOlGU8FINXdHLnOeet/xWPgD2hEyuZngJLwCuWZVrf8Cbuc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771569541; c=relaxed/simple;
	bh=buHKL1l6klvrCwawrqiBb0WUKdr5edwYlaSAIiPoC7c=;
	h=Content-Type:Date:Message-Id:To:Cc:Subject:From:References:
	 In-Reply-To:MIME-Version; b=TtSxBTZ6Usd0njeorozM/izN1ywAc2KtQcLSHFDV3VZIOabvT8Dsv8B4W7+eZ5H1Fxx1zaoJ3HWzbOiDXJbcPTM4r7/OKgvZQz4rFeG2F1YhzxDLSqb9kin+EEefn2WHYUppnmKvicfbq7jEjoQyF7si37XhnM7IU6mmslv51L8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=U6HIcGxY; arc=fail smtp.client-ip=52.101.201.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="U6HIcGxY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lmjmx0j2z2Z47U7qZq9dTfSQMcGc50CMsFJbp9lzBXWm7b9YUM37/ZzcMQ48nHJy6x5H6l352hPtjGGYFXlNaGPOleXfqKUmZK1jUpWP1xqaRqrgrh/NL43XfNM3KLQ7v+qcz9/uY//D+PeG5EfDxd9v2xWrav7pkMkw21ZXD+sRjifX19mIiBnUKUC52eeZkGwNFa9TkL9q0AiPILYzMgDxQsvG8pfn5CQBtVLJOUZHE967eLJwNDUFoyVDN7bhoyVjYH/5SMzaDC13ARALhxFDjhlC+vu4O5HS2cgKd5Cy5bd8UIYd3aOomMeKTINUD4Okb8YspkjUZXgPNjmJ3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t1sparU5XgoS1cykM0KLCFtODutW2H8vKh5AMxvvJ2c=;
 b=fHbo+Uw8ocF259NySi60yEB8kK7gPC1tuJ68qHmAjQ1b92+x4FnOe7tV7MMRIz1wmiuNiFVrKNJJG2zbye00Y/S9/V2b3fAiDvDStgNzxEnv2Q8IY8VnB+Ef/9jkYekh9SGkJ4IyuA3JeJo3ZOWebh+zrSCzZQ3H97wt0wpjpF9U1BZC8iJ5z3gcmDb3SJwCtA0I1wtegW+Bhrz0YB8BidhgrK2U6E79X1WK7QqRV84AiLTLOJcUJk9lPnnZEt7pE9uS9jYlolZbwhal+JtnaSp4CaCIiKQM1NQYOqh6b7WXwam1IRxaLHfKjDP95MuwnMe0t/j9uvGW7TcuvVkngg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t1sparU5XgoS1cykM0KLCFtODutW2H8vKh5AMxvvJ2c=;
 b=U6HIcGxYJdYYPN3ChpnCR+HyWSDqfNddg8QCrxxwga0ectTQlRALH1W27gJrbRKrEkBQBXD/SBYl3A+pJUuQkYm3bXt7x8oLQAwV0oBRiuQuwQ3yB+iGp7NtlBHzd5FbntD5PO5FVaKIA/3oMULWdhHLmv55jsKp7J/kaWyHhQqMA8ll3TebH6hq+IZzH/+IJNRN7zbElWUllB8BdKbmFs3nD0Ex3nbHNEmBrIxyZyg/1WhQNKLythPdqKpzg52RsKISWDJMA/mCHOy70XbgufUHJtcwbvP0P781oURkYqMgNiWsySsp4sFn9pWbCI4AJKjyoGXeo4LDC5jPyC3B4w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DM4PR12MB6280.namprd12.prod.outlook.com (2603:10b6:8:a2::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.16; Fri, 20 Feb
 2026 06:38:51 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%3]) with mapi id 15.20.9632.015; Fri, 20 Feb 2026
 06:38:51 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 20 Feb 2026 15:38:46 +0900
Message-Id: <DGJKZHBSGKKF.2S8URAVPODWJP@nvidia.com>
To: "Alice Ryhl" <aliceryhl@google.com>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Gary
 Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 "Boqun Feng" <boqun@kernel.org>, "Yury Norov" <yury.norov@gmail.com>, "John
 Hubbard" <jhubbard@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>,
 "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 "Edwin Peer" <epeer@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>,
 "Dirk Behme" <dirk.behme@de.bosch.com>, "Steven Price"
 <steven.price@arm.com>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v6 5/9] rust: io: add IoRef and IoWrite types
From: "Alexandre Courbot" <acourbot@nvidia.com>
References: <20260216-register-v6-0-eec9a4de9e9e@nvidia.com>
 <20260216-register-v6-5-eec9a4de9e9e@nvidia.com>
 <aZLc0YMHd8C0bVD2@google.com> <DGGA9D0N19KQ.4LBXRAEGNMLX@nvidia.com>
 <aZLzBP_v6JlTR9WB@google.com> <DGGBVOL5XZ5B.NIXE0JCEBJC2@nvidia.com>
In-Reply-To: <DGGBVOL5XZ5B.NIXE0JCEBJC2@nvidia.com>
X-ClientProxiedBy: TY4P286CA0045.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:36e::12) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DM4PR12MB6280:EE_
X-MS-Office365-Filtering-Correlation-Id: e34c4940-916c-43cc-09f1-08de704ab55c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|10070799003|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Q013czlPNnl2aEYxSkJqY1pBSCtIYjQ0RjYweUNrc25tZWNDVHVOdnJnWFpP?=
 =?utf-8?B?Z1ZLR1U5ak82dUJ4RVVOaktuVHN5NFJUK3hUZHAwR2ZBZDVoUUZTNCtDQUVu?=
 =?utf-8?B?K1JoWXVGNWxsS0RXMWpzdzJwMnN2bEMxSFdnbjhYN0VDSmN5bG9rY0JIaGNh?=
 =?utf-8?B?eFE1KzJPRnd3djBDQTUxNU45SWd1UUNyU0x6MGhSdGxxbG42aXZ6YjJaalhD?=
 =?utf-8?B?cjFOTWJSdURRNGJWbHhNSTdhQ2MzQXdwcXpkY0NFaVdMbStTTHgxQ1d1S3dN?=
 =?utf-8?B?TG9PYWUzS2dXNTlEcHdKcTlLWngvUW9tUGduVFZzQjdTTmRpU0NRbVRjSkg2?=
 =?utf-8?B?UFUxUkFCL0VxTi9Gb1FaVkdSZVNPQURta1F3UG5KOWo3WGtFVkZvczRwQ2dv?=
 =?utf-8?B?WVZaWnhGYi9seGZKaWtnSWFmdE1VZHc3WlMvVVJ0cEY4c2N0UE1oTFIyUHYz?=
 =?utf-8?B?aGd5eUlsNnVFZTZwcE83aDNXcFNNTUllaDYzZVpTSS9LUDdXWFBNZjM2VFdC?=
 =?utf-8?B?V1I0WFJnRkRHdk1FRnVqaisrZHFVOWRyNitoMHpvR2pqNWU5b29wS1J2ZDda?=
 =?utf-8?B?bDZWRXdpdzFtcWVxSUM5WkZQNGV5cWo1S0RiTG5PVjJxaVUxTWFqSWtMdjZ0?=
 =?utf-8?B?Z1JMWk0ycEVPRkozVWJhcndTRlE2cjVxYWFzbmViUWRKMWVJa243bkZNaCto?=
 =?utf-8?B?Y1QwZkVwRWRseU1MM3B0TlllbEdGNUtkSnNhUlZCQVZkVEdnN0xGZWRIWFdx?=
 =?utf-8?B?T3F2VWdFT0NxQTJPVnJpQk4zOUt1STdGaDU0NzQ1NHZ5ZUpKcHd6ZUdSK0Jl?=
 =?utf-8?B?V1FKY0JzVUdHdVZ4RW5DUU94NWd2MXJzM01qTWpJeDVFMGo4aG1RVzBrRlZN?=
 =?utf-8?B?dTkzNm5VOEhKMHB4eHpkQ1ZLdE5TVWZ3WERjdUNDWW1neXVQSWpNMzdZUklE?=
 =?utf-8?B?ZlRKc09GYnY4cU1DTnBLam1ML1BPVDNkZ29Edkx4UFAxRWNMV3Eweld2c2l2?=
 =?utf-8?B?QXo4N1Y2ZVhmT1VXeENRSlR4dG9QcEJPT2l4ZXBuTXZzaEJteGU2dEkvVEl0?=
 =?utf-8?B?ckhJNFQzOVBCVjk1ZnQ2UWNiNXMzREVka3owMHZEUXdMWlZzVCtKWG4vYkpa?=
 =?utf-8?B?MTdseVluYnJDbmw0cEV3Sm9hZFpWODRtbURXNzVyb3pVZE1Rc3ByVzJLYXVL?=
 =?utf-8?B?N29Mb3ZxVDJoQ3FVZjlpZjV4a1l6TEtUbHNLVkpORWJodTg5M29lRjdSaGxl?=
 =?utf-8?B?cUE1OHpuS3hCRzczZkd6dGozdTNXVlR1SEVZdFhDVE90dW9xcUlKRkIxNzZD?=
 =?utf-8?B?dVF6ZFJ5dnhFWnJGY0dUUHdHV29tMjBSMkc3bFFkZlhyM3NleGszakk5KytT?=
 =?utf-8?B?Tmd5VFFuR1JKb3dQcWJBS3lPZm5oa1RmM3hZeEc3OWx2VGs2MHdBMzh3MTJ5?=
 =?utf-8?B?QXd5czI0emVFK2w3RHVqYzUxZk9Ma1dWSTVINVprYlM2dkt6U21SN2JsT1JZ?=
 =?utf-8?B?cGFtUHRBbUNYOG9rSWNpNWxHZ3Qwc0RFc2hDOXdIakltN056RUFRazdPMXlL?=
 =?utf-8?B?NHBwemxpYWYwYjF4N2pUMHFGQUVwTjRjWUd5VWdZeGJ2cGNhb25OZ1p6VUsx?=
 =?utf-8?B?eEc0Q2pzTEFMWk1BUlAzd1dmTSt4bEdYZkJTUmI0cDZLS1o0cWR5Kyt2Vm5x?=
 =?utf-8?B?cWZ5dHVqc21BdlN2QkxqV2pIRHFTYlhKemZKbGpPZC9WS0t3RTdFTlFMSVBs?=
 =?utf-8?B?bllwMjNLQXhGekFTWVpjeHRJV1JYSWhjQmljekpXSDJQN1dlNUtoaGl6eGE4?=
 =?utf-8?B?TExOcVJ5SitvZU90QkNoY3h4Qy9BaG1BUVFKby8rczRuZ0JYUGxOY2RuZ2Iz?=
 =?utf-8?B?ZGpIdkV5b3lQUVUxTTlMNlVBVXROckJNeW1WNHRVSzB5aTFxWE9HQlovQWxn?=
 =?utf-8?B?WVU5RVAxTDJvNGVXZnczeFBORittNGxoMmJqQWJOOHFzeUV4eStRZXFtenIv?=
 =?utf-8?B?YkFtKzAxeUNUR2Z6VFBGcXpBSm1ySzQzb0lHRitNQWRQRDZvQlQvamswd3JS?=
 =?utf-8?B?eTBSbEN2TWdyMTRhYldLZmQwVTZDaUNJVHk1MHhmM1dzTWlNZjdXc0dCUnc3?=
 =?utf-8?Q?Ku4g=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(10070799003)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RDdWekRVTGlDaVpwNjdKK2ptUkxIRDBwa25iaG1RRWo5alUyRTd3ZWJBNkZ3?=
 =?utf-8?B?VnpCZ3BFcVZjUjZNNGZMMFZhWHJuclVmd0pFSE0xcmt1TDNJWHBtRHMrSXN1?=
 =?utf-8?B?Ni9KeGVKaVdGdGRpd3VIUEhNSjFubnBJTlFDSUMrUlBTbGZRQ3pYRnRCc3dv?=
 =?utf-8?B?SWJpTGZDb1ViN3FVTFJReno2cXlDcEc3dFJjenlDenJmMTRHeS9CZEltQ0tw?=
 =?utf-8?B?ajJsMmdaQWNBSG95ZTViQUorVTZKanYvMnZQSHJrT3FsSzdFL1lWalhoYmNn?=
 =?utf-8?B?YTBrTmR5MjdvOFRpTngzMFFXdktKVFB4czNYVUxsZk5NRkg5SUZJMXppa3lv?=
 =?utf-8?B?SkZ3MTVySzhOblNLQWtkR3Jlb1hFbnBUSkp6eUZoSGR4KzRjSXlQcHdpTHNy?=
 =?utf-8?B?bWFoUk5Mc05FYUk4YTc2a21sUXkvcXNBSVlSS21KRFBKci85VnpkUEV4Sk5j?=
 =?utf-8?B?UW4yRE1HK0I5Y0VjeGtqRGVQUGR3cDYyT1BIS2JCdmN4N2Fwd0xHcHIyUlBS?=
 =?utf-8?B?OVlreVhtUCtjdG9XSzhJS1V4YWw1Zk8zaUhwVWFCRldtTnkxWlJ0TzkrY2lv?=
 =?utf-8?B?M0ZVQXVqZ0ttNmxUOWRVUlpUaFdBS2VaTWpGdVV0NVB6WDZjYWtYUDZib3lm?=
 =?utf-8?B?aC8wUkR3UThIdzBUQnV6VDc3QVRqaFRZdEgvWCttaEh1NDJLVHBuMWZsL2pP?=
 =?utf-8?B?aTh2ZFN5UjdScVZ5bElvUnFKamNNUHlqRy9FeW9zS0ljb0lFVlBnYjJnM1J2?=
 =?utf-8?B?cldSRXJzT2VQL3BDdDVDZllDUWxLSEZxMXozbEhPUmllQkJJUDhYOHdJUWdh?=
 =?utf-8?B?TGxDWGgzZjkyNk5OcktTbHVpVDE2cFRQaC9VUm5ZTTB5MXo2enB4eTNQd3Z5?=
 =?utf-8?B?S1VoRWMxRWpaUUNqQVFQSUdWQnFlU0w2QzNTb0srQ08va1RKM3l4N1RNS1BZ?=
 =?utf-8?B?MVVtdVAvNHFEb2o0cngyU1pzSzZNbjBQY2poSEQyQ21jbTJ5dHZBT1l4ck4y?=
 =?utf-8?B?eHAzMEs5VmtMMmh5NmF2cktHWVpzRnMyanVlUkhYbWVqUXloNC9YUlh0dUU0?=
 =?utf-8?B?ZkdVaGx4bklOQXRhSm0raEViaVk1YTlTeTJpYi94UVVoQVNHQWt0M2FnZ0Zw?=
 =?utf-8?B?SEp2ZFVRTzU1bnpoMTM4ZzdDNG5yczNJUGR3NVBTY2FuZkdrV0tBb0pRM3hj?=
 =?utf-8?B?NC94TmpmUGJTbFFPRHgxTitiMWluVVptNHllaDJLVlp6UmZIU0E4N0ZkMHFy?=
 =?utf-8?B?UEV0ZlF0MFUxMjZGZzZBOW53ajFMMDc3TU5MbW0vRnF3U2RVendnOW9EajFi?=
 =?utf-8?B?OTVLckpiZjFVRjlTdDZqWlNkTzJPSm1SWmRVcGt6Z3htc3lNYlE3WW5GN0RS?=
 =?utf-8?B?b203VnhXTHVhTTZHZzQ0ekdoSkRoaTE0Z3FJSnRESUdJWXZVNzVFT3JNYjJn?=
 =?utf-8?B?OFRYZFFWSytZZXNDOTFaRjFkVUFHek1iMEZYTjNPaFB1THZiYnBiejdpM3ps?=
 =?utf-8?B?dGRIekV4eTh5d2cybEZWd2dqbHQwOHZ0YjlKWVFjMWVkUnVVWG56MzdLVng3?=
 =?utf-8?B?NjNJNjd1SEkrZVJGZU1qSUhlS3U1cDFzQ2lRWHpncDAvZUYwdC9KVHVndGRV?=
 =?utf-8?B?SGVlWnZoUDk5cG5wWWlIRTVYTGRwTWsySEorS0JkcWpQemdKK1c1Nzc5NS9D?=
 =?utf-8?B?M082WDYvVHhmSXBVTVlLdHA2ZzJJbkhtNzRmeHR1RVJ1L2NRdks0N2pCbzRi?=
 =?utf-8?B?bUpxRXRTeVlQU2svRUgyK3JzYVluSVArVGFEOVFmdFU0VHRtWXJlK1hCWTRl?=
 =?utf-8?B?cXgxWGlaT0RianZMa1dULzRqemE3d3c1MjZCRnF4bkdCQitqYUhuNkoxSTho?=
 =?utf-8?B?UXNNLzQxdkpwZmFOeGJGZVIrRVVOUlE4NjBISDRyR2lIMWZqUzFWeS9UeVVJ?=
 =?utf-8?B?ai9uRFA3VFFKV3lCUmZPZzIzNDQwd0RwM0ppTXpHdExaOVlpb3VzZDkyNGhh?=
 =?utf-8?B?Nmg3blhVdmx4bW0xeFFyOGl5OWRTSjdHOGd3V1ZrUmRJL0JuSkRvaGVvZlVm?=
 =?utf-8?B?UWhQV3g4dUFEZHh4aGduS1UwMG50bUU2cXZCMlhGdUp2R3VrUkxQcVAyV1RQ?=
 =?utf-8?B?UlJ1NG1BakVVWG5INHVDR3VoRGM2TXo5a2hjN3lHY1dKWjlHaDVncFpvdVBM?=
 =?utf-8?B?bzZxL1FPVTNaZ2U0a0VMRG5SOXd2TWFUMkZuSzhzdXB3MUF4OTkxc0FUczBu?=
 =?utf-8?B?ZkJEMWFWVVl4dkgvRFVablArcG81REFBMUxmdEEwRDdINXg3alpQRzZDc1Yw?=
 =?utf-8?B?OFhYT1hGYWRMUDU5VkRsaFNUNEpJS3cwOFRBdlZrWm1KamhmMDlFRjM0SGIx?=
 =?utf-8?Q?rfj4cgBFCz8eWCEpe/2BwtVk5f2iCEMwcdHL4Kgiu7I3M?=
X-MS-Exchange-AntiSpam-MessageData-1: ziwSfIBi+rPaiA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e34c4940-916c-43cc-09f1-08de704ab55c
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2026 06:38:50.8173
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FVpiWtgmAa4Jst3VId55I+t2M5Bh1Sy7oEPEDtG1spOjRrsRU5w8HUEDIIKbXiO+hKS7+6tzOVJHdqiNtopZkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6280

On Mon Feb 16, 2026 at 7:52 PM JST, Alexandre Courbot wrote:
> On Mon Feb 16, 2026 at 7:35 PM JST, Alice Ryhl wrote:
>> On Mon, Feb 16, 2026 at 06:36:29PM +0900, Alexandre Courbot wrote:
>>> On Mon Feb 16, 2026 at 6:01 PM JST, Alice Ryhl wrote:
>>> > On Mon, Feb 16, 2026 at 05:04:41PM +0900, Alexandre Courbot wrote:
>>> >> I/O accesses are defined by the following properties:
>>> >>=20
>>> >> - For reads, a start address, a width, and a type to interpret the r=
ead
>>> >>   value as,
>>> >> - For writes, the same as above, and a value to write.
>>> >>=20
>>> >> Introduce the `IoRef` trait, which allows implementing types to spec=
ify
>>> >> the address a type expects to be accessed at, as well as the width o=
f
>>> >> the access, and the user-facing type used to perform the access.
>>> >>=20
>>> >> This allows read operations to be made generic with the `read` metho=
d
>>> >> over an `IoRef` argument.
>>> >>=20
>>> >> Write operations need a value to write on top of the `IoRef`: fulfil=
l
>>> >> that purpose with the `IoWrite`, which is the combination of an `IoR=
ef`
>>> >> and a value of the type it expects. This allows write operations to =
be
>>> >> made generic with the `write` method over a single `IoWrite` argumen=
t.
>>> >>=20
>>> >> The main purpose of these new entities is to allow register types to=
 be
>>> >> written using these generic `read` and `write` methods of `Io`.
>>> >>=20
>>> >> Co-developed-by: Gary Guo <gary@garyguo.net>
>>> >> Signed-off-by: Gary Guo <gary@garyguo.net>
>>> >> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
>>> >> ---
>>> >>  rust/kernel/io.rs | 243 +++++++++++++++++++++++++++++++++++++++++++=
+++++++++++
>>> >>  1 file changed, 243 insertions(+)
>>> >>=20
>>> >> diff --git a/rust/kernel/io.rs b/rust/kernel/io.rs
>>> >> index b150743ffa4f..6da8593f7858 100644
>>> >> --- a/rust/kernel/io.rs
>>> >> +++ b/rust/kernel/io.rs
>>> >> @@ -173,6 +173,160 @@ pub trait IoCapable<T> {
>>> >>      unsafe fn io_write(&self, value: T, address: usize);
>>> >>  }
>>> >> =20
>>> >> +/// Reference to an I/O location, describing the offset, width, and=
 return type of an access.
>>> >
>>> > In the next patch you implement this for usize, but here you say it's=
 a
>>> > reference to an I/O location. I'm pretty sure usize is not a referenc=
e
>>> > to an I/O location.
>>>=20
>>> Methods like `read_u8` use a `usize` to reference the location we want
>>> to read, so aren't they in that context?
>>
>> Oh .. I wouldn't use the word "reference" like that. How about "index"
>> instead?
>
> "index" looks more accurate indeed for something that is not a pointer
> type.

Actually this creates a bit of confusion in `register.rs`, where we have
arrays of registers, which `RegisterArrayRef` was built using the index
of a particular register within that array. If we rename `IoRef` to
`IoIndex` and transitively `RegisterArrayRef` to `RegisterArrayIndex`,
we now have an index that takes an index...

Besides `IoRef` is more than just an index - it is also an access width,
and a type to convert that access from/to. Would `IoSpec` and
`specification` be acceptable?

Received: from LO0P265CU003.outbound.protection.outlook.com (mail-uksouthazon11022115.outbound.protection.outlook.com [52.101.96.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D01D231BCA9;
	Fri, 30 Jan 2026 14:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.96.115
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769782481; cv=fail; b=laSJ5LnC6h1jnMblRcaTPZYZ4A+FGCkQGD9EWeTsH9FXbtU0J7mK21UcDH/S/Elp90JT3It+gpVkUwUVROYSqjX+9VZEheSvjC6fapBO62jd9jK3c9SbrKYgh5hIkK0+8FuhS/g3DI8ysO+yYWABuDbtXR6b5b68Kph8EBCrEWw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769782481; c=relaxed/simple;
	bh=7+8Gk73MQib+bFagq/jXBiUY4XXKK0edbk6ZzeYw3A8=;
	h=Content-Type:Date:Message-Id:From:To:Cc:Subject:References:
	 In-Reply-To:MIME-Version; b=hn69wAxuDgpjV8bi3OJJq+GuFhcwb8kSZ4G/pypxF+HZ7ObKqp1rmbg0Bx90G0f/UIeR2o12P55TwqtukMaZXyflAKXfS+VH27Ns6xz2EZDHrPjYCilPGqf07KyAkPo/eOuNlHkDK5NVvw9PQZ4dEwta4kxUlP51wdQTun/vw1c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=r/cdEfUT; arc=fail smtp.client-ip=52.101.96.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="r/cdEfUT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=shLpYRC815CS3gN0DaivbIZJTNZ1hwSCHPAKLc3mlKGgQ/10a+5LOS4eMWL3acYZFgx8H6xif31wt3O89ADvMYp1XXdh+r+VcnfvcL7bO8YT/jT2l9WLIlna0uEQBaddxRRL4t6+73YEGhste77SlTSTJeNcs71sRW7TA8QmjolHd5W2ikv7xL8etywktBSO9jM2J+MAr15paIhk2GPj9aQv3ko4XwZ7NP8jOrDgbVdXa3PbX9TvrBGWeYhCRqC2KhhdJ/ctAp5jFi2yDHLXiVgZcfRwn4mvBhs6dkAr7rXzemUEkCbOT+5zE2yaDqSLF9nHMdfA1xJ4GMTr2wHWuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=geOzV1OAPXHM4xtIe/1lLOyaouHeYWlLhrvADktL5sI=;
 b=gui2Vaji2sb/0oK9kf3ZfZVmJCfpm7CG1gaP6gEkk9cX6KK8HpTuvHcX4b/t9rrgsTabr646/92UcFbDsftJsjS6ctXI/nK+0CXPedTiQOZejWgAqJdvx+h78V5SDu6uz8H6FvVkqoe5015fVfXb4dYYapfKT8sDxaOyTmJZ34XUrimFrTVPeSX8I64hMfOQcZDtZwF1B7mz9Ob2ISuZI5Y8YrV/TV6i6rxpyBvK4FEqlpwytBJY1ccxACsnhMoS8UoMpGl1tY0lxlr0RIl1pz7GSSN4mTA6Qe7Ou3u0g5SYkL/bmttT3J5EcWvL7kK3uNogyxnC3DoNCq9VCyXSWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=geOzV1OAPXHM4xtIe/1lLOyaouHeYWlLhrvADktL5sI=;
 b=r/cdEfUTf1K3Rz2dfuSdZzEdpPWjuC36T5C7XfmpYydVq18CTYoF82r6DnbCFxMU4vSddibwnbqqkRLMs0RXIikWW9QpM2VaLOpQj4gArfbBU+FsbxpnzWidhWR6+dQD5XEza1gu5g2CswpIBj2jBOKNEjsvl0E7IxOJFxy106U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO3P265MB2044.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:100::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.11; Fri, 30 Jan
 2026 14:14:35 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9564.010; Fri, 30 Jan 2026
 14:14:35 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 30 Jan 2026 14:14:35 +0000
Message-Id: <DG1ZJ1350EMS.1S1360PA496QG@garyguo.net>
From: "Gary Guo" <gary@garyguo.net>
To: "Andreas Hindborg" <a.hindborg@kernel.org>, "Gary Guo"
 <gary@garyguo.net>, "Alice Ryhl" <aliceryhl@google.com>, "Lorenzo Stoakes"
 <lorenzo.stoakes@oracle.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich"
 <dakr@kernel.org>
Cc: <linux-mm@kvack.org>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] rust: page: add volatile memory copy methods
X-Mailer: aerc 0.21.0
References: <20260130-page-volatile-io-v1-1-19f3d3e8f265@kernel.org>
 <eGcGSx_-fgeLHkPmdfbWgLGhzEcmXunLzIAvS1-X3GqwyFOny9Frz1xN29-fj99sHxxa5_1WrcPxuSSZKxCHhA==@protonmail.internalid> <DG1Y5V810II1.1HE2T0HDBLNXI@garyguo.net> <877bszrz37.fsf@t14s.mail-host-address-is-not-set>
In-Reply-To: <877bszrz37.fsf@t14s.mail-host-address-is-not-set>
X-ClientProxiedBy: LO4P265CA0026.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ae::23) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO3P265MB2044:EE_
X-MS-Office365-Filtering-Correlation-Id: 85b79647-034c-4e8f-ab20-08de6009e585
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|7053199007|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UXF6VnUyQkszYWo4UFB4cm50dDl4VWZGWG5qdTBuTWZJNDVaRFhFc0ZYT2ZU?=
 =?utf-8?B?NmRSTXZLRC9wRTFyb2RDWXFPSFJyTEZHVTB4S213T1JzWU9UUGdUN3g4bDBB?=
 =?utf-8?B?NFNpTFdYTjJ4bVhyaFhhbXBNRDJaS1FLcnpSOGM3Z0pDV01EL2ZmMGFtNjMx?=
 =?utf-8?B?VmVxT0lydy9tNTdNdEFPTkpiejczS0RZNW5KN1hPWDBCYUIvSUkxL0oxOFY5?=
 =?utf-8?B?NXp6RkU0R1Z2amdxOFQ3SVVoaksvZ240QlR3U0xUVWhrbitPUUdaSkdKZWZx?=
 =?utf-8?B?Mkc0UW9xVTl0MGkvT3Evbkh3T2h4VzJXZm4wQ2ZQUEVOTkZyRVUvZllxVS9s?=
 =?utf-8?B?VGl2M0loVy9CWkttNzBlTkVQcWJRYjd3TjFXZ2kvdERQWjd4QS9UcmUwWm01?=
 =?utf-8?B?K1A0dnNkSjQyR3FDQ2hvVFFzazd3amYrb3BhSUFNR1ZOak4vc0MwYStGczBV?=
 =?utf-8?B?aWJpYmpkNDJsclcrYmV0STFZR1hOelBOUHdka2pnenZvUVVraEJLSGVzb1k5?=
 =?utf-8?B?VHNQUjlRVlFsSDYwM25QZUp3YVFnZG1adEVVSk52M01iQ3prdlVFa3l5cHRW?=
 =?utf-8?B?MEJPVHhWNkVhTUI5QVl1VS9nVlVIdnBwcHFYTXlKanh4Z1AyNWNZbGZkR1JY?=
 =?utf-8?B?YnRqQ3J6T29GSkFXbnZKTnF1VXNXOXFvWFpiZzVvNERHVmRkVzlESkFsLzdR?=
 =?utf-8?B?VG9ZUUIxNWFTbVBxTHF4NkRDcmNCUXg4aHFVZ3k2ZFpuNVZBK2dLTFdQRzM1?=
 =?utf-8?B?czgrOGMwTkhCRThCWm95Q3ZrNG84WVFzZGlkN05FVFJjQzNMdVU2LzFmVWtl?=
 =?utf-8?B?bEJNTFhwZDYyVUVLeTZ3T2pOaVNjT1R1VjA2WDRtT1R2MWFNK0Z6S2syQ3dN?=
 =?utf-8?B?bHJ5SFQyNDA2RWtNdlBEeENqUU1xR21MUjlsak9IM0lXK1p3NExNRHgveVlu?=
 =?utf-8?B?bWFvM0ZKOU9pODhVY0pSVWVPallCUHN5ZEZvZWtDSHBHT0VveVlQRmdvdFZ6?=
 =?utf-8?B?K1lDdEhkUlBBZFRkNGkrSXczQ2syYzNDUXJqOTI0aERCR08vM2U0Rjh5SUo0?=
 =?utf-8?B?SDdOSHpHeTFBYkVjaWdnZHBCdktiejhMWDFhR0MxY3RuRGUybmMxMUVaeHZJ?=
 =?utf-8?B?dWNUZFQ3QnVCeDNMZVZMcVB0S1ZUbzdBVUdacmdHWm5iTDZrcEVnbW16NWhZ?=
 =?utf-8?B?OWcyYVhmcEVRR2R1RDdrL0ZqcWZ0Z00xQUJNajVOY2JOemFXeVdhS1FoNHJ4?=
 =?utf-8?B?WG1sS0gybXhWWjUyblpMQmkxTWk4VWlzMDlDbFJoMFdwMWJwQVp2NXdxQWgy?=
 =?utf-8?B?cmwwNGxCekhac2hFcmE2TVlUQUR3Yk1xdFk3VTBmTTJrSnM3WmRrWlFwbExa?=
 =?utf-8?B?THdhSDJqZnV5WGhaeXJIckxCK1NkY1FVYW1EbzBDbmNDQ2tNelVvVnhYaVY1?=
 =?utf-8?B?cGhrZnBwbXMyekVkcDhkcW5OUTRoWnVKTGFtbTlFSE1PQjIzNWxFRmhxQ3Vw?=
 =?utf-8?B?bDZtdVI2Rzdib1NlTHpmUmxyM09tQ2pnbG1ScUhZazFXWU9BNktsdXZoTjZo?=
 =?utf-8?B?dkhiZzNQalNJTmhOVDFJS2hveGVBTStZY0I1QWZyNDlvMHAxMFM5OGw1U3du?=
 =?utf-8?B?Yyt3YjVQNFZuN1czY0x5VGE1V3FBVUhJKzJDQUYrN3lwWWo0Rmt1WEZPdDRX?=
 =?utf-8?B?Zy8xNUhKb1dsZjBSUnFRUDRPd3JMOTNRZVQxWmlYSktOaFltS1B0QnMwME0w?=
 =?utf-8?B?YlRWK1J4VFhYaWRwdzNMQTd5OFpFNE9sOTZ1b1NnendyQ0g1VlRKeWpyVVdH?=
 =?utf-8?B?RjFiVzUrTTRIZkxDOGNibkhIU3pzUUNJTEYvUExWOTZqekQ3QWUrRVNBTS9x?=
 =?utf-8?B?L093ZlI3cTU4dFhCL1R4eEhSbW16VWUzTmZyUVJheEN5eWRuU2laODYrcWpI?=
 =?utf-8?B?MmE5L0RXaHMrSzB6bTlpbkZnb3dGWVpKdkQrQVhKOXVkQTdKRUd6SVUzWFJY?=
 =?utf-8?B?OHJ1ZFNXdFhpbVlXTkxYVGJsSFpkM01SemRadjMwSjhJUkJWanVMbXN0cytV?=
 =?utf-8?B?ZlBFbm9KSkUvSk5UODdxMVZuWjUvam9MWDh0WG94dG5rRlRmcHN3RXlDMG93?=
 =?utf-8?B?b3YzZXFQdG5NNmVaZ2ZGaGN1VkFxN1BrYnhFb2J3dmIxMndNM2lJemJmYXdF?=
 =?utf-8?B?N3c9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(7053199007)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U2xWTUJKOW0wcW1DelZhZVNYZVpqY3pvSmFBdGVDV0RUZDN4bDRybXFUMHM4?=
 =?utf-8?B?U3IvRjFTSjg4OVlnbmRXWmkwK0RrOTFiN2JBNm5wOXFDNXNuOEw2T1UyMnBI?=
 =?utf-8?B?aW9QTXJWVU1CSVhLSityNjJBdjZSSVNKSStsMSswbUNraXZYUHFsalRWQ1JJ?=
 =?utf-8?B?aGcvY1M1cDVuYU1wNnNuMDNDVjdmbm1ZaW91ajBDemMzNWFDSkZIOE1kU0o0?=
 =?utf-8?B?TlE1ZExVYWN1ZnpEbnFVaDFxL1ZpRkY2akU4U2ZMb3dQSVpYNkdqUWFhMlNG?=
 =?utf-8?B?K3BCcUZ1VWZyOHJTc3phVzV0QitIKzlvYUJSTlFMWkc5RWdyZi80cW1ZWW4x?=
 =?utf-8?B?VWdsY25IQnBsd1UzSVN4QTZyYWNQTENCZWV2ejdnQVY5NGVJOEdELytiQUx5?=
 =?utf-8?B?SjhEWEtBV3ZPNDhiYnVKNmJyQ2d5MVJMVDVuS1J4cnRuWW03ZTl2OERTV0ha?=
 =?utf-8?B?dGJkZjNuK0drblBXMUM3NENaSzVyYXZQY3lBM2k3bXdtMWVNZlVzakNEcm01?=
 =?utf-8?B?eTVBN0JCODZqQnVFbjIvQ1B6azBlZktXZmMvQUNiaXozYzAzUTVCajJTbFc4?=
 =?utf-8?B?dWF5WER5cFN0YnVPQ3k5ZjZOaTF3M2N4RVlEb3YwT09IS2k2R2MwN01BSkFQ?=
 =?utf-8?B?aDBEL1NhQWcvR2pxUUhORUYyc2I2K0FkSXdUVitBWXI0SG9JRnZ5SE1SRkdq?=
 =?utf-8?B?VWhaRXpoSTM4cVlEems5UHE1KzlGcHpONGZ1RWp4TDVvMlcyOHd5Qm9uQTBE?=
 =?utf-8?B?WVllT1R3MUYwUit6T3IvS1JUSGV3aGx3STdoV294REJ4bnVyVTFuV3RyOGZJ?=
 =?utf-8?B?Tk5TMVMwY1paZjZCbGlrS1RmV2F4Vkh0N3ZmOFYvQVdSZFdUYWtvQlZlZUdZ?=
 =?utf-8?B?ekRjWHdoTmVNR2pJOWpDSnVqdWE0aXdmVWg5czU2SVlLTlFrdkphWUE4SEUx?=
 =?utf-8?B?ZU01Q29HYTJHYThROURSUytlVlhsZGo3Vm5MVFNMTTVhS2R0YlBERW9MWEdx?=
 =?utf-8?B?bmlGWGpHMWhtN2ZFeHF5VDE4bDk2MnRURlFTcVp0Zi91MEp5Wi96QVBsRUFV?=
 =?utf-8?B?QmJmWDFXMEtnb1p5eXVlUXY1aDdsZ2RTYThFK1lkY0VuU1M2RlM5cDlWRkFV?=
 =?utf-8?B?R3Z0TVZpY0FqNFlrZnN2cU5sQWRzSU1wOWx5RzlBMXZ3VEFBQ3ExcnBOU3FT?=
 =?utf-8?B?d29aYVkyeFdFdWozRUYxV2FXVUpneUlmRGdNaXc4eWM4eVJ1OWNEcmI2VE1P?=
 =?utf-8?B?UFZRMHptOWxoQWllYldhaGdZc1BtN3pYdDg3T3RBRWpIK2p2UUtWZGxhTWFT?=
 =?utf-8?B?R2FlKzlOT3VPQW5BdjFualRYRVlCRndGN0x1aktMS0k2MHdic3lyNGs3NXlS?=
 =?utf-8?B?ZGovMWJVc0dIN2F2V2VqeWZPK0JrUTFBV0U4eHJjWGNDWVE5d1l5NFMxTEJW?=
 =?utf-8?B?Vm1YWksrTlBRQ1dWQ2czcFAzSmdGWnAva3czZXJ6M01RVzkycHJ3ejQzTktF?=
 =?utf-8?B?bFZWa0xNRktXWXJSTStWMnFmRW40Q3RDNng1N0o1OEdNTWIxYkY3UjdBWGs0?=
 =?utf-8?B?UWpjNjA2dXNFNGFCNFJBblVSaUFGeTIycjFYVkdZbzQ4Q3UybGhnVnFDZm9q?=
 =?utf-8?B?Um5VZm5pMWQyNnZhVmVoQVkvdmQ0V1RiN3VjdU80SnRSTUZBbjBqaGpkKzlL?=
 =?utf-8?B?Q05VMWh0Z0kxc2VpRE9jQ0tmL2pzRnd2NXZDVFlTa01wOWZsZlIzSW5sM1Zk?=
 =?utf-8?B?RXpxY0JGTm1Sa1Y3Q1BmRmZuWXFpK0FoclZoYmxLd0hNRitCME5GSUR6azdk?=
 =?utf-8?B?ZEpMeTFtRWV1UEhMR1BzbTJMcGlLMG9QYStLbFErVEZVbFE4Yld3dmxWSlBN?=
 =?utf-8?B?ZVVSclgwK1dBYkkxYnh6QkJ6QnlJMk5qcWFsRGt0Rk5nVlM4bitka1NwOUl4?=
 =?utf-8?B?VGZabWVnTDJETmJhV2Z6RnpkeU9pMGVFYVd1ZytmYmtPWWpoWUtHVUFMRWxw?=
 =?utf-8?B?dmdVa1BXZlY3VE5UTDgrNEpIQ1VIOWJPZytMZ2pXU0JsNFpTcjdkc0RqaDBi?=
 =?utf-8?B?elRJS2dEby9WSXNzazlkdnJDcmxJYk9RK2EzQU1xcU9tOUFLUzEweHFLNG5v?=
 =?utf-8?B?UmtUaWhoaDBYTktTbG9EWGV0cVFmd0p3ek5EOHNQWVF1WWFJd1c2SkgvdEpK?=
 =?utf-8?B?MHY4dXpDbkF3NWRaS0NlTE0yK3B0QUVqOGsxTjFBOUt2VjJHMWVIVXQ4M2cw?=
 =?utf-8?B?b2JMUUFvd1VFbkFOY0NUZFZSQWVHaEE1c2NuR3ZDNjNaZXV5dVk3bC92RGIv?=
 =?utf-8?Q?awS+aV8uyIyg2u/d4h?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 85b79647-034c-4e8f-ab20-08de6009e585
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 14:14:35.6005
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +y4C+ur86up5ccf+Qzl83Y0KIDPpKr8EviWK7Yu1AqcCsY3t2xMd12uryBED1t1mlwb/A8rFCI1oD00Jl3RJhw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO3P265MB2044

On Fri Jan 30, 2026 at 1:48 PM GMT, Andreas Hindborg wrote:
> "Gary Guo" <gary@garyguo.net> writes:
>
>> On Fri Jan 30, 2026 at 12:33 PM GMT, Andreas Hindborg wrote:
>>> When copying data from buffers that are mapped to user space, or from
>>> buffers that are used for dma, it is impossible to guarantee absence of
>>> concurrent memory operations on those buffers. Copying data to/from `Pa=
ge`
>>> from/to these buffers would be undefined behavior if regular memcpy
>>> operations are used.
>>>
>>> The operation can be made well defined, if the buffers that potentially
>>> observe racy operations can be said to exist outside of any Rust
>>> allocation. For this to be true, the kernel must only interact with the
>>> buffers using raw volatile reads and writes.
>>>
>>> Add methods on `Page` to read and write the contents using volatile
>>> operations.
>>>
>>> Also improve clarity by specifying additional requirements on
>>> `read_raw`/`write_raw` methods regarding concurrent operations on invol=
ved
>>> buffers.
>>>
>>> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
>>> ---
>>>  rust/kernel/page.rs | 53 +++++++++++++++++++++++++++++++++++++++++++++=
++++++++
>>>  1 file changed, 53 insertions(+)
>>>
>>> diff --git a/rust/kernel/page.rs b/rust/kernel/page.rs
>>> index 432fc0297d4a8..6568a0d3b3baa 100644
>>> --- a/rust/kernel/page.rs
>>> +++ b/rust/kernel/page.rs
>>> @@ -7,6 +7,7 @@
>>>      bindings,
>>>      error::code::*,
>>>      error::Result,
>>> +    ffi::c_void,
>>>      uaccess::UserSliceReader,
>>>  };
>>>  use core::{
>>> @@ -260,6 +261,8 @@ fn with_pointer_into_page<T>(
>>>      /// # Safety
>>>      ///
>>>      /// * Callers must ensure that `dst` is valid for writing `len` by=
tes.
>>> +    /// * Callers must ensure that there are no other concurrent reads=
 or writes to/from the
>>> +    ///   destination memory region.
>>>      /// * Callers must ensure that this call does not race with a writ=
e to the same page that
>>>      ///   overlaps with this read.
>>>      pub unsafe fn read_raw(&self, dst: *mut u8, offset: usize, len: us=
ize) -> Result {
>>> @@ -274,6 +277,30 @@ pub unsafe fn read_raw(&self, dst: *mut u8, offset=
: usize, len: usize) -> Result
>>>          })
>>>      }
>>>
>>> +    /// Maps the page and reads from it into the given IO memory regio=
n using volatile memory
>>> +    /// operations.
>>> +    ///
>>> +    /// This method will perform bounds checks on the page offset. If =
`offset .. offset+len` goes
>>> +    /// outside of the page, then this call returns [`EINVAL`].
>>> +    ///
>>> +    /// # Safety
>>> +    /// Callers must ensure that:
>>> +    ///
>>> +    /// * The destination memory region is outside of any Rust memory =
allocation.
>>> +    /// * The destination memory region is writable.
>>> +    /// * This call does not race with a write to the same source page=
 that overlaps with this read.
>>> +    pub unsafe fn read_raw_toio(&self, dst: *mut u8, offset: usize, le=
n: usize) -> Result {
>>> +        self.with_pointer_into_page(offset, len, move |src| {
>>> +            // SAFETY: If `with_pointer_into_page` calls into this clo=
sure, then
>>> +            // it has performed a bounds check and guarantees that `sr=
c` is
>>> +            // valid for `len` bytes.
>>> +            //
>>> +            // There caller guarantees that there is no data race at t=
he source.
>>> +            unsafe { bindings::memcpy_toio(dst.cast::<c_void>(), src.c=
ast::<c_void>(), len) };
>>
>> I feel that this should be a generic utility that integrates with our IO=
 infra
>> that allows you to copy/from IO to a slice.
>
> While that might also be useful, for my particular use case I am copying
> between two pages. One is mapped from user space, the other one is
> allocated by a driver. No slices involved. Pasting for reference [1]:

Then what you need is a byte-wise atomic memcpy, not memcpy_{from,to}io.

Best,
Gary

>
>
>     /// Copy data to the current page of this segment from `src_page`.
>     ///
>     /// Copies  `PAGE_SIZE - (self.offset() % PAGE_SIZE` bytes of data fr=
om `src_page` to this
>     /// segment starting at `self.offset()` from offset `self.offset() % =
PAGE_SIZE`. This call
>     /// will advance offset and reduce length of `self`.
>     ///
>     /// Returns the number of bytes copied.
>     pub fn copy_from_page(&mut self, src_page: &Page, src_offset: usize) =
-> usize {
>         let dst_offset =3D self.offset() % PAGE_SIZE;
>         debug_assert!(src_offset <=3D PAGE_SIZE);
>         let length =3D (PAGE_SIZE - dst_offset)
>             .min(self.len() as usize)
>             .min(PAGE_SIZE - src_offset);
>         let page_idx =3D self.offset() / PAGE_SIZE;
>
>         // SAFETY: self.bio_vec is valid and thus bv_page must be a valid
>         // pointer to a `struct page`.
>         let dst_page =3D unsafe { Page::from_raw(self.bio_vec.bv_page.add=
(page_idx)) };
>
>         dst_page
>             .with_pointer_into_page(dst_offset, length, |dst| {
>                 // SAFETY:
>                 // - If `with_pointer_into_page` calls this closure, then=
 it has performed bounds
>                 //   checks and guarantees that `dst` is valid for `lengt=
h` bytes.
>                 // - Since we have a shared reference to `src_page`, the =
read cannot race with any
>                 //   writes to `src_page`.
>                 unsafe { src_page.read_raw_toio(dst, src_offset, length) =
}
>             })
>             .expect("Assertion failure, bounds check failed.");
>
>         self.advance(length as u32)
>             .expect("Assertion failure, bounds check failed.");
>
>         length
>
>
>
> Best regards,
> Andreas Hindborg
>
> [1] https://github.com/metaspace/linux/blob/3e46e95f0707fa71259b1d241f689=
144ad61cc62/rust/kernel/block/bio/vec.rs#L142


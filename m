Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on2046.outbound.protection.outlook.com [40.107.212.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8A1B72608
	for <rust-for-linux@vger.kernel.org>; Fri, 13 Jun 2025 20:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.212.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749845199; cv=fail; b=VymgLoHd87DiMhpvqZ7mbNiRKTKRb9VyQOk0GgYDU8seWodRNIeTtIPRZfxgy01zuL98IZdvwKMrwWjoe6VZuEZw1AYVg8vRn21kThAUu7BkrlV5MhZYuzpqGi0+7q7yBUQOpcUPfDHKQ+mRdH0EcbpmR1hX686E3edxCLNyQCI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749845199; c=relaxed/simple;
	bh=p2OcQdjXXXCdfW9HYX1NgN1OOBrurqvS2WxV9Q7WE7k=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=jIrLNWZHBy7NJLb2AzGPd0VmjQxkLSD5GBhp23TABLx99UcnWHosPFT+VFx+/xMScXTvd2tEWabuFd9RXXs9AZd79vWL7T+GzxvSuZzGoDhI8vkSQ+UP/HCM6Asfbs/84pjjyLjdeS0YCbpMS7BRhFq3BNj0sI4k799pYvqkaxw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=N+VyNlbb; arc=fail smtp.client-ip=40.107.212.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="N+VyNlbb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QlJvbBsb5w/+J3Bylalw49utwc1RhmD27lFMleOxZIzG3dfx3m5MIk66J18yJpNf7UjFpMwMZWtYRKNVU6XfS1mS87JvrPJncIw18992GWkYIu7/zVDfIC0SNh/1IWUycgIhDUMbvmweYlRExc6VA8UmSlVSXnL0cSt+DohF+5ks1HFUdQFvoPirdPnqoSFZnurFg4z17mlvai7vJN2T0X2EMxUyMOqQFXlvYajnzp0jodeFuEcqQACDKHs2xkCvXpYGIJ6NQ7/LqIWbYwxje5rj8uJkidzGiuHEURpAJmRAed2SIJK2TJTOYlhRSaBE5T7SbLtYAFVPlUqAGIl8kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p2OcQdjXXXCdfW9HYX1NgN1OOBrurqvS2WxV9Q7WE7k=;
 b=MLf0M4VT/AmHHxY8hyfYWUCIbvqyJLRWhkPR3vZtQgKM/aZvYEQmiejPbgp1boKXLx+bY95GmL0i3c4xPNJuxRjNz32JQQ9KqdImxWwpzAMBifuqxyrGmSEs4xt4cy0qqsprprR8kZp0nSR8Z6Y08H7cuhGcbewEO3nURIrOy/NYHE5SLkuv76qVp6+EdVsX9zMqoIyMPMBVLe0AzQ/paEgbh40V08pcOhseHvmeAwOuDWqQnGOzVlfGbfS7b4IibVoTSULRJ0xVvUs2vhNZTFbxE0eHjOmaAEt3uukni4mF5BKnHimH+j5d74nL39HUEOSnuQ+i+PmB+yKL4H4eSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p2OcQdjXXXCdfW9HYX1NgN1OOBrurqvS2WxV9Q7WE7k=;
 b=N+VyNlbbKc4fO65RJJmM3tYsctutJahpULICcLPkLVMwoQwwEJqXffTdLsbFtazAHODiGsBRF5qpi9L3MbhRslKrMgbB79qMtZul5xbFbAF3RPH3xPh6wvUdhFnYU6X7olHV8Hnjv2eo/n3kKR/cDcNA230ay0bECvukZ8chdBcp25vcqtdm/JR5tVJqEM1YL+EJQ55HbPX9XZrX+kfTUFP/v5OGEAjnGniz2FiTzwaDkOwTBrt3RxfznZSlC6ekn1G/lgx58LbySqMD8uWMO6aTf/2gQYA/BzuO3JmCdVkyTRDFMzc8vrBLRZOx7y5iajwGHiDUsnCCrLZPjnUZSQ==
Received: from CY5PR12MB6526.namprd12.prod.outlook.com (2603:10b6:930:31::20)
 by BN5PR12MB9511.namprd12.prod.outlook.com (2603:10b6:408:2a9::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.18; Fri, 13 Jun
 2025 20:06:34 +0000
Received: from CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::e420:4e37:166:9c56]) by CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::e420:4e37:166:9c56%5]) with mapi id 15.20.8835.018; Fri, 13 Jun 2025
 20:06:34 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "ojeda@kernel.org" <ojeda@kernel.org>, "aliceryhl@google.com"
	<aliceryhl@google.com>, "lossin@kernel.org" <lossin@kernel.org>,
	"dakr@kernel.org" <dakr@kernel.org>, "rust-for-linux@vger.kernel.org"
	<rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v3] rust: introduce sfile macro for succinct code tracing
Thread-Topic: [PATCH v3] rust: introduce sfile macro for succinct code tracing
Thread-Index: AQHb2Y76GidriUYRM02FngySpVCBwLP8FOaAgAVrw4CAAAmKgA==
Date: Fri, 13 Jun 2025 20:06:34 +0000
Message-ID: <922a39510eb74ebb2e463d20d7d5cc5c23316155.camel@nvidia.com>
References: <20250609223606.2897030-1-ttabi@nvidia.com>
	 <DAIPZJ4YMJOI.2HYMHADQG1YER@kernel.org>
	 <123f682b56e1ecc24bb2dcc351f536641920fcf0.camel@nvidia.com>
In-Reply-To: <123f682b56e1ecc24bb2dcc351f536641920fcf0.camel@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR12MB6526:EE_|BN5PR12MB9511:EE_
x-ms-office365-filtering-correlation-id: 1cccb63f-4427-4e95-3e7b-08ddaab5cbe0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?MUp4TTlEN0J2RU83aTNTa3VvZ1FuTzRoeDZkLzVGUjNMemtBeFdpQUVNUjBG?=
 =?utf-8?B?eFlEZWs0bnpzMTB4WnFZem9yWDcrWTYxbFIvcVNDRllWU2xrem1VdFZia1Ey?=
 =?utf-8?B?cnpDZHAyampVdC9HV3gvNGVLV1dhekpodS9CVE1ZR3pHR1VuTFBXaTNGK2wz?=
 =?utf-8?B?Uy90WEp5elNHUi9DMklNbXJXdjdwRnR3VmdSeFJGZWtCOG9TMGd4UTdhOU5o?=
 =?utf-8?B?N3NlM2hxTDVNb1o5VFNraVpHWTIwVmxIVStmZXF5MEViU0NVUjZhS2pCMFl3?=
 =?utf-8?B?a3I3ZnVZbFdhcE16WWp3YVlqNnB6MGNEUHJ3bnZlSms4YktEOWF4NWg3TFRy?=
 =?utf-8?B?V0hGQ2U0am9XYlB4UnZXOUVNc1k3UHlTT2xqV3BPTVdpQUZncXBYTHZ4MzFk?=
 =?utf-8?B?cUJXNVhGd3kzemVreUdRaXpDWnpEWE9jYmM3OXIrTld4SVlYYy9SRG5TMEh6?=
 =?utf-8?B?M1Fzakx5RGtLL29TNnlwMFhnRVltM1dTVDYrMENOWDk1bmR3Z2lzZEc4SjNa?=
 =?utf-8?B?TEZWSjdZcUNtLy8xMmowNmdLeVFMbUQyQWpTYTJNL3E0V3JjUjZyS0JZM0kr?=
 =?utf-8?B?YWtabVhWcjVINlRtdUVzK2hYNTAvNUdFQzl6bHUvMVFkTkdwYmZEbHN3OWs0?=
 =?utf-8?B?T3VnbHhVWjd6ZW1yOU1yK3FNV2NwU29QNnJFUTZuclpvSFZZNWxkYytTZ0FX?=
 =?utf-8?B?VEVDNHJlRGcvQVNoTlBNVklKQjl0dDRXcEozYXpVeGdrZno0aWtrK3lsRm1Q?=
 =?utf-8?B?ZjlaMEM4bEFaZXl3WlFuaG1vQlE5Qk5lZWVQdHltZVl1azdyNFhtTlVtSmpm?=
 =?utf-8?B?M0VsTTdXU0VDdGlHQ1grU01XYnlaMFUwTjJQci9tVDlTSFpVUlo3V3MzdjBU?=
 =?utf-8?B?MHBQK1gyWnhibjFEdVpSNDRPVFNoN3cyR25lT0RYcFErWk1OK2tJWk5WSFpq?=
 =?utf-8?B?ZTA2UCthVXU2UnNYazNFVDFrRVZoN0UzT2RQU3p0SllFRTBZT2JpdnMwaVdy?=
 =?utf-8?B?MUErYkNTQmV5SXh3YkVSelVLNDloYVJxYUxUdkxQVElzazFNWENPMzhFTnFk?=
 =?utf-8?B?NGsrTjhqeVZDeDU5Wk1ySEM3NlZ5aFdzWXd4N200YkxvcERiR3ZzSHM1ZGZE?=
 =?utf-8?B?cElURHVVM2czU1pWM2ZqUkZMeE84R1B5YTFMbVN4Rzc0ejRDRS9lRUZPNU9I?=
 =?utf-8?B?akxIbXJuWXB6TTdESUNOS1ZxZGJ5L3M1cWN4TnhKS2RpSVY1UkJYMkJLWlMx?=
 =?utf-8?B?WkRSV0xGazMvMmpscUNrWXNvd3IvWW92d0hsRkpMTXNRRnBxWnRTclJoWDI1?=
 =?utf-8?B?elp4d0tUQkZyZEl1Ny9WZkRTNFZDdVZrVHJuSTR0cHdrN3FBM3BNYUs1eFEz?=
 =?utf-8?B?amZaUkFNend3VSsrdUtBR3pKYXl6UVdWZ25URDRYV3VGdW4yK0FnRzMxUEpP?=
 =?utf-8?B?ek9ha29uZjQxOVpYclpUMUxDelc4S2RjZDNyaGdreC9lR1YxUHNpdDBDUUFM?=
 =?utf-8?B?TmUyaWZpOFhDeW05and0MmtkQzJEOSs5d1JObkNpQk8rRVJQV2xtZ25DMHly?=
 =?utf-8?B?a1lHOUw0UkZ1NXJLeEgwd2cyNjlObENIL2E2Nll0YkFHaXNzUzNwTmc2NlY5?=
 =?utf-8?B?c1dXMDM5WnhydzcrTGRuUzlXcXJaQlBuT2dwMnQ0cnJsRmYyK005TkJOV3Jm?=
 =?utf-8?B?ckdkTUNrV3NhUStUM084dTlHTHd2QzM5cUlncDFwSzZ1cUFFTERVTUh0VmFx?=
 =?utf-8?B?dFl1YW92YmZTbkJwZGNVZkxiOTdhamdmNHc0eXNHSjQxcjdYcFNuWlRWQWow?=
 =?utf-8?B?SlMxOTRlNHZoNkl1WGxwY1VGUkdpbExkUzMxL01PM0JZTERyNWFId0pmRFF6?=
 =?utf-8?B?YkZHc0RwL1Z5cUNkRDc2ckpGQXZVeXh5OFM1d3AxT1BtbWV4Vzc1YlFuNWdn?=
 =?utf-8?B?bW5yMHQ1R2hyaEV5TTRoanpYZGJBbTRwaFFmQ25JeHZKZEg1UmZTNjhqVU1s?=
 =?utf-8?B?M1E0SHpLQ3B3PT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6526.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bGdPak9BREUyVVBrWmxwcER5SXRvSEN0cGJwaGdpakovVS83clBZeXRqYlBk?=
 =?utf-8?B?SGxCL2Y2NDZIMjlvVEhVZU5CeDU2Z3JuWUlmNGI3M1ZxcWQraHZvM2MvcVA4?=
 =?utf-8?B?RWFjdWlUV1lJTFM2bm95akd1bTNBS3dpZUp5NFZvaUxQRHZva0ZrNElwS0Vo?=
 =?utf-8?B?TkNvTUdUWG8wSWZvL3Q3djVHUkk4cU9udm9DOEVqWWpLWU8zZmRuRFp1Wlp3?=
 =?utf-8?B?Z2p0TVZNREk1c0pONzdTajMwclJuaTRWZHJnSzlpSmgrUno1L2NaZ0NiSDRO?=
 =?utf-8?B?d1hITGNnWVNQODRVck8wYUZJQTF1UVltVmZJeW5VS3dweTlORENNNHJQeHBN?=
 =?utf-8?B?ODRRbmRrQldKS2N1MVJDbm42dUtweTQ4QUZYOUJZYlBUL01XTmVKZWlzRFV6?=
 =?utf-8?B?SkhibjdScjkyckhZa1Q4TDlqVE8yY1VXSWt4NzVZYzc0TklGbFZ3Wk0vOEVG?=
 =?utf-8?B?MXpSUXUzNG4xYmJkKyt1VUE5QjB1THdJQnRXcGxXNS9mc3ZpaFJWcmhYamZn?=
 =?utf-8?B?S25NNWNYVE4xNHcvSk1IU21KdGhBbjVTcWtYQmo4c2phd01qRnp3bmpCZ2JP?=
 =?utf-8?B?OHplSmlHM2RRclRTMEZDL2VMM05VUEsvbHFnZGNOQ0F3ZXZNT0t4ZzhmU1dQ?=
 =?utf-8?B?Mi9oLzRUQyt4RFdNM0dhWGp0NjcyUHNhWTVmQVJHZ3R6ajllaXdkL0FEa1BP?=
 =?utf-8?B?b3R6UnpZV21PZzNBOW5PL1ZhcWMwMC9XSzF4Q2pRQ1diaUpaNWJPbmxLZzhO?=
 =?utf-8?B?VEppd2VraXZXeFRyakh1cCtSOXIwWDJiTlgwNVh1QTl3QzI2bHZuaDI1Q2Jv?=
 =?utf-8?B?YVRDREdrVng0eVljeU5LVEl2UFhnZ0dDa2tJRU9IcVQyTkR6T3p5aXJhYk52?=
 =?utf-8?B?OUtrOXZHcDFkdU53UERXRzQyeXdGTS9ETXQ1ZGFUSjg5QjZ5UGtick9CR2wr?=
 =?utf-8?B?SExLLzRjbHJqQ0UyL1dmTXRSNndzTXQzdVlyOHRUUis0YlBVbUFHcDE2Y2JF?=
 =?utf-8?B?OVUvQzNSUU5ISW40SzRWbmVmY2dJZVF4MjJGdlpDSmFqdWNvVC9pRCtpTTR6?=
 =?utf-8?B?bkUzNitUcStiRFZrcUthOUdjUmNkdHRkRklWUTZlN0h4UExybG9GYzlHNEE4?=
 =?utf-8?B?cGt4WFQ2dWdHZDNrVjZFNGoyTHFKR3NKRmRWdHU0dlNVYkM5cFZYWU9hN0lt?=
 =?utf-8?B?Q2xNOUtlTDRGQU8wVVk2bXVLU0grNUZWS25XdUFuOHlDYWQzZDVRclpsT05V?=
 =?utf-8?B?d1lFMk1MVjNQZ0JBaGVoL21FempHaEJZQ3NWSEV1Qy9aci9lV1lTUnpLQVlw?=
 =?utf-8?B?b0JLaFFpT1A1QzlqeS84c2c4TlRTQytTaGVFWmc3dHBLeXVpbVFiQzZGRWtN?=
 =?utf-8?B?eWxjbVU1ZWFDZkhGa0xoQzdVdmprQnN4VXNIUlVibnZ6Nzh6dGRCRnE1SmxX?=
 =?utf-8?B?Ui9hM2N0cmZKUVY5amZsc05aUHhQbVVGbU90OWd0SWQxZFVHMEgxOVB6R25o?=
 =?utf-8?B?eDBhbTJuOVZxSXY5ZlNvYVQzb0ZmQ1RTVWRXS0pTaDdZWkg5cDZBNG9FSkRy?=
 =?utf-8?B?UmRrcmZZVXdFalBFZHFDUVlvdElmQ1VGbUxzYVFlb253MlRIN3FPMWFteE4x?=
 =?utf-8?B?UjQ5STh4MUduWk56NVVsckR4U3d6VWhHVXVDZEhkM2RqN3d2MUwxczZENTVw?=
 =?utf-8?B?bkI3d0VqQmcwVnVJb1ZucFhjcjRtSWdyRXVxYXMwNlZvNkorRXMxZGg2eTFz?=
 =?utf-8?B?YmlEV2VJUlBXa1QwVm55bVN2bTJSUWxtWnZ0QXRnak9tYjcvTVByZHFxbUM4?=
 =?utf-8?B?SDZwUitmdk5ROW9rTCttVmVXaTZHYU5FVElFWGEzMjJ3NHJVb2o5UWJiVDhQ?=
 =?utf-8?B?TjlsZU9tSUpIL1lJeEFSZWxZZW9pMm00RHpPYndPd3dDUHRLUEN1UTZFRFM3?=
 =?utf-8?B?WE0vaVlObFBkYm9iMmtLRHIzNlpxVllRcXpnaEUwbWZIeXFIcG1Bb0RtbnVU?=
 =?utf-8?B?akt5OXJFNWhtbWl0akxHMmk5SS92V0NTQzkxNUc2cG5QeDZOQ0tVamdsaFVo?=
 =?utf-8?B?S1V2WHlGdGxzQ2NpemppazJjbFMySXlBSlVvNGM3K25OcW1qTU9GR0pWK3kr?=
 =?utf-8?Q?xouttbWi7lvQ+5wD6Z8OY8BjJ?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3AD4AE694592B9429F71480AD18DB07B@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6526.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cccb63f-4427-4e95-3e7b-08ddaab5cbe0
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jun 2025 20:06:34.2450
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: It7C2SYYmDHmi1KP64nyDFo4PcQCggoMJscQ3IQz2HgDVgiRU8RDG1KMGdmiU2tmzK0t9zpDNlr1eIx65p9sAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN5PR12MB9511

T24gRnJpLCAyMDI1LTA2LTEzIGF0IDE0OjMyIC0wNTAwLCBUaW11ciBUYWJpIHdyb3RlOg0KPiBP
biBUdWUsIDIwMjUtMDYtMTAgYXQgMTA6NDUgKzAyMDAsIEJlbm5vIExvc3NpbiB3cm90ZToNCj4g
PiA+ICsNCj4gPiA+ICvCoMKgwqDCoMKgwqDCoCAvLyBbYC5hc19ieXRlcygpYF0gZG9lcyBub3Qg
c3VwcG9ydCBub24tQVNDSUkgZmlsZW5hbWVzDQo+ID4gPiArwqDCoMKgwqDCoMKgwqAgYXNzZXJ0
IShGSUxFLmlzX2FzY2lpKCkpOw0KPiA+IA0KPiA+IEFsc28gaGVyZS4NCj4gDQo+IEkgY2FuJ3Qg
Z2V0IHRoaXMgdG8gd29yaywgZWl0aGVyLsKgIEkndmUgdHJpZWQgYWxsIHNvcnRzIG9mIHRoaW5n
cywgbm9uZSBvZiB0aGVtIHdvcms6DQo+IA0KPiDCoMKgwqDCoMKgwqDCoCBhc3NlcnQhKDo6c3Ry
Ojppc19hc2NpaShGSUxFKSk7DQo+IMKgwqDCoMKgwqDCoMKgIGFzc2VydCEoOjpjb3JlOjpzdHI6
OmlzX2FzY2lpKEZJTEUpKTsNCj4gwqDCoMKgwqDCoMKgwqAgYXNzZXJ0IShGSUxFLnN0cjo6aXNf
YXNjaWkoKSk7DQoNCk5ldmVyIG1pbmQsIEkgZmluYWxseSBnb3QgaXQgdG8gd29yaw0KDQoJYXNz
ZXJ0IShzdHI6OmlzX2FzY2lpKEZJTEUpKTsNCg0KSXMgYHN0cmAgbm90IHBhcnQgb2YgdGhlIGBj
b3JlYCBtb2R1bGUgaW4gdGhlIGtlcm5lbD8gIEl0IHNlZW1zIHRoZXJlIGFyZSBzbGlnaHQgZGlm
ZmVyZW5jZXMgaW4gdGhlDQptb2R1bGUgaGllcmFyY2h5IGluIGtlcm5lbCB2cy4gcmVndWxhciBS
dXN0LiAgSXMgdGhlcmUgYSBkb2N1bWVudCB0aGF0IHNob3dzIHRoaXM/DQoNCg0KDQo=

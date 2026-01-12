Received: from CWXP265CU008.outbound.protection.outlook.com (mail-ukwestazon11020091.outbound.protection.outlook.com [52.101.195.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4DA835770E;
	Mon, 12 Jan 2026 12:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.195.91
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768222643; cv=fail; b=SDte51At89ccw2vlZ62uORCYEgTPiXV0SW90JEO5J6TLL2BsWJBYyTLdYXDIrIz9I5ncu8vrQLUEcIWlU9jZleeAvUW90LTd0Dy/616rz8oQFSShdYxaZo8BnpNIHNxzUNwbPgeLFgvm8NajgwSIEiccAIvztKzTnCDuYgcK94k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768222643; c=relaxed/simple;
	bh=p73WYBt0K7SvphHjZRTmUH/KmRX59Fel4kuMkoeTlr4=;
	h=Content-Type:Date:Message-Id:From:To:Cc:Subject:References:
	 In-Reply-To:MIME-Version; b=UpAT03np/T9b3FFEEeO7+qRtpo5bPloJihT3OYphcWRDuwP/dkVoBVMoHA6qtfThUUypnvpPYDiYFptf+tTcb7GyAC+udzmahwxqWJDwvIex1Pb+Ww2yuw1XZMvlVMAK47GhIYKRlY91VdCshathkWvfpFfpk1syGMqjfY0ldkI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=Su2jpgvH; arc=fail smtp.client-ip=52.101.195.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="Su2jpgvH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tcDXGKMf2KNO7t/BbZEYSWDJw7/tfx/X4Xr2CLIwl7sRD/Ms5VCIah3Yafxbre6lpyIrTdzsSr2VITPBEFqDxFrneZSDuFiNkhGdTPQLoyc/tAWZh5qy/px7p7OiufUA/Jx61BRWl0u25paIQ/VAOxR3hx6c+7+ooKd+YVG8b1usGdTLU4iuq00QpFKUb5VJmdNUaFz9lB4xc8ghvASQ+oiz0NZ0PHff6nKFQuUlujRJ8lOmgV+pGOB7wtobjIN1XAb6zXFASVkuhMkG1YVjuscSA/OCeHA2lz8p9OIf8u46kAvKcET5ir1On9hb2+fmrvhXpqaH+6Xf7zREBB40eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ll+hOf+LlkmPAD9BJCNErhlSNBZiDONosimJLwqN8GA=;
 b=MbNJJNFRG914kUYYfr34v5vbOf34itnqVi+WxFAtdJosjQWuQGu5bfGpg5/bt7kAN2jdkqoLLkV0BexWIS7FvMIWhOLuL1Lv9msUjTzQr0QS6JkatFJk+jzZ6a4beiIUi+hQfih7QH+Jq2pWL/egJcG2C6WXB0TOXBtvHYRgEYDswkGT4Fz+W77256sDOBp9CX7t96d4P5xNbyK66k0vmf+nwh0QOfljOLTQXu3atgrFqnH1PqIpZd5a0iTlwIT4aG4U68sFTO1bgJlPqj0pGTNHi75eKzOu9r/fHsR3lnJpbGJnwxEqjCFFUix6WDaQrp9ifgdAD/wgFHSK1R8Y6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ll+hOf+LlkmPAD9BJCNErhlSNBZiDONosimJLwqN8GA=;
 b=Su2jpgvHus13GbR9hPF5+yoKzc0wOty/TKz+RpgwBSe3gG6M52zH1LPo5QqpWMIt4zIwsq0ueP/sguSEMPDaVviOzRIoEnafIfgrE8J1T4rno6bkfSraSF6dI4lQnSs8nhtTtJ3elcmx+Z2RCrZydthtI5C/PkMaKE1E+uRBQxQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWLP265MB5635.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:15c::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Mon, 12 Jan
 2026 12:57:18 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9499.005; Mon, 12 Jan 2026
 12:57:18 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 12 Jan 2026 12:57:17 +0000
Message-Id: <DFMMM1KRM6VT.2W0EZPI2I8CYX@garyguo.net>
From: "Gary Guo" <gary@garyguo.net>
To: "Benno Lossin" <lossin@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "Fiona Behrens" <me@kloenk.dev>, "Christian Schrefl"
 <chrisi.schrefl@gmail.com>
Cc: <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 01/15] rust: pin-init: remove `try_` versions of the
 initializer macros
X-Mailer: aerc 0.21.0
References: <20260111122554.2662175-1-lossin@kernel.org>
 <20260111122554.2662175-2-lossin@kernel.org>
In-Reply-To: <20260111122554.2662175-2-lossin@kernel.org>
X-ClientProxiedBy: LO4P123CA0538.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:319::8) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWLP265MB5635:EE_
X-MS-Office365-Filtering-Correlation-Id: dc315850-beb2-4a23-fa40-08de51da1dfd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|10070799003|7416014|376014|366016|7053199007|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RGMxS2ZmdmYzK3lLYU4rdkRNcVpQM2QrdFZqY3hTNkhwbGQySHh2U0MzTGtL?=
 =?utf-8?B?QXo3b0tuSnE1Vk1SckZ2Z3hXMWlOWjN4ZjNBdEZNTVNJTzJqYm9RT2paV0s3?=
 =?utf-8?B?bGF5bktFZ3h4MGQ4ZStPc2VZSExGRFdiNVdPdVR4dXg4ZDBBVVlwWlNhTWxF?=
 =?utf-8?B?WDNDSDZxMUdlYWxHTUpDSU5vaHNUMWw3bUFDbjZwN1FCK25GQU5meGw3TG16?=
 =?utf-8?B?eU5pc1k1VUcxQTk0V2tEY3NkSXRHdHBKR1F4TUVjQ2JQSUdDWDdpVUdRMWln?=
 =?utf-8?B?RFJlOXdEb21JcytwQXI4S3RjWjlUUzZtR0E2YWNJVkZKYk10dlQyRzBHVWV6?=
 =?utf-8?B?SnpLaFhEQlJYUlBuWEdUWVc4bU5FZ2VRVVpDQlp5MnMyT3Vod3JDUHNYUjhh?=
 =?utf-8?B?eXROUDltQUF1V0xyT1Zpb1dtZFBjMndxd29FS1NLQitGS2VkYTBvaHRPNVZo?=
 =?utf-8?B?Q0NCWXNqdHdJWXpDK2cwRlloNTFpMEpHM08xM2dmYUxwa0FzdlJYQzdobS9H?=
 =?utf-8?B?c2ZZUlprd1FKY25jclV3cHU0ZzRnMlFWWUNyOG9QeDJ4b2twL1E3TXZDNnV2?=
 =?utf-8?B?Y0U4LzdEOWU3dDhRV080R0JsZ0NlMVVrZ0d6VFFvSVlRM0pzb0lGTncySHQ5?=
 =?utf-8?B?b0w1aEV1d2ZoYkkxMTVzNkN0TWt3V3B4M2JldW81TDBJN0c3VVFXSFJybFFl?=
 =?utf-8?B?Zjl0aldiUlo3SXV2SW1EVkxKODJQa1I4Y2c0RUI2NVI3SkIxUE9vWGFBM2JL?=
 =?utf-8?B?VDZJeE1SVys4c2Yxb3lXNENUNkhybkpLSzRsR25YV2xVRWtHdkxwN1hmdmw3?=
 =?utf-8?B?bUphcGl1MEJLYTI1aWExTWpBcG84UDl5R0l4T1BKRkJTZ1dQbW91LzYwQlJj?=
 =?utf-8?B?eHpmejF5b1RIZ1B0L3ZTeklvQUhReUNlQ1FoNFpmTFI1Q1c4WXMvSFdpVTYx?=
 =?utf-8?B?bVZQZEFhNllwcEkvT2ZTK0U0MnlwdE1sQkpMNWVuM1ZUR0JjZUJFbHM3bDUz?=
 =?utf-8?B?K1JleSsxM2phOVdzWTNIbG1OY3RncVBwcWViUFR3RUhaQk5DRHlub3JkN1o1?=
 =?utf-8?B?Wm5MK0YyUENteTVBU0g4THl4Y3YwdjZFaDNKTktkYkhzQmsybkY1R3pTcGhw?=
 =?utf-8?B?cGdwZUp5SUVLQWpkNGp4czUwWUtXYUVGbFVtUDNTcG9jb01GRnh6bGliK2Jl?=
 =?utf-8?B?cnhSc2YvRG51eVZTemhXSEhNTUxMdzRGb1hDWXErbDZHMEtocnplR1VtYzZq?=
 =?utf-8?B?aGlkMUVYWEZIVGNnNSs2c2V4MGhHWEZpbWhHeTFJUDMraEdLMFlORWpZeDQ5?=
 =?utf-8?B?dUZzWmZRU0xtUzQxRlNsekJJQmNMUEZkS2JPMFNMa1dNYlJXcXladmNpUGlx?=
 =?utf-8?B?aUFVVTdXZ3FmR3U0NzlrdGF4RUM5a2JJZFVxcVVDRGVab1hnY01YMEoxZDFR?=
 =?utf-8?B?WFVPQ2J4RWtwR3VwSU80dFRnSGkyUDNtWWFmMW5lUGVlQnM0OWVvTytLbmZ1?=
 =?utf-8?B?SXVaVFNxOWFPMG9RSkUwRXpaUGhPZHE3SkFibVdROTUrTVRMSGlidDJHZVRK?=
 =?utf-8?B?b1NQeUNqcEs0UUc5bStYUGFrc3lJWC9TMTVNN1hGN2tvRFA3YmtVQ0R1TnJF?=
 =?utf-8?B?WHB1anNoWDJnNFd1YUVtRk1hNzJBMlFiY3l1MW9KSFlyTnlobGVwSit4eGNv?=
 =?utf-8?B?WEtGV1ovbzBMZDlLY21FZDlLOXdFK0RYNFF4VTFiYVJsRDRhZGxOaXEvUDRY?=
 =?utf-8?B?S0tPZmpRMkZrVFVFMnhDR0ZubmkxRUpQUGovRkNCZU9CR2VNclBCL3owSlFh?=
 =?utf-8?B?YzNqZDEwOGw2VDNIUXFIYWppd1FYRkpSUDdrT1lraWlvdlp2NVRxeVdTU25S?=
 =?utf-8?B?aTNOSC9IZmZQaGJXYVdCMGo0OHcyUnVocmMvMkdGdUM5Q0ZWYmM5WjBZYUkz?=
 =?utf-8?B?T08rb2hGY1hDcFJ3ZDlCeTl1eGVoaThtZmNxWDRjU05PMzBTU2Qzd0ZpYXcz?=
 =?utf-8?Q?N0cOkmTox9JkDNUXjO0waicw27EApo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(7416014)(376014)(366016)(7053199007)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eVBwRVBEc2xSVUJUbVM3WXlycHg3WVdXNFB6UHpyZkJDSUd3MEhteTlCaTEx?=
 =?utf-8?B?aVQvYjllcDhXSGdSMFNOVzVPVHlteWY1azdMNjZ0RkVZczB3bkl2a1hGaVA4?=
 =?utf-8?B?ejM0bDRqR2xyeGlMZkw5eWNEeUxjd2Z5cU44eW1RSXJCQk1KUzM2SE82S2dl?=
 =?utf-8?B?cWtPUStkakRRZi9nM3lWc2R0QVBmWmpsa1F3cUZ1dE9jZHRiamgzcVAwMktZ?=
 =?utf-8?B?SUt0TlpBam04bFJwZ29aSXltVzNrWlNOelFCT2dPS29OWnEzRytoTWF1NWhv?=
 =?utf-8?B?MEtIdVVaSXlUaHNlcXk5RGlpQ0pVS0RNTnEwU3V2MTZhUmhBaGdvWVFQNmQ2?=
 =?utf-8?B?djd2K3VSSUlzUkMyRkEvRnFEc1ExR3N1WXNha0R3WmxYdlFnNEt0UHZPR0F5?=
 =?utf-8?B?R0gxVVhqVThUUGh5QzdYQ0djRWxFeHp4Nk45RjNZZ0VhNHVXMXlSa0YxclRL?=
 =?utf-8?B?V0JMM0RnOFc4TU1Da1ZieWcyYWlDdVdCKzR4UWZXeHEvUjRuN2xlMkhtRVlh?=
 =?utf-8?B?bktUWnlrL3gyNTdvNVM5a0w5WW1lMGd6eHRDZWpRQldDSFBTVis1aVExdUdJ?=
 =?utf-8?B?aXc5Z2FmV0puYytqSW1jMnJ2QTNWeDlYbVE3VFlwSWJNVTFnS2lRQ1lPZkJC?=
 =?utf-8?B?QUxXb3BTN0pCcHRwSjRKb2ZBaktQWCtOcUJBNmZmNGJqdm9Kczd3bE5Pc2Fj?=
 =?utf-8?B?ek9Td3FkOGxrNWJMRmIrTkRkQkRsejRlUWprZzg3bUtnWkNvZlI2SGczeVl0?=
 =?utf-8?B?MGlJWnpKU3hXc0ZNbEFVaTZ3d25mUm9vb0dWcGczNmRSTzZ6d1U3VXNsalA1?=
 =?utf-8?B?dHRVTnpFcjF6UFNEdnlaN3dHR3poNTZreTcrRVEwemVIM1NKaE1HeEx5eGI3?=
 =?utf-8?B?bGRWYk5LVHcrekFURk1qNWNuQ0xGZDAyU21GU0dmOWtMaXNOcE9QRHI1azU0?=
 =?utf-8?B?ZWVLLzNEMlo2TmhlZVV1ajM2N0VNRFNoWTFuQjFieXd3Y2h4cG4xa1VUdDZl?=
 =?utf-8?B?dlJqKzlmU1RRU3NFRi94azZPTXMreldEWExEWnF5TDhoOWRCenB4QnJMVVR6?=
 =?utf-8?B?Vk1Ba0RBaXE2N214Q2paNGlpdFc2QXFTenloZ0thd3RnZ3JpSHBxMGhGZzUy?=
 =?utf-8?B?UUpMUm9LVGVJeWptQ3VIdHhiRmE5VlhIcy9kQUtYbTJxODNRdlI5NW9rclZU?=
 =?utf-8?B?dnpWZVNHbDdRZlZ6ZG9MOFVuTmcwL285NDU3akN0UzZLcUNReTQ5UlVXYzdW?=
 =?utf-8?B?TVUvZGtyclVRNC9PWklwdnRUeXZNWDNHb2RNWXFkM0tDYUZkanBhM3NwQVlC?=
 =?utf-8?B?YWJSQndRak52YVNrQzl5MVo3bXkyR0lYUDN0TjY3SU52aHdMRTVxeVZzRWJG?=
 =?utf-8?B?UmpJWGFsazFlWkpISTBqeGxMUXp5MTZhTDA1TUZiTHpySjlOY0hJYkZCa1Er?=
 =?utf-8?B?ZmtaS0doUktqWkNtUmRyN3FxNDZsTU8zV2VPNFVNR0xkWFd1S0ZuTXh6WUkw?=
 =?utf-8?B?eXlMTldQSjlTQUp2UzhUQlpkVnlETnpoS2gxWkZqRzZsdDdOd0VxcEI5QytD?=
 =?utf-8?B?VkszVGpkZzNIaW0yZnV0Q3JPTVl3OXlUR2ZnNk0yTDF5bzBuc2FpNEo5b3hw?=
 =?utf-8?B?R1ltbEhvZ1Z6Q1U4UTdKL2xZcERSZk5NTDJiOXNqcnp3L0FWYlUvMHVqUUlh?=
 =?utf-8?B?eU4rOENWdHlKL3NKL2Y1MnpOaUNkeWp3SWJ5cWZCVEFSd1JaL1FFNklhaDdo?=
 =?utf-8?B?WGxPTit0Q013QkU3S0F6NWZpbjFTajQ3TjlwcjZCTFVwMWlwdjdrSndkTWhu?=
 =?utf-8?B?N0Q5QVNJb0ZuR05rS0NKRG1EUVdCMXVuOWpoSGh3aTFYYyt6Zzh4NldETUpJ?=
 =?utf-8?B?TXZJOTJQWWZQOHRvSGRYM00xdnYvQkpraXJBa2V1YlBVV3cyUmpyTUpkQkVR?=
 =?utf-8?B?T0gxSjVpMGxiTUFybzg0S2dVWXJ4Z0tsTmkyaDhMMVlHMHVFZnU0Yzh1QS9h?=
 =?utf-8?B?V05mZ0tORERJUVEvMVB4ODVrMjUyUWdoYlBjc3g2T3hRb0E1cTlidExZYzJM?=
 =?utf-8?B?ZTNuRFlQMGI0enhkYUMxRTV3RHZzamx5ZSs4RmdGeDRzOThjOTcybWJTQ2I4?=
 =?utf-8?B?T0Q4SnRkdVlvUldtRGNEd09XeDBvdE9hamFia2xtTUtsRVNLT0RxajVFQ2Rt?=
 =?utf-8?B?QWl6UGRDby9aUE1CQStBQmZOdDFqa3FrSUlDVGRFT1g0cC9qNmdWb0E0cTVN?=
 =?utf-8?B?cmM5TGF5UE9zTmZzMXplSWtRSkVRZjczcTloTGhMZFhtcTBEUmhWeGU2RGta?=
 =?utf-8?B?ak5vWDArQjZCdDdIamVkK0ZjTFlWa1h1TGVXdVRhU0cyTXR2RktRZz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: dc315850-beb2-4a23-fa40-08de51da1dfd
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2026 12:57:18.1696
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yJY3VAz1wwHv0k0nfcWBsSQnLxrBTgsmc3oFM6bMT2JF89oBJ8J4NdnOfuh7zQY16xBx7Z7PLG41GEjOh9p1SQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB5635

On Sun Jan 11, 2026 at 12:24 PM GMT, Benno Lossin wrote:
> The `try_[pin_]init!` versions of the initializer macros are
> superfluous. Instead of forcing the user to always write an error in
> `try_[pin_]init!` and not allowing one in `[pin_]init!`, combine them
> into `[pin_]init!` that defaults the error to
> `core::convert::Infallible`, but also allows to specify a custom one.
>
> Projects using pin-init still can provide their own defaulting
> initializers using the `try_` prefix by using the `#[default_error]`
> attribute added in a future patch.
>
> [ Adjust the definition of the kernel's version of the `try_`
>   initializer macros - Benno]
>
> Signed-off-by: Benno Lossin <lossin@kernel.org>

Reviewed-by: Gary Guo <gary@garyguo.net>

> ---
> Changes in v2: none
> ---
>  rust/kernel/init.rs                     |   8 +-
>  rust/pin-init/README.md                 |   2 +-
>  rust/pin-init/examples/linked_list.rs   |  19 ++--
>  rust/pin-init/examples/pthread_mutex.rs |  10 +-
>  rust/pin-init/src/lib.rs                | 118 ++++--------------------
>  5 files changed, 35 insertions(+), 122 deletions(-)

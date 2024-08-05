Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2074.outbound.protection.outlook.com [40.107.20.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE9F213AD11
	for <rust-for-linux@vger.kernel.org>; Mon,  5 Aug 2024 10:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.74
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722854488; cv=fail; b=h5LgFflpU601RZjFu0hVJ90VpdAbRQjYvnyVyWfFl2XBftP6IkK6pI/AYxRnrjI4dMw6BsPH1H4lXcD34DvneKTVikFLq8dzvvEEz7aX5uFuxs5NlpeFOsrmFQZ/nTNI8opfo0aWlmQYyj+gvY/hu476bCtUJLth3lTZV66MJrw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722854488; c=relaxed/simple;
	bh=FvXydm2VAUMr1UTwFVrZOk8YBI2bjmfxw3U9t2eCeNY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=cNCf6vpNF+CDfhFbL8EuGEOLIPlL6Zs3mum0dJVR2sHid6brLDIb/bEhFSKMK50roXayAfxDn4LoAw+hg8u04zmGqh6wQ054Hb+AJnYUvUg9GoXMKuE+Z4XNH/G0zHdsx5Z/4cd6NrhxfDH1yrsy5QI5VhRiTuET/govu36Vx6U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=de.bosch.com; spf=pass smtp.mailfrom=de.bosch.com; dkim=pass (2048-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b=QFRepCYH; arc=fail smtp.client-ip=40.107.20.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=de.bosch.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=de.bosch.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b="QFRepCYH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ANqUoY/GzvyJmIwQ0TuBAOQ/7ocVueoPwxgBHthgOoJymCfSc4g2dg6/ANuncHgUOI0HybBcBpFFHOw3T4QpLVVinRFxx5X13jEA0KKFg9CWE/FCv15HMcLTWGqR+RI6OpLTpTeyrl+caY5QyoJ818LNWh4LAKZI1lgxbMkHzHSAJ0dKL+NjTmT7KAvBKIQQ2nvhCC8+flzSBrlgBPbJpZbk/7aPfukHfuiqeHRoFyIAHjPvjNW+isLPzwGbTGAq3FHVZ8FyOTtA2yRhRvfI7v7bS4XFVnXwndkMxSljJdV+zqVN0ddQ9QGh17UKPm7zF+oH+uI+wRXXcIwEp/DJmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DJBvzy4JSr4OFowMyMCw6qlbQfK/aLNuyYF1yKpuFzU=;
 b=holRZuuhUq6pm5DzpDjUTHVWcF8M9nfAWKCtPC0A2h/x0lAA7cJukpSlc7VCWczkEWG8nMyrjKEgJcBgSHchAXKBkgci7VuTpoQb2+ilFbr5IpknC1mlIpXI3iJvJOBDB3LwW7pprqFXkmtYwsVRgk3q9g+ww0O7+0ZgKVf9LXA2fDEH3lt3m5SAZxcGGpOfNvDkldkDQyPP816qbF92w5i3HCpivr8pe/wUciwmRtugGNM+i1QdWJUku0UkZxbcgWrT7yzpWuXPt3FX0zICDj/XfpnJCbbhS8TQQ5DNHByNqxiBqlPpc54uJZgtZg1/wxGyWt/OGjxTXiq8h90oyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 139.15.153.205) smtp.rcpttodomain=gmail.com smtp.mailfrom=de.bosch.com;
 dmarc=pass (p=reject sp=none pct=100) action=none header.from=de.bosch.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=de.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DJBvzy4JSr4OFowMyMCw6qlbQfK/aLNuyYF1yKpuFzU=;
 b=QFRepCYHL9nSIHltTNjP8iyhnA9emOk273/ghFi/uwIoyn5Vdh37M1jhn5jUoYEgjikrOiqOn+SIsqny6EJWCndheDFATqXTdEO4Tu1IfXnI5lCnzTH7FBrBz+1/UVlhp4XR9kwHHmFM7gC2EQ0VLhhgRODxkUopDgNN9N21n4QpTZyA6DjUGN6Z0cIXQOaKcuaaQh6OxRw2r8Ndr929gn1qvp9hPsDEZTWTnZAvHelRjuv0YSp6pWn72NpfoOKSPCaEXr1GWcOmj/Rgxy6j8MLsfJUuPyiiLofPIRs5S/AMsuWEvyCNnkgF8+CaxmXYhtEAvlis2znUlHYDkVu4hQ==
Received: from AS8PR04CA0149.eurprd04.prod.outlook.com (2603:10a6:20b:127::34)
 by VI0PR10MB8646.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:234::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.26; Mon, 5 Aug
 2024 10:41:20 +0000
Received: from AMS1EPF00000043.eurprd04.prod.outlook.com
 (2603:10a6:20b:127:cafe::7c) by AS8PR04CA0149.outlook.office365.com
 (2603:10a6:20b:127::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.26 via Frontend
 Transport; Mon, 5 Aug 2024 10:41:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 139.15.153.205)
 smtp.mailfrom=de.bosch.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=de.bosch.com;
Received-SPF: Pass (protection.outlook.com: domain of de.bosch.com designates
 139.15.153.205 as permitted sender) receiver=protection.outlook.com;
 client-ip=139.15.153.205; helo=eop.bosch-org.com; pr=C
Received: from eop.bosch-org.com (139.15.153.205) by
 AMS1EPF00000043.mail.protection.outlook.com (10.167.16.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7849.8 via Frontend Transport; Mon, 5 Aug 2024 10:41:20 +0000
Received: from FE-EXCAS2001.de.bosch.com (10.139.217.200) by eop.bosch-org.com
 (139.15.153.205) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 5 Aug
 2024 12:41:16 +0200
Received: from [10.34.219.93] (10.139.217.196) by FE-EXCAS2001.de.bosch.com
 (10.139.217.200) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Mon, 5 Aug
 2024 12:41:06 +0200
Message-ID: <1faa08dd-1fb0-45c1-b542-775e131bcb5a@de.bosch.com>
Date: Mon, 5 Aug 2024 12:40:59 +0200
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] rust: Support latest version of `rust-analyzer`
To: Sarthak Singh <sarthak.singh99@gmail.com>, Miguel Ojeda <ojeda@kernel.org>
CC: <a.hindborg@samsung.com>, <alex.gaynor@gmail.com>, <aliceryhl@google.com>,
	<benno.lossin@proton.me>, <bjorn3_gh@protonmail.com>, <boqun.feng@gmail.com>,
	<gary@garyguo.net>, <ojeda@kernel.org>, <rust-for-linux@vger.kernel.org>,
	<wedsonaf@gmail.com>
References: <20240724172713.899399-1-sarthak.singh99@gmail.com>
 <20240731080021.195732-1-sarthak.singh99@gmail.com>
Content-Language: en-US
From: Dirk Behme <dirk.behme@de.bosch.com>
In-Reply-To: <20240731080021.195732-1-sarthak.singh99@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF00000043:EE_|VI0PR10MB8646:EE_
X-MS-Office365-Filtering-Correlation-Id: a3c855aa-95a2-4131-f91b-08dcb53b2500
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|7416014|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZS9mbjhWYXlNUTRFUkt5U2NITFV1RnZJWDFiN3o3S2RieWF1anpFbk11d0U0?=
 =?utf-8?B?dlJjM3FlMmdYZTc1L1RDZVpYZVVFUzgrbUJLVy95UjVFOUhNK2k2V0ZqR3lH?=
 =?utf-8?B?YW16c1p1OUNibDFBNU9zc1NVNTdaaEdIM2FDWmc3cnJVRGo3WWNVbER6VnBj?=
 =?utf-8?B?Sm5YZ0tYdUVGSTZJOU42L211S1ZScXJiVXZZYnVIdW05VjNDWkx4VzVzczJp?=
 =?utf-8?B?WDR1ZHUvZVh0ME1GaVZSRWdFcjRLOS9XQ0VHbjN3T2gwVHlwYUxzaUd3U3Fu?=
 =?utf-8?B?d2pjS0t4MjFLemtJZTA0bGFwTC9uTVVTVUwrUFprbXBYYVdaYWRqRFZTSkFW?=
 =?utf-8?B?YkZSMHNMdWhDRVhNbkFBelEyOFhCeTJWbVN2Y1RLeDExUUZJYTFhRFE4cUNB?=
 =?utf-8?B?UytXck9kR3VRN1Bka2toY3V2SnpKWnl4NHRpeURzRnpiQ3dDWTduSXpYM3VR?=
 =?utf-8?B?dUd1TjMxWC9PbTU1SnRucTluaUhHY1FoZXAwOEVESUVpZW5ZY2RNQm1lZ05M?=
 =?utf-8?B?ek42elpWUjR1VGRFdUJFcXlpVzdMRkVTelB4N2lsZW9OQ0tqNVJzQmljMFdL?=
 =?utf-8?B?QlU5MXJ0NnhHODg2cnNxa3dsOTAwa1gxOTRNczNid0FrQzNPSmVDQVBrZTlI?=
 =?utf-8?B?Vzc1WENuaksrZUoxN25uS1daNXN0TkZSMWtlcWtpL05GNTlZQjZTRlBxbity?=
 =?utf-8?B?TEZ6REw4bDFvc2xpWmhaY2tpbWdGc2xNbHlqTFNyK1UyRlAwTDkyVm9PYnc5?=
 =?utf-8?B?MEkya01VWnFUdWJyaFd5NDVsY2dGZlVlNmlVODdFMkJpaWUwMm9ZTHdFaVZK?=
 =?utf-8?B?aCtETzV6YlJpU1VlUzhjVDZTTndWRlI3dXU1endtVEVNY0hBNFJiemtUeHhT?=
 =?utf-8?B?TXBxdFl4ZXFjWFVnNi9hNEpoVTFUVGxiN3RmWnhJcEE0bFl5elJOTC9xTUQr?=
 =?utf-8?B?L1BJRHhYcWttS2Iza2JENkRDQXdQemMrSFgxZ0NXM2ZyUkJ6TW1Ib20zblVw?=
 =?utf-8?B?YkRZUVV1R0RkcENRcHBNb01JSk85Z1Q2TCt4Y3lMbDNHNEg5b1B0V0tEUkwr?=
 =?utf-8?B?VzZYUElTR1o2TW82MjRpTUdET1E2SUsvb3RJMnhUUVhwYWdPTXRnSXpoams2?=
 =?utf-8?B?QmFqVG1HVjJ1d1pCTDZMVjJKY3hUM0szNFovMzhERTdseHcrN2ZiTUNCK2ND?=
 =?utf-8?B?RmUzRWlkcEhPalF2aDdDZUxHQU5xNWlNaUtES1RQSFQrUFdGS21hYm9JcTdm?=
 =?utf-8?B?VCtoL0t1SHV6QnJxWHczMDZrRFlmVFBwa29UaHBBa0RsRWNDSmNMUURnYUww?=
 =?utf-8?B?T1UxWWxOS2M3OW83M0ZtUFZNR2tYeTRIUmNVM2F5bm5MS01QQ21KSmZwZGI5?=
 =?utf-8?B?eHVwek40K01jNEVzOVU5WWc2cHozR0FzL3l3Y2ltMCtRWWthdE1tM3daWmM1?=
 =?utf-8?B?Wm5xdlRhMHc0K2UvU3pJK285V1loU3RDSGNYa0JvcnkxcjUyaDBub0p3ZWFr?=
 =?utf-8?B?VVFiSUd3Zi9HZVpaMUJBOGEraisrUUFhYjErN1FuWno4TzYwcmZSRkd4S0g3?=
 =?utf-8?B?czVVMnZibEsvMStMZ3M4cXpsNGc5eWQ0d1N0UXZlcDF4TjB3eWZSTUI5MlV0?=
 =?utf-8?B?M3lvb3VCVDFteW54YjZIMXpDUEZIZ0tNTG9hVXF6Y3l1SDVubjVDSzlTL2pj?=
 =?utf-8?B?ajVYbzQwdjU5MEdEOHA5M0J6K0F1NUtkaG5iVGVkMURhWlJXZHZDMHU0dHh0?=
 =?utf-8?B?Ni9venA1bEU1cVBzcHA3cFhEbDQxOHRLSVpVSzl3QUhEckpjcVRsa29ENk4y?=
 =?utf-8?B?R05LUm93QVpacDZ1WktjcGpkSm8zemw1UVVkbTdvQ0k2R2NYQVdMM3VpTG9D?=
 =?utf-8?B?VVB4U2h6ZC8zb2lLTnVNbFFBNy9hdGZxaEk1MlY4bCtFR2EwWm15UXc0T0lJ?=
 =?utf-8?Q?Vto2Y0YOxoUSdLXgomIlf/2BDrEqhdRE?=
X-Forefront-Antispam-Report:
	CIP:139.15.153.205;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:eop.bosch-org.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(7416014)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: de.bosch.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2024 10:41:20.7661
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a3c855aa-95a2-4131-f91b-08dcb53b2500
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4;Ip=[139.15.153.205];Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS1EPF00000043.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR10MB8646


On 31.07.2024 10:00, Sarthak Singh wrote:
> A polite reminder to please take a look at this patch.

Would it make sense to apply this to rust-fixes and/or send it to Linus 
as fix for inclusion into 6.11-rcX?

Best regards

Dirk



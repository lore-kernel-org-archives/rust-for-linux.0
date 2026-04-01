Received: from MA0PR01CU009.outbound.protection.outlook.com (mail-southindiaazon11020134.outbound.protection.outlook.com [52.101.227.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA48D3CB2CF
	for <rust-for-linux@vger.kernel.org>; Wed,  1 Apr 2026 09:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.227.134
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775036221; cv=fail; b=sKBA32wYMTC1w0SdsR7kslisxXp4H93U6MNuOxhvcrk+J28roybjzf/gQiywXgc9lQ6tQplU5RcgFCXHXX8YUUIXkvp6BfEddsKjf0lR3UpGv0FeLZ4OUE1JQJ3hJ/NA7GmY/B9CxoVYK090Rh/oOe3Ri6MHfx5MSlcwRyrHVVI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775036221; c=relaxed/simple;
	bh=L6Bb8gyvlwaM8yHBfEVSKvk16onilqNukaSxFHzNJL8=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=pz3/+T/siSFKpxbq8hGVESS1MGw6ZgNShcxetbuHrdhGWS5SXg4rKJXKLpxvItTV7gItTyv+RR5uagRpXG7Gh3bXi0tJPLFkZiNRM2CKkw4hC6Xk4AnyD/fOMziSllvVzhRm+a3kK3WnBCtmCyOHM8afFW6+fZxwKChH2Esg/5Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=multicorewareinc.com; spf=pass smtp.mailfrom=multicorewareinc.com; dkim=pass (2048-bit key) header.d=multicorewareinc.com header.i=@multicorewareinc.com header.b=EEYrSECY; arc=fail smtp.client-ip=52.101.227.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=multicorewareinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=multicorewareinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=multicorewareinc.com header.i=@multicorewareinc.com header.b="EEYrSECY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tZN7DazLuKX+fgaGJWikHC+9klZNLCqat5BoMc4AKG6JUPHzztD7NpT1+ahdKb/f1GiMwwJvoT1JTKxr0g61Nyjlf2e92DxBvZLa3+LbHzs/4Ha/oRpkE+i/ddaFO0maL/jGapTJzus53rBV+r1xy61pR9TPe3mTC3Z5K5Jcz+GjOTFQR1EvBRXbEx/bH4H4cN1ctwU4MnKAJN3MR2Q+QBaBRWixDGRDniAMd/mjBjLM5rXCO3qVtV5w9iurTDJY2KQt8MJZRIgY7JyPyri9OG8rzbF5pGSsQQGujP9ECY2oQaSSEtCfeB7MOB2Q/Kx5JvL2oOhtRcKnJTS+TyrxQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UxwavpJD/6cyOShJmapZJQxxpV33nURgv9LGUAvG60Q=;
 b=hYet1TMQmQ1ENJ60rZLw5kLHXTl/KE4429cLw9uZPbRPrx00Wo5sPMOXcJeictSkWrfpeQGfrmVNfZTON/LWDP8gfJeKp0z1lumQxp1E4/jpAxvbwwOCcYHbBH8IpFu3b4WbOABia+qAl2elu8oNa9QFDSEFHcWQsjxHSUxeATguUjqlJplIFrn00T94hztMNF1yYD14YzEHl/sCr6YENrLIl0xbJXabrBPFvUNZQFUHyfBfb4U3M+jtzIkxHOSWb9FAZyJVJWFq0pFzAlSEb/fC5t28JITZea8EWI51W8Ynrff0IP2SymAHG8nQIB2/HwkF0cMilFH3BWsObh4G4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=multicorewareinc.com; dmarc=pass action=none
 header.from=multicorewareinc.com; dkim=pass header.d=multicorewareinc.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=multicorewareinc.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UxwavpJD/6cyOShJmapZJQxxpV33nURgv9LGUAvG60Q=;
 b=EEYrSECYXalLI/1x/MbJvFc/rR9jP++5db4ALDujSpzTHOLaoL3XUCEvQl66080btslXCGzvCgsAYqGOa007fDjRM6Fk7qcA36VYYOkc5P/4Ln+BVEwHHJyjXHPDp3jVa1Agu1nrsuCw4/+c22wQWru9sf+ME2WTGIkPikVtB38gtARZaqJ/Yp0ZQn4qShfIBI4Vof5UDGtp24FscX9A20utZO7YcSYMTSFnFigHEN8CX6koRRVNw3M/Ck2BIjblhx56rSTMPOIMr07dNG9Vo2gOuP/btzMeuwYfmRYvQXilnUOTn28ImfrpacjIWTIvWkD0kx2wdr00bFYs2FtAsQ==
Received: from PN2P287MB2978.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:234::11)
 by PN0P287MB0425.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:11b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.16; Wed, 1 Apr
 2026 09:36:55 +0000
Received: from PN2P287MB2978.INDP287.PROD.OUTLOOK.COM
 ([fe80::bd3:efc7:ac71:7ebb]) by PN2P287MB2978.INDP287.PROD.OUTLOOK.COM
 ([fe80::bd3:efc7:ac71:7ebb%5]) with mapi id 15.20.9745.027; Wed, 1 Apr 2026
 09:36:55 +0000
From: Aakash Bollineni <aakash.bollineni@multicorewareinc.com>
To: "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
CC: "ojeda@kernel.org" <ojeda@kernel.org>, "tj@kernel.org" <tj@kernel.org>
Subject: [PATCH] rust: workqueue: add safe cancellation and status checks
Thread-Topic: [PATCH] rust: workqueue: add safe cancellation and status checks
Thread-Index: AQHcwbkhSwaPRxThEUuJzkgk2XsfYg==
Date: Wed, 1 Apr 2026 09:36:55 +0000
Message-ID:
 <PN2P287MB2978F92A42E4EA8B8A0C37DDF550A@PN2P287MB2978.INDP287.PROD.OUTLOOK.COM>
Accept-Language: en-IN, en-US
Content-Language: en-IN
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=multicorewareinc.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN2P287MB2978:EE_|PN0P287MB0425:EE_
x-ms-office365-filtering-correlation-id: 7c6f385c-df7c-48de-6be9-08de8fd23666
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|31052699007|39142699007|69100299015|6049299003|3109299003|7049299003|376014|55112099003|38070700021|4053099003|8096899003|18002099003|56012099003;
x-microsoft-antispam-message-info:
 /xVv8p18eLGiZm/DURXSRQwC+3jSr7ML5bZbxsU6pIrv4wD06zdtvkM9icVg16qjb3wchncfU+Zj0wgvdaqGXa2ZToGYnrvOUFGZOkbee9DWsn8Tjy96UXAhlNLaG7h+8DdW1rG2ElDOxFiTp2lP2CCl27gSDX5mepXio92z+72aWMbksrluX1UzPHdSET2DYSCxI/fzCTtyafUvSnR2KPO6O+FfbW2LNven06hpqVqQnKejWPVvFSBmv7/BOPtsskFU9woYfkKTEM5ZZ0n/IpQ6PIHxnfICOaS5JVh+dX8tkHAom5klPnhAzmKPeoTQwrULJOlqD+JTEw+7bkcqPktPIIszT+ndJn3urL2sTBiQYFS+QX/xTPm70YRpOHnerdxQfeMP/7bAue/p4UMPyHLlGK8tZsgLXoS6zDWTEm+TyxQmGYUKBlzH6VFEric3DesRAgF2G+vzO/2+0PT65affbA7T4V6QyotFTO4IAqb82nTXkFS1tOO+NDxQPj4sdV9jJZNkxAe0T5Ya6c+XZd4uer9TKvjj5/Ob3cOc0XwB+11fB9QHheTtUe2HzWPoQ9oZGxmaTOlZubR6Jr0v2FoC9pw5Z6cZCFVNA11+VnDxtPIYR71Hpfydt30nehlJvPAMmHO4xI3eBy8nMRCv+L8B2Fp86L9ERymQiktr9/7TweR4lBHIuDwxEC5Bwoiuws6/BOAZN7gqWmiOAhPfELQggixYxI5+eYOy/FpMc3I/4a5YIZS+DJrIa7sceRpL
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN2P287MB2978.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(31052699007)(39142699007)(69100299015)(6049299003)(3109299003)(7049299003)(376014)(55112099003)(38070700021)(4053099003)(8096899003)(18002099003)(56012099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?9N1NFlCHloxmt1JrSClaGc0rZH6KrO1GWSM1D9naBF8YTjXvnPV1mtlyhF?=
 =?iso-8859-1?Q?KQ6Jeed+V6VnUx+VkYZn7inGGuxa0H9snU6SNgmNBEGZ8eKxDBrxVkoxWQ?=
 =?iso-8859-1?Q?bz6aKJ+TQZuv5yMrMRzfCwaJzZoEzLJcMkj9EdUdvs1JqU86nl5CSTAU6f?=
 =?iso-8859-1?Q?TO6HvAn5azRrpbkuB/XipMzksoqMcYh7e54CSvPik9jwvefYWDF/3FJn38?=
 =?iso-8859-1?Q?u0ktcL+XEyR0rOQXFuwXkrmw8cIKz8U1tLWsi/niMi7wyxjcZWbzgx0Wak?=
 =?iso-8859-1?Q?kGfxkafb6zXpDd4P4E9spMNdFDtIXankKO7WQrtTPz3+5g6hoPRuRGeHp3?=
 =?iso-8859-1?Q?JQ2ZkqfT8BPwphRvwcy7i6cAYGkv2iRiovFa3xCE/YR1VAyaJO5G6+hXeV?=
 =?iso-8859-1?Q?D40Ijn9R1RWpt4WUKyLuSwJiECDwtTza7X6+w+zcz3f5FFYDLjebo/vmvH?=
 =?iso-8859-1?Q?m4eVBoogk+iIFQ2U5N3roE5LQ+psKXCp4/Cg0cea9aXMzRDfd29VzJ15IF?=
 =?iso-8859-1?Q?gPbgUgeJY0n1jBmqXrn8Grj96mfP3xNksK4HK3PneQDyR7bFEpzshiToTU?=
 =?iso-8859-1?Q?dd6WzOQXxX5q0HwaGtGOvDtXAMv3TyYGobfjviEs8h4v9Ie13Zyd0Rk2WH?=
 =?iso-8859-1?Q?NUPb+oZvIrPGU3/2yQ2anEDlednV4rLLetQYSLpDj//BRVR+/m1jIyUBnO?=
 =?iso-8859-1?Q?DNmlq+FwTrQtF5FzBpN+kURJt2N7iqJf0RP1vhRAETp2Sxh4IWWH0fmk9o?=
 =?iso-8859-1?Q?ddBTjH5djwQoLNditIZgd7b7NIqXGk6yFoA8Fh7RGwPRs5HX6ttQlX4xNT?=
 =?iso-8859-1?Q?LzsXh1Y4iTPoqg6WGck3g5KDNKuMML0NY1C5HhseOgmx8qnSK9ZkW0VL52?=
 =?iso-8859-1?Q?ctvscV0M52i1spRNHCzQuth67qEP3y/7aPCU/mTJBWoC1rMPq9P1W4db+G?=
 =?iso-8859-1?Q?1pW7Xbbcv8H/PSoEm9OFf1nCTqvHZ46EzYVMlC8FcdUdp1dP7kKsQUoQxi?=
 =?iso-8859-1?Q?YufOqmUO7SLq4Sl1HcZt+fr2+YRAhIxwfN6zpv6BboT0lGdlKXRXiyU54P?=
 =?iso-8859-1?Q?QjMXnT4H7lTLkrlC41d79baAv9E6ECAn8dGQYn0XlVvfxGM/61GmOz1N5S?=
 =?iso-8859-1?Q?n3ihYYFuBleNbsz+RmOokhAEQW4yYkWV0o9L8IhOmrlJnzggtMD+SHGuec?=
 =?iso-8859-1?Q?4Kckj3EGs+qY+T2J4/AI8EHAwzbqk5db5vI+/8GMVLKqgw/GOrhi2IeSCq?=
 =?iso-8859-1?Q?H5bgfLydl9lU2g29YzB2Tca//HvpT04SMHIgacRWA10mZv0dneDO1t45sP?=
 =?iso-8859-1?Q?q4W292e7rPsDygHUKJpgATcZ/C8UkrYVFC/P8xHrqHFyhB4vpkXpmHBY7C?=
 =?iso-8859-1?Q?EcdoaulLaKAvuQ5mY6ge8E21vK5znRnh/qU8vp1oefB4X7DBt++g5w5cCV?=
 =?iso-8859-1?Q?2/e63NH6TV1HuN8Ho/jBFs8pV2EcXPR1W24m/15P6kfEHtQ6YDb8eFZnB8?=
 =?iso-8859-1?Q?G4gR6dMcOTjceCcCFC855raMySkKZygeZ+GQfTUAJ6gB47f7DlTQCQ/qlZ?=
 =?iso-8859-1?Q?t7kBbqbXWn5aM6F1WS17mfimJYDPFYAABGAkK8GWBQy42gL2Au0xYy3YYX?=
 =?iso-8859-1?Q?SAfEyDMA8OXr3547t2xQ2ia7Hx9pKaPlpYGjBofEG3vJfGSZZAgyNpCVBZ?=
 =?iso-8859-1?Q?tvcdA7pTzkTHX100dfzIH8oZYsGa7CFohQskYME7EdxIVj6gexyMfDw0Pe?=
 =?iso-8859-1?Q?ktLTvectIsIPAcXvdqNVOHBs8goCOrM1LQdV482aAqxuiDeipOX1XnBE/n?=
 =?iso-8859-1?Q?3XoBpfCTAnX2dE0oqMV8igmJ65d/pMs=3D?=
Content-Type: multipart/mixed;
	boundary="_004_PN2P287MB2978F92A42E4EA8B8A0C37DDF550APN2P287MB2978INDP_"
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: multicorewareinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PN2P287MB2978.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c6f385c-df7c-48de-6be9-08de8fd23666
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Apr 2026 09:36:55.1569
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: ffc5e88b-3fa2-4d69-a468-344b6b766e7d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: N/OOjg+yx/Im1TJlSUojrhEj57TuZFucWoIapTwC8zEsV9ky5d+Ua/ge5hRLKRmcQo9Yj4CCvwd+BdRmTSXJ2dFXbYFbNnY2o8UCJBWP9vCtYsxh6O1YJuMUznfVNAAu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0P287MB0425

--_004_PN2P287MB2978F92A42E4EA8B8A0C37DDF550APN2P287MB2978INDP_
Content-Type: multipart/alternative;
	boundary="_000_PN2P287MB2978F92A42E4EA8B8A0C37DDF550APN2P287MB2978INDP_"

--_000_PN2P287MB2978F92A42E4EA8B8A0C37DDF550APN2P287MB2978INDP_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hello Miguel and Tejun,

I'm submitting a patch to modernize the Rust workqueue API by adding is_pen=
ding(), cancel(), and cancel_sync() methods. This enables safe driver teard=
own and ownership reclamation of a leaked pointer types.

This implementation has been verified with a Kunit test suite and a 1000 it=
eration concurrency stress test.

Please  find the patch attached as a plain-text-file.

Best regards,

[https://multicorewareinc.com/signature/0627/images/logo.png]<https://multi=
corewareinc.com/>

 [https://multicorewareinc.com/signature/0627/images/ln.png] <https://www.l=
inkedin.com/company/multicoreware-inc/>  [https://multicorewareinc.com/sign=
ature/0627/images/tw.png] <https://twitter.com/MulticoreWare>  [https://mul=
ticorewareinc.com/signature/0627/images/fb.png] <https://www.facebook.com/m=
ulticoreware>  [https://multicorewareinc.com/signature/0627/images/yt.png] =
<https://www.youtube.com/@multicorewareinc>  [https://multicorewareinc.com/=
signature/0627/images/in.png] <https://www.instagram.com/multicoreware.inc/=
>

Aakash Bollineni

Software Engineer.

Block 9A, 6th Floor, DLF Cyber City,

Chennai - 600 089, India

[https://multicorewareinc.com/signature/0627/images/future1.png]




--_000_PN2P287MB2978F92A42E4EA8B8A0C37DDF550APN2P287MB2978INDP_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Hello Miguel and Tejun,</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
I'm submitting a patch to modernize the Rust workqueue API by adding is_pen=
ding(), cancel(), and cancel_sync() methods. This enables safe driver teard=
own and ownership reclamation of a leaked pointer types.</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
This implementation has been verified with a Kunit test suite and a 1000 it=
eration concurrency stress test.</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Please&nbsp; find the patch attached as a plain-text-file.</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Best regards,</div>
<div class=3D"elementToProof" id=3D"Signature">
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<table style=3D"direction: ltr; text-align: left; background-color: rgb(255=
, 255, 255); color: black; box-sizing: border-box; border-collapse: collaps=
e; border-spacing: 0px;" cellpadding=3D"0" cellspacing=3D"0" id=3D"x_x_x_x_=
table_0">
<tbody>
<tr>
<td style=3D"direction: ltr; padding-right: 10px; vertical-align: middle;" =
align=3D"center">
<div style=3D"direction: ltr; font-family: &quot;Times New Roman&quot;; fon=
t-size: 12pt; color: black;" class=3D"elementToProof">
<a style=3D"margin: 0px;" title=3D"https://multicorewareinc.com/" class=3D"=
x_x_OWAAutoLink" id=3D"OWAc862e067-fea2-2060-c1dd-ba61beef77f8" href=3D"htt=
ps://multicorewareinc.com/"><img style=3D"margin: 0px;" src=3D"https://mult=
icorewareinc.com/signature/0627/images/logo.png"></a><br>
<br>
&nbsp;<a style=3D"margin: 0px;" title=3D"https://www.linkedin.com/company/m=
ulticoreware-inc/" class=3D"x_x_OWAAutoLink" id=3D"OWA939b424d-58ae-95d9-e0=
ba-c593f358e17e" href=3D"https://www.linkedin.com/company/multicoreware-inc=
/"><img style=3D"margin: 0px;" src=3D"https://multicorewareinc.com/signatur=
e/0627/images/ln.png"></a>&nbsp;<a style=3D"margin: 0px;" title=3D"https://=
twitter.com/MulticoreWare" class=3D"x_x_OWAAutoLink" id=3D"OWA2698939a-e6cb=
-71c0-e85b-1e7b6bb58035" href=3D"https://twitter.com/MulticoreWare"><img st=
yle=3D"margin: 0px;" src=3D"https://multicorewareinc.com/signature/0627/ima=
ges/tw.png"></a>&nbsp;<a style=3D"margin: 0px;" title=3D"https://www.facebo=
ok.com/multicoreware" class=3D"x_x_OWAAutoLink" id=3D"OWA82e5a3a0-57a3-e630=
-c0a5-2945c6c3e938" href=3D"https://www.facebook.com/multicoreware"><img st=
yle=3D"margin: 0px;" src=3D"https://multicorewareinc.com/signature/0627/ima=
ges/fb.png"></a>&nbsp;<a style=3D"margin: 0px;" title=3D"https://www.youtub=
e.com/@multicorewareinc" class=3D"x_x_OWAAutoLink" id=3D"OWA83149589-6c05-e=
fbb-a032-d57a4f99defb" href=3D"https://www.youtube.com/@multicorewareinc"><=
img style=3D"margin: 0px;" src=3D"https://multicorewareinc.com/signature/06=
27/images/yt.png"></a>&nbsp;<a style=3D"margin: 0px;" title=3D"https://www.=
instagram.com/multicoreware.inc/" class=3D"x_x_OWAAutoLink" id=3D"OWA9936c1=
2e-2bb4-f376-375d-5cca8749d16d" href=3D"https://www.instagram.com/multicore=
ware.inc/"><img style=3D"margin: 0px;" src=3D"https://multicorewareinc.com/=
signature/0627/images/in.png"></a><br>
</div>
</td>
<td style=3D"direction: ltr; text-align: left; background-color: rgb(153, 1=
53, 153); width: 1px;">
</td>
<td style=3D"direction: ltr; text-align: left; padding-left: 10px; vertical=
-align: top;">
<p style=3D"direction: ltr; text-align: left; margin-top: 0px; margin-botto=
m: 0px;" class=3D"elementToProof">
<span style=3D"font-family: &quot;Aptos Narrow&quot;, Aptos_EmbeddedFont, A=
ptos_MSFontService, sans-serif; font-size: 18.67px; color: rgb(23, 78, 134)=
; background-color: white;"><b>Aakash Bollineni</b></span></p>
<p style=3D"direction: ltr; text-align: left; line-height: 20px; margin: 0p=
x 0px 5px;" class=3D"elementToProof">
<span style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService,=
 Calibri, Helvetica, sans-serif; font-size: 13.32px; color: rgb(102, 102, 1=
02); background-color: white;"><b>Software Engineer.</b></span></p>
<p style=3D"direction: ltr; text-align: left; text-indent: 0px; line-height=
: 16px; margin: 0px;" class=3D"elementToProof">
<span style=3D"font-family: &quot;Aptos Narrow&quot;, Aptos_EmbeddedFont, A=
ptos_MSFontService, sans-serif; font-size: 12px; color: rgb(102, 102, 102);=
 background-color: white; line-height: 16px;">Block 9A, 6th Floor, DLF Cybe=
r City,</span></p>
<p style=3D"direction: ltr; text-align: left; text-indent: 0px; line-height=
: 16px; margin: 0px;" class=3D"elementToProof">
<span style=3D"font-family: &quot;Aptos Narrow&quot;, Aptos_EmbeddedFont, A=
ptos_MSFontService, sans-serif; font-size: 12px; color: rgb(102, 102, 102);=
 background-color: white; line-height: 16px;">Chennai - 600 089, India</spa=
n></p>
<div style=3D"direction: ltr; text-align: left; margin: 0px; font-family: &=
quot;Times New Roman&quot;; font-size: 12pt; color: black;" class=3D"elemen=
tToProof">
<br>
</div>
<div style=3D"direction: ltr; text-align: left; margin: 0px; font-family: &=
quot;Times New Roman&quot;; font-size: 12pt; color: black;" class=3D"elemen=
tToProof">
<img style=3D"margin: 0px;" id=3D"x_x_x_x_image_0" src=3D"https://multicore=
wareinc.com/signature/0627/images/future1.png"></div>
</td>
</tr>
</tbody>
</table>
<div style=3D"margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MS=
FontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0,=
 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MS=
FontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0,=
 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
</div>
</body>
</html>

--_000_PN2P287MB2978F92A42E4EA8B8A0C37DDF550APN2P287MB2978INDP_--

--_004_PN2P287MB2978F92A42E4EA8B8A0C37DDF550APN2P287MB2978INDP_
Content-Type: application/octet-stream;
	name="0001_31_03-rust-workqueue-add-safe-cancellation-and-status-chec"
Content-Description:
 0001_31_03-rust-workqueue-add-safe-cancellation-and-status-chec
Content-Disposition: attachment;
	filename="0001_31_03-rust-workqueue-add-safe-cancellation-and-status-chec";
	size=27733; creation-date="Wed, 01 Apr 2026 09:35:54 GMT";
	modification-date="Wed, 01 Apr 2026 09:36:55 GMT"
Content-Transfer-Encoding: base64

RnJvbSA3NTNiN2RhYjRjMGY0ZDQ0Mjk5MWQ5OTdkZTE0NTUwNjBlNzZkNmU4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBBYWthc2ggQm9sbGluZW5pIDxhYWthc2guYm9sbGluZW5pQG11
bHRpY29yZXdhcmVpbmMuY29tPgpEYXRlOiBGcmksIDI3IE1hciAyMDI2IDEwOjU3OjE2ICswNTMw
ClN1YmplY3Q6IFtQQVRDSF0gcnVzdDogd29ya3F1ZXVlOiBhZGQgc2FmZSBjYW5jZWxsYXRpb24g
YW5kIHN0YXR1cyBjaGVja3MKCk1vZGVybml6ZSB0aGUgUnVzdCB3b3JrcXVldWUgQVBJIGJ5IGFk
ZGluZyBpc19wZW5kaW5nKCksIGNhbmNlbCgpLAphbmQgY2FuY2VsX3N5bmMoKSBtZXRob2RzLiBU
aGlzIGVuYWJsZXMgc2FmZSBkcml2ZXIgdGVhcmRvd24gYnkKYWxsb3dpbmcgY2FsbGVycyB0byBz
eW5jaHJvbm91c2x5IHdhaXQgZm9yIHdvcmsgY29tcGxldGlvbiBhbmQKc2FmZWx5IHJlY2xhaW0g
b3duZXJzaGlwIG9mIGxlYWtlZCBwb2ludGVyIHR5cGVzIChBcmMvS0JveCkuCgpQcm9ibGVtOgpD
dXJyZW50bHksIHRoZSBSdXN0IHdvcmtxdWV1ZSBhYnN0cmFjdGlvbiBhbGxvd3MgZW5xdWV1ZWQt
b25seQpvcGVyYXRpb25zLCBtYWtpbmcgaXQgZGlmZmljdWx0IHRvIGltcGxlbWVudCBzYWZlIHRl
YXJkb3duIHBhdGhzCihlLmcuLCBpbiBEcm9wIG9yIGRldmljZSByZW1vdmFsKS4gU3BlY2lmaWNh
bGx5LCB3aGVuIEFyYzxUPiBpcwp1c2VkLCB0aGUgd29ya3F1ZXVlIGhvbGRzIGEgcmVmZXJlbmNl
IHRoYXQgY2FuIG9ubHkgYmUgcmVsZWFzZWQKd2hlbiB0aGUgd29yayBydW5zLCB3aGljaCBwcmV2
ZW50cyBzYWZlIHJlc291cmNlIGNsZWFudXAuCgpTb2x1dGlvbjoKLSBjYW5jZWxfc3luYygpOiBX
cmFwcyBjYW5jZWxfd29ya19zeW5jKCkgYW5kIGd1YXJhbnRlZXMgdGhlIHdvcmsKICBpcyBuZWl0
aGVyIHBlbmRpbmcgbm9yIHJ1bm5pbmcgYWZ0ZXIgcmV0dXJuaW5nLgotIGNhbmNlbCgpOiBXcmFw
cyBjYW5jZWxfd29yaygpIGFuZCByZXR1cm5zIG93bmVyc2hpcCBvZiB0aGUKICBvcmlnaW5hbCBw
b2ludGVyIChBcmMvS0JveCkgaWYgY2FuY2VsbGF0aW9uIHdhcyBzdWNjZXNzZnVsLgotIGlzX3Bl
bmRpbmcoKTogV3JhcHMgd29ya19wZW5kaW5nKCkgZm9yIG5vbi1jcml0aWNhbCBzdGF0dXMKICBy
ZXBvcnRpbmcuCgpUZXN0aW5nOgpWZXJpZmllZCB2aWEgS1VuaXQgYW5kIGEgc3RyZXNzLXRlc3Qg
aW50ZWdyYXRpb24gbW9kdWxlCihzYW1wbGVzL3J1c3QvcnVzdF93b3JrcXVldWVfdGVzdC5ycykg
d2hpY2ggcGVyZm9ybXM6Ci0gMTAwMC1pdGVyYXRpb24gZW5xdWV1ZS9jYW5jZWwgc3RyZXNzIGxv
b3AuCi0gUmVmZXJlbmNlIGNvdW50IHZhbGlkYXRpb24gdG8gZW5zdXJlIHplcm8gbWVtb3J5IGxl
YWtzLgotIERlbGF5ZWQgd29yayBjYW5jZWxsYXRpb24gd2l0aCB0aW1lci1iYXNlZCByZWNsYW1h
dGlvbi4KClNpZ25lZC1vZmYtYnk6IEFha2FzaCBCb2xsaW5lbmkgPGFha2FzaC5ib2xsaW5lbmlA
bXVsdGljb3Jld2FyZWluYy5jb20+Ci0tLQogLmt1bml0Y29uZmlnICAgICAgICAgICAgICAgICAg
ICAgICAgfCAgIDQgKwogcnVzdC9oZWxwZXJzL3dvcmtxdWV1ZS5jICAgICAgICAgICAgfCAgMTUg
KysKIHJ1c3Qva2VybmVsL3dvcmtxdWV1ZS5ycyAgICAgICAgICAgIHwgMzg2ICsrKysrKysrKysr
KysrKysrKysrKysrKysrKy0KIHNhbXBsZXMvcnVzdC9NYWtlZmlsZSAgICAgICAgICAgICAgIHwg
ICAyICsKIHNhbXBsZXMvcnVzdC9ydXN0X3dvcmtxdWV1ZV90ZXN0LnJzIHwgMjAzICsrKysrKysr
KysrKysrKwogNSBmaWxlcyBjaGFuZ2VkLCA2MDYgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMo
LSkKIGNyZWF0ZSBtb2RlIDEwMDY0NCAua3VuaXRjb25maWcKIGNyZWF0ZSBtb2RlIDEwMDY0NCBz
YW1wbGVzL3J1c3QvcnVzdF93b3JrcXVldWVfdGVzdC5ycwoKZGlmZiAtLWdpdCBhLy5rdW5pdGNv
bmZpZyBiLy5rdW5pdGNvbmZpZwpuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAw
MDAuLjI0NTI2Y2EwNjEyMgotLS0gL2Rldi9udWxsCisrKyBiLy5rdW5pdGNvbmZpZwpAQCAtMCww
ICsxLDQgQEAKK0NPTkZJR19LVU5JVD15CitDT05GSUdfUlVTVD15CitDT05GSUdfREVCVUdfS0VS
TkVMPXkKK0NPTkZJR19LVU5JVF9BTExfVEVTVFM9eQpkaWZmIC0tZ2l0IGEvcnVzdC9oZWxwZXJz
L3dvcmtxdWV1ZS5jIGIvcnVzdC9oZWxwZXJzL3dvcmtxdWV1ZS5jCmluZGV4IGNlMWMzYTViMjE1
MC4uYmM4MzQ4MWMyNGI3IDEwMDY0NAotLS0gYS9ydXN0L2hlbHBlcnMvd29ya3F1ZXVlLmMKKysr
IGIvcnVzdC9oZWxwZXJzL3dvcmtxdWV1ZS5jCkBAIC0xNCwzICsxNCwxOCBAQCBfX3J1c3RfaGVs
cGVyIHZvaWQgcnVzdF9oZWxwZXJfaW5pdF93b3JrX3dpdGhfa2V5KHN0cnVjdCB3b3JrX3N0cnVj
dCAqd29yaywKIAlJTklUX0xJU1RfSEVBRCgmd29yay0+ZW50cnkpOwogCXdvcmstPmZ1bmMgPSBm
dW5jOwogfQorCitfX3J1c3RfaGVscGVyIGJvb2wgcnVzdF9oZWxwZXJfd29ya19wZW5kaW5nKHN0
cnVjdCB3b3JrX3N0cnVjdCAqd29yaykKK3sKKwlyZXR1cm4gd29ya19wZW5kaW5nKHdvcmspOwor
fQorCitfX3J1c3RfaGVscGVyIGJvb2wgcnVzdF9oZWxwZXJfY2FuY2VsX3dvcmtfc3luYyhzdHJ1
Y3Qgd29ya19zdHJ1Y3QgKndvcmspCit7CisJcmV0dXJuIGNhbmNlbF93b3JrX3N5bmMod29yayk7
Cit9CisKK19fcnVzdF9oZWxwZXIgYm9vbCBydXN0X2hlbHBlcl9jYW5jZWxfZGVsYXllZF93b3Jr
X3N5bmMoc3RydWN0IGRlbGF5ZWRfd29yayAqZHdvcmspCit7CisJcmV0dXJuIGNhbmNlbF9kZWxh
eWVkX3dvcmtfc3luYyhkd29yayk7Cit9CmRpZmYgLS1naXQgYS9ydXN0L2tlcm5lbC93b3JrcXVl
dWUucnMgYi9ydXN0L2tlcm5lbC93b3JrcXVldWUucnMKaW5kZXggNzA2ZTgzM2U5NzAyLi4xNDky
MjBhMGVhYWMgMTAwNjQ0Ci0tLSBhL3J1c3Qva2VybmVsL3dvcmtxdWV1ZS5ycworKysgYi9ydXN0
L2tlcm5lbC93b3JrcXVldWUucnMKQEAgLTQ0OCw4ICs0NDgsMjYgQEAgcHViIHVuc2FmZSB0cmFp
dCBXb3JrSXRlbVBvaW50ZXI8Y29uc3QgSUQ6IHU2ND46IFJhd1dvcmtJdGVtPElEPiB7CiAgICAg
Ly8vIFRoZSBwcm92aWRlZCBgd29ya19zdHJ1Y3RgIHBvaW50ZXIgbXVzdCBvcmlnaW5hdGUgZnJv
bSBhIHByZXZpb3VzIGNhbGwgdG8gW2BfX2VucXVldWVgXQogICAgIC8vLyB3aGVyZSB0aGUgYHF1
ZXVlX3dvcmtfb25gIGNsb3N1cmUgcmV0dXJuZWQgdHJ1ZSwgYW5kIHRoZSBwb2ludGVyIG11c3Qg
c3RpbGwgYmUgdmFsaWQuCiAgICAgLy8vCisgICAgLy8vIFRoZSBpbXBsZW1lbnRhdGlvbiBtdXN0
IGVuc3VyZSB0aGF0IHRoZSBwb2ludGVyIGlzIHJlY2xhaW1lZCAoZS5nLiwgdmlhIGBmcm9tX3Jh
d2ApCisgICAgLy8vIGJlZm9yZSBjYWxsaW5nIHRoZSBgcnVuYCBtZXRob2Qgb2YgdGhlIHVuZGVy
bHlpbmcgW2BXb3JrSXRlbWBdLgorICAgIC8vLwogICAgIC8vLyBbYF9fZW5xdWV1ZWBdOiBSYXdX
b3JrSXRlbTo6X19lbnF1ZXVlCiAgICAgdW5zYWZlIGV4dGVybiAiQyIgZm4gcnVuKHB0cjogKm11
dCBiaW5kaW5nczo6d29ya19zdHJ1Y3QpOworCisgICAgLy8vIFJlY2xhaW1zIG93bmVyc2hpcCBv
ZiB0aGUgcG9pbnRlciBmcm9tIHRoZSB3b3JrIGl0ZW0uCisgICAgLy8vCisgICAgLy8vIFRoaXMg
aXMgY2FsbGVkIHdoZW4gYSB3b3JrIGl0ZW0gaXMgc3VjY2Vzc2Z1bGx5IGNhbmNlbGxlZCwgYWxs
b3dpbmcgdGhlIGNhbGxlcgorICAgIC8vLyB0byByZWNvdmVyIHRoZSBvcmlnaW5hbCBwb2ludGVy
IChlLmcuLCBgQXJjYCBvciBgS0JveGApIHRoYXQgd2FzICJsZWFrZWQiCisgICAgLy8vIGR1cmlu
ZyBlbnF1ZXVpbmcuCisgICAgLy8vCisgICAgLy8vICMgU2FmZXR5CisgICAgLy8vCisgICAgLy8v
IFRoZSBwcm92aWRlZCBgd29ya19zdHJ1Y3RgIHBvaW50ZXIgbXVzdCBvcmlnaW5hdGUgZnJvbSBh
IHByZXZpb3VzIGNhbGwgdG8gW2BfX2VucXVldWVgXQorICAgIC8vLyB3aGVyZSB0aGUgYHF1ZXVl
X3dvcmtfb25gIGNsb3N1cmUgcmV0dXJuZWQgdHJ1ZSwgYW5kIHRoZSB3b3JrIGl0ZW0gbXVzdCBo
YXZlIGJlZW4KKyAgICAvLy8gc3VjY2Vzc2Z1bGx5IGNhbmNlbGxlZCAoaS5lLiwgYGNhbmNlbF93
b3JrYCByZXR1cm5lZCB0cnVlKS4KKyAgICAvLy8KKyAgICAvLy8gW2BfX2VucXVldWVgXTogUmF3
V29ya0l0ZW06Ol9fZW5xdWV1ZQorICAgIHVuc2FmZSBmbiByZWNsYWltKHB0cjogKm11dCBiaW5k
aW5nczo6d29ya19zdHJ1Y3QpIC0+IFNlbGY7CiB9CiAKIC8vLyBEZWZpbmVzIHRoZSBtZXRob2Qg
dGhhdCBzaG91bGQgYmUgY2FsbGVkIHdoZW4gdGhpcyB3b3JrIGl0ZW0gaXMgZXhlY3V0ZWQuCkBA
IC01MTYsNiArNTM0LDE1NiBAQCBwdWIgZm4gbmV3KG5hbWU6ICYnc3RhdGljIENTdHIsIGtleTog
UGluPCYnc3RhdGljIExvY2tDbGFzc0tleT4pIC0+IGltcGwgUGluSW5pdAogICAgICAgICB9KQog
ICAgIH0KIAorICAgIC8vLyBSZXR1cm5zIHdoZXRoZXIgdGhlIHdvcmsgaXRlbSBpcyBjdXJyZW50
bHkgcGVuZGluZy4KKyAgICAvLy8KKyAgICAvLy8gIyBXYXJuaW5nCisgICAgLy8vCisgICAgLy8v
IFRoaXMgbWV0aG9kIGlzIGluaGVyZW50bHkgcmFjeS4gQSB3b3JrIGl0ZW0gY2FuIGJlIGVucXVl
dWVkIG9yIHN0YXJ0IHJ1bm5pbmcKKyAgICAvLy8gaW1tZWRpYXRlbHkgYWZ0ZXIgdGhpcyBjaGVj
ayByZXR1cm5zLiBEbyBub3QgcmVseSBvbiB0aGlzIGZvciBjb3JyZWN0bmVzcworICAgIC8vLyBs
b2dpYyAoZS5nLiwgYXMgYSBndWFyZCBmb3IgdW5zYWZlIG9wZXJhdGlvbnMpOyB1c2UgaXQgb25s
eSBmb3IgZGVidWdnaW5nIG9yCisgICAgLy8vIG5vbi1jcml0aWNhbCBzdGF0dXMgcmVwb3J0aW5n
LgorICAgIC8vLworICAgIC8vLyAjIEV4YW1wbGVzCisgICAgLy8vCisgICAgLy8vIGBgYAorICAg
IC8vLyAjIHVzZSBrZXJuZWw6OndvcmtxdWV1ZTo6e3NlbGYsIG5ld193b3JrLCBXb3JrLCBXb3Jr
SXRlbSwgSGFzV29ya307CisgICAgLy8vICMgdXNlIGtlcm5lbDo6aW1wbF9oYXNfd29yazsKKyAg
ICAvLy8gIyB1c2Uga2VybmVsOjpzeW5jOjpBcmM7CisgICAgLy8vICMgI1twaW5fZGF0YV0KKyAg
ICAvLy8gIyBzdHJ1Y3QgTXlTdHJ1Y3QgeyAjW3Bpbl0gd29yazogV29yazxNeVN0cnVjdD4gfQor
ICAgIC8vLyAjIGltcGxfaGFzX3dvcmshIHsgaW1wbCBIYXNXb3JrPFNlbGY+IGZvciBNeVN0cnVj
dCB7IHNlbGYud29yayB9IH0KKyAgICAvLy8gIyBpbXBsIFdvcmtJdGVtIGZvciBNeVN0cnVjdCB7
CisgICAgLy8vICMgICAgIHR5cGUgUG9pbnRlciA9IEFyYzxNeVN0cnVjdD47CisgICAgLy8vICMg
ICAgIGZuIHJ1bihfdGhpczogQXJjPE15U3RydWN0Pikge30KKyAgICAvLy8gIyB9CisgICAgLy8v
IGxldCBteV9zdHJ1Y3QgPSBBcmM6OnBpbl9pbml0KHBpbl9pbml0IShNeVN0cnVjdCB7CisgICAg
Ly8vICAgICB3b3JrIDwtIG5ld193b3JrISgiTXlTdHJ1Y3Q6OndvcmsiKSwKKyAgICAvLy8gfSks
IGtlcm5lbDo6YWxsb2M6OmZsYWdzOjpHRlBfS0VSTkVMKS51bndyYXAoKTsKKyAgICAvLy8gYXNz
ZXJ0ISghbXlfc3RydWN0LndvcmsuaXNfcGVuZGluZygpKTsKKyAgICAvLy8gd29ya3F1ZXVlOjpz
eXN0ZW0oKS5lbnF1ZXVlKG15X3N0cnVjdC5jbG9uZSgpKTsKKyAgICAvLy8gYXNzZXJ0IShteV9z
dHJ1Y3Qud29yay5pc19wZW5kaW5nKCkpOworICAgIC8vLyAjIGxldCBfID0gbXlfc3RydWN0Lndv
cmsuY2FuY2VsKCk7CisgICAgLy8vIGBgYAorICAgICNbaW5saW5lXQorICAgIHB1YiBmbiBpc19w
ZW5kaW5nKCZzZWxmKSAtPiBib29sIHsKKyAgICAgICAgLy8gU0FGRVRZOiBgc2VsZi53b3JrYCBp
cyBhIHZhbGlkIHBvaW50ZXIgdG8gYSBgd29ya19zdHJ1Y3RgLgorICAgICAgICB1bnNhZmUgeyBi
aW5kaW5nczo6d29ya19wZW5kaW5nKHNlbGYud29yay5nZXQoKSkgfQorICAgIH0KKworICAgIC8v
LyBDYW5jZWxzIHRoZSB3b3JrIGl0ZW0uCisgICAgLy8vCisgICAgLy8vIElmIHRoZSB3b3JrIGl0
ZW0gd2FzIHN1Y2Nlc3NmdWxseSBjYW5jZWxsZWQgKGkuZS4sIGl0IHdhcyBwZW5kaW5nIGFuZCBo
YWQgbm90IHlldAorICAgIC8vLyBzdGFydGVkIHJ1bm5pbmcpLCB0aGUgb3JpZ2luYWwgcG9pbnRl
ciBpcyByZWNsYWltZWQgYW5kIHJldHVybmVkLgorICAgIC8vLworICAgIC8vLyAjIEd1YXJhbnRl
ZXMKKyAgICAvLy8KKyAgICAvLy8gVGhpcyBtZXRob2QgaXMgbm9uLWJsb2NraW5nIGFuZCBtYXkg
cmV0dXJuIHdoaWxlIHRoZSB3b3JrIGl0ZW0gaXMgc3RpbGwgcnVubmluZworICAgIC8vLyBvbiBh
bm90aGVyIENQVS4gSWYgaXQgcmV0dXJucyBgTm9uZWAsIHRoZSB3b3JrIGl0ZW0gbWlnaHQgYmUg
YWJvdXQgdG8gc3RhcnQsCisgICAgLy8vIGlzIGN1cnJlbnRseSBydW5uaW5nLCBvciBoYXMgYWxy
ZWFkeSBmaW5pc2hlZC4KKyAgICAvLy8KKyAgICAvLy8gIyBTYWZldHkKKyAgICAvLy8KKyAgICAv
Ly8gVGhpcyBpcyBzYWZlIGJlY2F1c2Ugb3duZXJzaGlwIGlzIG9ubHkgcmVjbGFpbWVkIGlmIHRo
ZSBrZXJuZWwgY29uZmlybXMgKHZpYQorICAgIC8vLyBgY2FuY2VsX3dvcmtgIHJldHVybmluZyB0
cnVlKSB0aGF0IHRoZSB3b3JrIGl0ZW0gaXMgbm8gbG9uZ2VyIGluIGFueSBxdWV1ZSBhbmQKKyAg
ICAvLy8gd2lsbCBub3QgYmUgZXhlY3V0ZWQgYnkgdGhlIHdvcmtxdWV1ZSBmb3IgdGhpcyBzcGVj
aWZpYyBlbnF1ZXVlIGV2ZW50LgorICAgIC8vLworICAgIC8vLyBbYGNhbmNlbF9zeW5jYF06IFdv
cms6OmNhbmNlbF9zeW5jCisgICAgLy8vCisgICAgLy8vICMgRXhhbXBsZXMKKyAgICAvLy8KKyAg
ICAvLy8gYGBgCisgICAgLy8vICMgdXNlIGtlcm5lbDo6d29ya3F1ZXVlOjp7c2VsZiwgbmV3X3dv
cmssIFdvcmssIFdvcmtJdGVtLCBIYXNXb3JrfTsKKyAgICAvLy8gIyB1c2Uga2VybmVsOjppbXBs
X2hhc193b3JrOworICAgIC8vLyAjIHVzZSBrZXJuZWw6OnN5bmM6OkFyYzsKKyAgICAvLy8gIyAj
W3Bpbl9kYXRhXQorICAgIC8vLyAjIHN0cnVjdCBNeVN0cnVjdCB7ICNbcGluXSB3b3JrOiBXb3Jr
PE15U3RydWN0PiB9CisgICAgLy8vICMgaW1wbF9oYXNfd29yayEgeyBpbXBsIEhhc1dvcms8U2Vs
Zj4gZm9yIE15U3RydWN0IHsgc2VsZi53b3JrIH0gfQorICAgIC8vLyAjIGltcGwgV29ya0l0ZW0g
Zm9yIE15U3RydWN0IHsKKyAgICAvLy8gIyAgICAgdHlwZSBQb2ludGVyID0gQXJjPE15U3RydWN0
PjsKKyAgICAvLy8gIyAgICAgZm4gcnVuKF90aGlzOiBBcmM8TXlTdHJ1Y3Q+KSB7fQorICAgIC8v
LyAjIH0KKyAgICAvLy8gbGV0IG15X3N0cnVjdCA9IEFyYzo6cGluX2luaXQocGluX2luaXQhKE15
U3RydWN0IHsKKyAgICAvLy8gICAgIHdvcmsgPC0gbmV3X3dvcmshKCJNeVN0cnVjdDo6d29yayIp
LAorICAgIC8vLyB9KSwga2VybmVsOjphbGxvYzo6ZmxhZ3M6OkdGUF9LRVJORUwpLnVud3JhcCgp
OworICAgIC8vLyB3b3JrcXVldWU6OnN5c3RlbSgpLmVucXVldWUobXlfc3RydWN0LmNsb25lKCkp
OworICAgIC8vLyBhc3NlcnQhKG15X3N0cnVjdC53b3JrLmlzX3BlbmRpbmcoKSk7CisgICAgLy8v
IGxldCByZWNsYWltZWQgPSBteV9zdHJ1Y3Qud29yay5jYW5jZWwoKTsKKyAgICAvLy8gYXNzZXJ0
IShyZWNsYWltZWQuaXNfc29tZSgpKTsKKyAgICAvLy8gYXNzZXJ0ISghbXlfc3RydWN0Lndvcmsu
aXNfcGVuZGluZygpKTsKKyAgICAvLy8gYGBgCisgICAgcHViIGZuIGNhbmNlbCgmc2VsZikgLT4g
T3B0aW9uPFQ6OlBvaW50ZXI+CisgICAgd2hlcmUKKyAgICAgICAgVDogV29ya0l0ZW08SUQ+LAor
ICAgIHsKKyAgICAgICAgbGV0IHdvcmtfcHRyID0gc2VsZi53b3JrLmdldCgpOworICAgICAgICAv
LyBTQUZFVFk6IGB3b3JrX3B0cmAgaXMgYSB2YWxpZCBwb2ludGVyIHRvIGEgYHdvcmtfc3RydWN0
YC4KKyAgICAgICAgaWYgdW5zYWZlIHsgYmluZGluZ3M6OmNhbmNlbF93b3JrKHdvcmtfcHRyKSB9
IHsKKyAgICAgICAgICAgIC8vIFNBRkVUWTogVGhlIHdvcmsgaXRlbSB3YXMgc3VjY2Vzc2Z1bGx5
IGNhbmNlbGxlZCBhbmQgaXMgZ3VhcmFudGVlZCBub3QgdG8gcnVuLAorICAgICAgICAgICAgLy8g
c28gd2UgY2FuIHNhZmVseSByZWNsYWltIHRoZSBvd25lcnNoaXAgbGVha2VkIGR1cmluZyBgZW5x
dWV1ZWAuCisgICAgICAgICAgICBTb21lKHVuc2FmZSB7IFQ6OlBvaW50ZXI6OnJlY2xhaW0od29y
a19wdHIpIH0pCisgICAgICAgIH0gZWxzZSB7CisgICAgICAgICAgICBOb25lCisgICAgICAgIH0K
KyAgICB9CisKKyAgICAvLy8gU3luY2hyb25vdXNseSBjYW5jZWxzIHRoZSB3b3JrIGl0ZW0uCisg
ICAgLy8vCisgICAgLy8vIFRoaXMgbWV0aG9kIHdhaXRzIGZvciB0aGUgd29yayBpdGVtIHRvIGZp
bmlzaCBpZiBpdCBpcyBjdXJyZW50bHkgcnVubmluZy4KKyAgICAvLy8gSWYgdGhlIHdvcmsgaXRl
bSB3YXMgc3VjY2Vzc2Z1bGx5IGNhbmNlbGxlZCBmcm9tIHRoZSBxdWV1ZSwgdGhlIHBvaW50ZXIg
aXMKKyAgICAvLy8gcmVjbGFpbWVkIGFuZCByZXR1cm5lZC4KKyAgICAvLy8KKyAgICAvLy8gIyBH
dWFyYW50ZWVzCisgICAgLy8vCisgICAgLy8vIEFmdGVyIHRoaXMgbWV0aG9kIHJldHVybnMsIHRo
ZSB3b3JrIGl0ZW0gaXMgZ3VhcmFudGVlZCB0byBiZToKKyAgICAvLy8gLSBOb3QgcGVuZGluZyBp
biBhbnkgcXVldWUuCisgICAgLy8vIC0gTm90IHJ1bm5pbmcgb24gYW55IENQVS4KKyAgICAvLy8K
KyAgICAvLy8gVGhpcyBtYWtlcyBpdCBzYWZlIHRvIHVzZSBkdXJpbmcgdGVhcmRvd24gKGUuZy4s
IGRyaXZlciBgcmVtb3ZlYCBvciBvYmplY3QgYGRyb3BgKQorICAgIC8vLyB0byBlbnN1cmUgbm8g
YmFja2dyb3VuZCB0YXNrcyBhcmUgYWNjZXNzaW5nIHJlc291cmNlcyB0aGF0IGFyZSBhYm91dCB0
byBiZSBmcmVlZC4KKyAgICAvLy8KKyAgICAvLy8gIyBTYWZldHkKKyAgICAvLy8KKyAgICAvLy8g
U2FtZSBhcyBbYGNhbmNlbGBdLCBpdCBvbmx5IHJlY2xhaW1zIG93bmVyc2hpcCBpZiB0aGUga2Vy
bmVsIGNvbmZpcm1zIHRoZSB3b3JrCisgICAgLy8vIHdhcyBzdGlsbCBwZW5kaW5nIGFuZCBpcyBu
b3cgcmVtb3ZlZC4KKyAgICAvLy8KKyAgICAvLy8gW2BjYW5jZWxgXTogV29yazo6Y2FuY2VsCisg
ICAgLy8vCisgICAgLy8vICMgRXhhbXBsZXMKKyAgICAvLy8KKyAgICAvLy8gYGBgCisgICAgLy8v
ICMgdXNlIGtlcm5lbDo6d29ya3F1ZXVlOjp7c2VsZiwgbmV3X3dvcmssIFdvcmssIFdvcmtJdGVt
LCBIYXNXb3JrfTsKKyAgICAvLy8gIyB1c2Uga2VybmVsOjppbXBsX2hhc193b3JrOworICAgIC8v
LyAjIHVzZSBrZXJuZWw6OnN5bmM6OkFyYzsKKyAgICAvLy8gIyAjW3Bpbl9kYXRhXQorICAgIC8v
LyAjIHN0cnVjdCBNeVN0cnVjdCB7ICNbcGluXSB3b3JrOiBXb3JrPE15U3RydWN0PiB9CisgICAg
Ly8vICMgaW1wbF9oYXNfd29yayEgeyBpbXBsIEhhc1dvcms8U2VsZj4gZm9yIE15U3RydWN0IHsg
c2VsZi53b3JrIH0gfQorICAgIC8vLyAjIGltcGwgV29ya0l0ZW0gZm9yIE15U3RydWN0IHsKKyAg
ICAvLy8gIyAgICAgdHlwZSBQb2ludGVyID0gQXJjPE15U3RydWN0PjsKKyAgICAvLy8gIyAgICAg
Zm4gcnVuKF90aGlzOiBBcmM8TXlTdHJ1Y3Q+KSB7fQorICAgIC8vLyAjIH0KKyAgICAvLy8gbGV0
IG15X3N0cnVjdCA9IEFyYzo6cGluX2luaXQocGluX2luaXQhKE15U3RydWN0IHsKKyAgICAvLy8g
ICAgIHdvcmsgPC0gbmV3X3dvcmshKCJNeVN0cnVjdDo6d29yayIpLAorICAgIC8vLyB9KSwga2Vy
bmVsOjphbGxvYzo6ZmxhZ3M6OkdGUF9LRVJORUwpLnVud3JhcCgpOworICAgIC8vLyB3b3JrcXVl
dWU6OnN5c3RlbSgpLmVucXVldWUobXlfc3RydWN0LmNsb25lKCkpOworICAgIC8vLyBsZXQgcmVj
bGFpbWVkID0gbXlfc3RydWN0LndvcmsuY2FuY2VsX3N5bmMoKTsKKyAgICAvLy8gYXNzZXJ0IShy
ZWNsYWltZWQuaXNfc29tZSgpKTsKKyAgICAvLy8gYGBgCisgICAgcHViIGZuIGNhbmNlbF9zeW5j
KCZzZWxmKSAtPiBPcHRpb248VDo6UG9pbnRlcj4KKyAgICB3aGVyZQorICAgICAgICBUOiBXb3Jr
SXRlbTxJRD4sCisgICAgeworICAgICAgICBsZXQgd29ya19wdHIgPSBzZWxmLndvcmsuZ2V0KCk7
CisgICAgICAgIC8vIFNBRkVUWTogYHdvcmtfcHRyYCBpcyBhIHZhbGlkIHBvaW50ZXIgdG8gYSBg
d29ya19zdHJ1Y3RgLgorICAgICAgICBpZiB1bnNhZmUgeyBiaW5kaW5nczo6Y2FuY2VsX3dvcmtf
c3luYyh3b3JrX3B0cikgfSB7CisgICAgICAgICAgICAvLyBTQUZFVFk6IFRoZSB3b3JrIGl0ZW0g
d2FzIHN1Y2Nlc3NmdWxseSBjYW5jZWxsZWQvd2FpdGVkIGZvciwgYW5kIGlzIGd1YXJhbnRlZWQK
KyAgICAgICAgICAgIC8vIG5vdCB0byBydW4gYWdhaW4gdW5sZXNzIHJlLWVucXVldWVkLiBXZSBy
ZWNsYWltIHRoZSBvd25lcnNoaXAgbGVha2VkIGR1cmluZworICAgICAgICAgICAgLy8gYGVucXVl
dWVgLgorICAgICAgICAgICAgU29tZSh1bnNhZmUgeyBUOjpQb2ludGVyOjpyZWNsYWltKHdvcmtf
cHRyKSB9KQorICAgICAgICB9IGVsc2UgeworICAgICAgICAgICAgTm9uZQorICAgICAgICB9Cisg
ICAgfQorCiAgICAgLy8vIEdldCBhIHBvaW50ZXIgdG8gdGhlIGlubmVyIGB3b3JrX3N0cnVjdGAu
CiAgICAgLy8vCiAgICAgLy8vICMgU2FmZXR5CkBAIC03MDIsNiArODcwLDg5IEBAIHB1YiBmbiBu
ZXcoCiAgICAgICAgIH0pCiAgICAgfQogCisgICAgLy8vIFJldHVybnMgd2hldGhlciB0aGUgd29y
ayBpdGVtIGlzIGN1cnJlbnRseSBwZW5kaW5nLgorICAgIC8vLworICAgIC8vLyAjIFdhcm5pbmcK
KyAgICAvLy8KKyAgICAvLy8gVGhpcyBtZXRob2QgaXMgaW5oZXJlbnRseSByYWN5LiBTZWUgW2BX
b3JrOjppc19wZW5kaW5nYF0uCisgICAgLy8vCisgICAgLy8vICMgRXhhbXBsZXMKKyAgICAvLy8K
KyAgICAvLy8gU2VlIFtgV29yazo6aXNfcGVuZGluZ2BdLgorICAgIC8vLworICAgIC8vLyBbYFdv
cms6OmlzX3BlbmRpbmdgXTogV29yazo6aXNfcGVuZGluZworICAgICNbaW5saW5lXQorICAgIHB1
YiBmbiBpc19wZW5kaW5nKCZzZWxmKSAtPiBib29sIHsKKyAgICAgICAgLy8gU0FGRVRZOiBgc2Vs
Zi5kd29ya2AgaXMgcmVhY2hpbmcgaW50byBhIHZhbGlkIE9wYXF1ZTxiaW5kaW5nczo6ZGVsYXll
ZF93b3JrPi4KKyAgICAgICAgdW5zYWZlIHsKKyAgICAgICAgICAgIGxldCBwdHI6ICptdXQgYmlu
ZGluZ3M6OmRlbGF5ZWRfd29yayA9IHNlbGYuZHdvcmsuZ2V0KCk7CisgICAgICAgICAgICBiaW5k
aW5nczo6d29ya19wZW5kaW5nKGNvcmU6OnB0cjo6YWRkcl9vZl9tdXQhKCgqcHRyKS53b3JrKSkK
KyAgICAgICAgfQorICAgIH0KKworICAgIC8vLyBDYW5jZWxzIHRoZSBkZWxheWVkIHdvcmsgaXRl
bS4KKyAgICAvLy8KKyAgICAvLy8gSWYgdGhlIHdvcmsgaXRlbSB3YXMgc3VjY2Vzc2Z1bGx5IGNh
bmNlbGxlZCAoaS5lLiwgaXQgd2FzIHBlbmRpbmcgYW5kIGhhZCBub3QgeWV0CisgICAgLy8vIHN0
YXJ0ZWQgcnVubmluZyksIHRoZSBvcmlnaW5hbCBwb2ludGVyIGlzIHJlY2xhaW1lZCBhbmQgcmV0
dXJuZWQuCisgICAgLy8vCisgICAgLy8vICMgR3VhcmFudGVlcworICAgIC8vLworICAgIC8vLyBT
ZWUgW2BXb3JrOjpjYW5jZWxgXS4KKyAgICAvLy8KKyAgICAvLy8gIyBTYWZldHkKKyAgICAvLy8K
KyAgICAvLy8gU2FtZSBhcyBbYFdvcms6OmNhbmNlbGBdLgorICAgIC8vLworICAgIC8vLyBbYGNh
bmNlbF9zeW5jYF06IERlbGF5ZWRXb3JrOjpjYW5jZWxfc3luYworICAgIC8vLyBbYFdvcms6OmNh
bmNlbGBdOiBXb3JrOjpjYW5jZWwKKyAgICAvLy8KKyAgICAvLy8gIyBFeGFtcGxlcworICAgIC8v
LworICAgIC8vLyBTZWUgW2BXb3JrOjpjYW5jZWxgXS4KKyAgICBwdWIgZm4gY2FuY2VsKCZzZWxm
KSAtPiBPcHRpb248VDo6UG9pbnRlcj4KKyAgICB3aGVyZQorICAgICAgICBUOiBXb3JrSXRlbTxJ
RD4sCisgICAgeworICAgICAgICBsZXQgZHdvcmtfcHRyID0gc2VsZi5kd29yay5nZXQoKTsKKyAg
ICAgICAgLy8gU0FGRVRZOiBgZHdvcmtfcHRyYCBpcyBhIHZhbGlkIHBvaW50ZXIgdG8gYSBgZGVs
YXllZF93b3JrYC4KKyAgICAgICAgaWYgdW5zYWZlIHsgYmluZGluZ3M6OmNhbmNlbF9kZWxheWVk
X3dvcmsoZHdvcmtfcHRyKSB9IHsKKyAgICAgICAgICAgIC8vIFNBRkVUWTogVGhlIHdvcmsgaXRl
bSB3YXMgc3VjY2Vzc2Z1bGx5IGNhbmNlbGxlZCBhbmQgaXMgZ3VhcmFudGVlZCBub3QgdG8gcnVu
LAorICAgICAgICAgICAgLy8gc28gd2UgY2FuIHNhZmVseSByZWNsYWltIHRoZSBvd25lcnNoaXAg
bGVha2VkIGR1cmluZyBgZW5xdWV1ZWAuCisgICAgICAgICAgICBTb21lKHVuc2FmZSB7IFQ6OlBv
aW50ZXI6OnJlY2xhaW0oY29yZTo6cHRyOjphZGRyX29mX211dCEoKCpkd29ya19wdHIpLndvcmsp
KSB9KQorICAgICAgICB9IGVsc2UgeworICAgICAgICAgICAgTm9uZQorICAgICAgICB9CisgICAg
fQorCisgICAgLy8vIFN5bmNocm9ub3VzbHkgY2FuY2VscyB0aGUgZGVsYXllZCB3b3JrIGl0ZW0u
CisgICAgLy8vCisgICAgLy8vIFRoaXMgbWV0aG9kIHdhaXRzIGZvciB0aGUgd29yayBpdGVtIHRv
IGZpbmlzaCBpZiBpdCBpcyBjdXJyZW50bHkgcnVubmluZy4KKyAgICAvLy8gSWYgdGhlIHdvcmsg
aXRlbSB3YXMgc3VjY2Vzc2Z1bGx5IGNhbmNlbGxlZCBmcm9tIHRoZSBxdWV1ZSwgdGhlIHBvaW50
ZXIgaXMKKyAgICAvLy8gcmVjbGFpbWVkIGFuZCByZXR1cm5lZC4KKyAgICAvLy8KKyAgICAvLy8g
IyBHdWFyYW50ZWVzCisgICAgLy8vCisgICAgLy8vIFNlZSBbYFdvcms6OmNhbmNlbF9zeW5jYF0u
CisgICAgLy8vCisgICAgLy8vICMgU2FmZXR5CisgICAgLy8vCisgICAgLy8vIFNhbWUgYXMgW2BX
b3JrOjpjYW5jZWxfc3luY2BdLgorICAgIHB1YiBmbiBjYW5jZWxfc3luYygmc2VsZikgLT4gT3B0
aW9uPFQ6OlBvaW50ZXI+CisgICAgd2hlcmUKKyAgICAgICAgVDogV29ya0l0ZW08SUQ+LAorICAg
IHsKKyAgICAgICAgbGV0IGR3b3JrX3B0ciA9IHNlbGYuZHdvcmsuZ2V0KCk7CisgICAgICAgIC8v
IFNBRkVUWTogYGR3b3JrX3B0cmAgaXMgYSB2YWxpZCBwb2ludGVyIHRvIGEgYGRlbGF5ZWRfd29y
a2AuCisgICAgICAgIGlmIHVuc2FmZSB7IGJpbmRpbmdzOjpjYW5jZWxfZGVsYXllZF93b3JrX3N5
bmMoZHdvcmtfcHRyKSB9IHsKKyAgICAgICAgICAgIC8vIFNBRkVUWTogVGhlIHdvcmsgaXRlbSB3
YXMgc3VjY2Vzc2Z1bGx5IGNhbmNlbGxlZC93YWl0ZWQgZm9yLCBhbmQgaXMgZ3VhcmFudGVlZAor
ICAgICAgICAgICAgLy8gbm90IHRvIHJ1biBhZ2FpbiB1bmxlc3MgcmUtZW5xdWV1ZWQuIFdlIHJl
Y2xhaW0gdGhlIG93bmVyc2hpcCBsZWFrZWQgZHVyaW5nCisgICAgICAgICAgICAvLyBgZW5xdWV1
ZWAuCisgICAgICAgICAgICBTb21lKHVuc2FmZSB7IFQ6OlBvaW50ZXI6OnJlY2xhaW0oY29yZTo6
cHRyOjphZGRyX29mX211dCEoKCpkd29ya19wdHIpLndvcmspKSB9KQorICAgICAgICB9IGVsc2Ug
eworICAgICAgICAgICAgTm9uZQorICAgICAgICB9CisgICAgfQorCiAgICAgLy8vIEdldCBhIHBv
aW50ZXIgdG8gdGhlIGlubmVyIGBkZWxheWVkX3dvcmtgLgogICAgIC8vLwogICAgIC8vLyAjIFNh
ZmV0eQpAQCAtODI3LDYgKzEwNzgsMTUgQEAgdW5zYWZlIGltcGw8VCwgY29uc3QgSUQ6IHU2ND4g
V29ya0l0ZW1Qb2ludGVyPElEPiBmb3IgQXJjPFQ+CiAKICAgICAgICAgVDo6cnVuKGFyYykKICAg
ICB9CisKKyAgICB1bnNhZmUgZm4gcmVjbGFpbShwdHI6ICptdXQgYmluZGluZ3M6Ondvcmtfc3Ry
dWN0KSAtPiBTZWxmIHsKKyAgICAgICAgLy8gVGhlIGBfX2VucXVldWVgIG1ldGhvZCBhbHdheXMg
dXNlcyBhIGB3b3JrX3N0cnVjdGAgc3RvcmVkIGluIGEgYFdvcms8VCwgSUQ+YC4KKyAgICAgICAg
bGV0IHB0ciA9IHB0ci5jYXN0Ojo8V29yazxULCBJRD4+KCk7CisgICAgICAgIC8vIFNBRkVUWTog
VGhpcyBjb21wdXRlcyB0aGUgcG9pbnRlciB0aGF0IGBfX2VucXVldWVgIGdvdCBmcm9tIGBBcmM6
OmludG9fcmF3YC4KKyAgICAgICAgbGV0IHB0ciA9IHVuc2FmZSB7IFQ6OndvcmtfY29udGFpbmVy
X29mKHB0cikgfTsKKyAgICAgICAgLy8gU0FGRVRZOiBUaGlzIHBvaW50ZXIgY29tZXMgZnJvbSBg
QXJjOjppbnRvX3Jhd2AgYW5kIHdlJ3ZlIGJlZW4gZ2l2ZW4gYmFjayBvd25lcnNoaXAuCisgICAg
ICAgIHVuc2FmZSB7IEFyYzo6ZnJvbV9yYXcocHRyKSB9CisgICAgfQogfQogCiAvLyBTQUZFVFk6
IFRoZSBgd29ya19zdHJ1Y3RgIHJhdyBwb2ludGVyIGlzIGd1YXJhbnRlZWQgdG8gYmUgdmFsaWQg
Zm9yIHRoZSBkdXJhdGlvbiBvZiB0aGUgY2FsbCB0bwpAQCAtODc0LDcgKzExMzQsOCBAQCB1bnNh
ZmUgaW1wbDxULCBjb25zdCBJRDogdTY0PiBSYXdEZWxheWVkV29ya0l0ZW08SUQ+IGZvciBBcmM8
VD4KIHsKIH0KIAotLy8gU0FGRVRZOiBUT0RPLgorLy8gU0FGRVRZOiBUaGUgYFdvcmtJdGVtUG9p
bnRlcmAgaW1wbGVtZW50YXRpb24gZm9yIGBQaW48S0JveDxUPj5gIGlzIHNhZmUgYmVjYXVzZSBg
S0JveDo6ZnJvbV9yYXdgCisvLyBjb3JyZWN0bHkgcmVjb25zdHJ1Y3RzIHRoZSBib3ggdGhhdCB3
YXMgbGVha2VkIGR1cmluZyBgZW5xdWV1ZWAgKHZpYSBgS0JveDo6aW50b19yYXdgKS4KIHVuc2Fm
ZSBpbXBsPFQsIGNvbnN0IElEOiB1NjQ+IFdvcmtJdGVtUG9pbnRlcjxJRD4gZm9yIFBpbjxLQm94
PFQ+Pgogd2hlcmUKICAgICBUOiBXb3JrSXRlbTxJRCwgUG9pbnRlciA9IFNlbGY+LApAQCAtODgz
LDE4ICsxMTQ0LDM1IEBAIHVuc2FmZSBpbXBsPFQsIGNvbnN0IElEOiB1NjQ+IFdvcmtJdGVtUG9p
bnRlcjxJRD4gZm9yIFBpbjxLQm94PFQ+PgogICAgIHVuc2FmZSBleHRlcm4gIkMiIGZuIHJ1bihw
dHI6ICptdXQgYmluZGluZ3M6Ondvcmtfc3RydWN0KSB7CiAgICAgICAgIC8vIFRoZSBgX19lbnF1
ZXVlYCBtZXRob2QgYWx3YXlzIHVzZXMgYSBgd29ya19zdHJ1Y3RgIHN0b3JlZCBpbiBhIGBXb3Jr
PFQsIElEPmAuCiAgICAgICAgIGxldCBwdHIgPSBwdHIuY2FzdDo6PFdvcms8VCwgSUQ+PigpOwot
ICAgICAgICAvLyBTQUZFVFk6IFRoaXMgY29tcHV0ZXMgdGhlIHBvaW50ZXIgdGhhdCBgX19lbnF1
ZXVlYCBnb3QgZnJvbSBgQXJjOjppbnRvX3Jhd2AuCisgICAgICAgIC8vIFNBRkVUWTogVGhpcyBj
b21wdXRlcyB0aGUgcG9pbnRlciB0aGF0IGBfX2VucXVldWVgIGdvdCBmcm9tIGBLQm94OjppbnRv
X3Jhd2AuCiAgICAgICAgIGxldCBwdHIgPSB1bnNhZmUgeyBUOjp3b3JrX2NvbnRhaW5lcl9vZihw
dHIpIH07Ci0gICAgICAgIC8vIFNBRkVUWTogVGhpcyBwb2ludGVyIGNvbWVzIGZyb20gYEFyYzo6
aW50b19yYXdgIGFuZCB3ZSd2ZSBiZWVuIGdpdmVuIGJhY2sgb3duZXJzaGlwLgorICAgICAgICAv
LyBTQUZFVFk6IFRoaXMgcG9pbnRlciBjb21lcyBmcm9tIGBLQm94OjppbnRvX3Jhd2AgYW5kIHdl
J3ZlIGJlZW4gZ2l2ZW4gYmFjayBvd25lcnNoaXAuCiAgICAgICAgIGxldCBib3hlZCA9IHVuc2Fm
ZSB7IEtCb3g6OmZyb21fcmF3KHB0cikgfTsKICAgICAgICAgLy8gU0FGRVRZOiBUaGUgYm94IHdh
cyBhbHJlYWR5IHBpbm5lZCB3aGVuIGl0IHdhcyBlbnF1ZXVlZC4KICAgICAgICAgbGV0IHBpbm5l
ZCA9IHVuc2FmZSB7IFBpbjo6bmV3X3VuY2hlY2tlZChib3hlZCkgfTsKIAogICAgICAgICBUOjpy
dW4ocGlubmVkKQogICAgIH0KKworICAgIHVuc2FmZSBmbiByZWNsYWltKHB0cjogKm11dCBiaW5k
aW5nczo6d29ya19zdHJ1Y3QpIC0+IFNlbGYgeworICAgICAgICAvLyBUaGUgYF9fZW5xdWV1ZWAg
bWV0aG9kIGFsd2F5cyB1c2VzIGEgYHdvcmtfc3RydWN0YCBzdG9yZWQgaW4gYSBgV29yazxULCBJ
RD5gLgorICAgICAgICBsZXQgcHRyID0gcHRyLmNhc3Q6OjxXb3JrPFQsIElEPj4oKTsKKyAgICAg
ICAgLy8gU0FGRVRZOiBUaGlzIGNvbXB1dGVzIHRoZSBwb2ludGVyIHRoYXQgYF9fZW5xdWV1ZWAg
Z290IGZyb20gYEtCb3g6OmludG9fcmF3YC4KKyAgICAgICAgbGV0IHB0ciA9IHVuc2FmZSB7IFQ6
OndvcmtfY29udGFpbmVyX29mKHB0cikgfTsKKyAgICAgICAgLy8gU0FGRVRZOiBUaGlzIHBvaW50
ZXIgY29tZXMgZnJvbSBgS0JveDo6aW50b19yYXdgIGFuZCB3ZSd2ZSBiZWVuIGdpdmVuIGJhY2sg
b3duZXJzaGlwLgorICAgICAgICBsZXQgYm94ZWQgPSB1bnNhZmUgeyBLQm94Ojpmcm9tX3Jhdyhw
dHIpIH07CisgICAgICAgIC8vIFNBRkVUWTogVGhlIGJveCB3YXMgYWxyZWFkeSBwaW5uZWQgd2hl
biBpdCB3YXMgZW5xdWV1ZWQuCisgICAgICAgIHVuc2FmZSB7IFBpbjo6bmV3X3VuY2hlY2tlZChi
b3hlZCkgfQorICAgIH0KIH0KIAotLy8gU0FGRVRZOiBUT0RPLgorLy8gU0FGRVRZOiBUaGUgYHdv
cmtfc3RydWN0YCByYXcgcG9pbnRlciBpcyBndWFyYW50ZWVkIHRvIGJlIHZhbGlkIGZvciB0aGUg
ZHVyYXRpb24gb2YgdGhlIGNhbGwgdG8KKy8vIHRoZSBjbG9zdXJlIGJlY2F1c2Ugd2UgaGF2ZSBl
eGNsdXNpdmUgb3duZXJzaGlwIG9mIHRoZSBgS0JveGAsIGFuZCB3ZSBkb24ndCBkcm9wIGl0IG91
cnNlbHZlcy4KKy8vIElmIGBxdWV1ZV93b3JrX29uYCByZXR1cm5zIHRydWUsIGl0IGlzIGZ1cnRo
ZXIgZ3VhcmFudGVlZCB0byBiZSB2YWxpZCB1bnRpbCBhIGNhbGwgdG8gdGhlCisvLyBmdW5jdGlv
biBwb2ludGVyIGluIGB3b3JrX3N0cnVjdGAgYmVjYXVzZSB3ZSBsZWFrIHRoZSBtZW1vcnkgaXQg
cG9pbnRzIHRvLCBhbmQgb25seSByZWNsYWltIGl0CisvLyBpZiB0aGUgY2xvc3VyZSByZXR1cm5z
IGZhbHNlIChub3QgcmVhY2hhYmxlIGZvciBLQm94IGFzIGl0IG11c3Qgc3VjY2VlZCkgb3IgaW4K
Ky8vIGBXb3JrSXRlbVBvaW50ZXI6OnJ1bmAsIHdoaWNoIGlzIHdoYXQgdGhlIGZ1bmN0aW9uIHBv
aW50ZXIgaW4gdGhlIGB3b3JrX3N0cnVjdGAgbXVzdCBiZQorLy8gcG9pbnRpbmcgdG8uCiB1bnNh
ZmUgaW1wbDxULCBjb25zdCBJRDogdTY0PiBSYXdXb3JrSXRlbTxJRD4gZm9yIFBpbjxLQm94PFQ+
Pgogd2hlcmUKICAgICBUOiBXb3JrSXRlbTxJRCwgUG9pbnRlciA9IFNlbGY+LApAQCAtMTAyMiwz
ICsxMzAwLDEwMyBAQCBwdWIgZm4gc3lzdGVtX2JoX2hpZ2hwcmkoKSAtPiAmJ3N0YXRpYyBRdWV1
ZSB7CiAgICAgLy8gU0FGRVRZOiBgc3lzdGVtX2JoX2hpZ2hwcmlfd3FgIGlzIGEgQyBnbG9iYWws
IGFsd2F5cyBhdmFpbGFibGUuCiAgICAgdW5zYWZlIHsgUXVldWU6OmZyb21fcmF3KGJpbmRpbmdz
OjpzeXN0ZW1fYmhfaGlnaHByaV93cSkgfQogfQorCisjW21hY3Jvczo6a3VuaXRfdGVzdHMocnVz
dF9rZXJuZWxfd29ya3F1ZXVlKV0KK21vZCB0ZXN0cyB7CisgICAgdXNlIHN1cGVyOjoqOworICAg
IHVzZSBjcmF0ZTo6c3luYzo6QXJjOworCisgICAgI1twaW5fZGF0YV0KKyAgICBzdHJ1Y3QgVGVz
dEl0ZW0geworICAgICAgICAjW3Bpbl0KKyAgICAgICAgd29yazogV29yazxUZXN0SXRlbT4sCisg
ICAgICAgIHZhbHVlOiBpMzIsCisgICAgfQorCisgICAgaW1wbF9oYXNfd29yayEgeworICAgICAg
ICBpbXBsIEhhc1dvcms8U2VsZj4gZm9yIFRlc3RJdGVtIHsgc2VsZi53b3JrIH0KKyAgICB9CisK
KyAgICBpbXBsIFdvcmtJdGVtIGZvciBUZXN0SXRlbSB7CisgICAgICAgIHR5cGUgUG9pbnRlciA9
IEFyYzxTZWxmPjsKKyAgICAgICAgZm4gcnVuKF90aGlzOiBBcmM8U2VsZj4pIHt9CisgICAgfQor
CisgICAgLy8vIEhlbHBlciB0byBnZXQgQXJjIHN0cm9uZyBjb3VudCBmb3IgdmVyaWZpY2F0aW9u
IGluIHRlc3RzLgorICAgIGZuIGdldF9hcmNfY291bnQ8VDogU2l6ZWQ+KGFyYzogJkFyYzxUPikg
LT4gaTMyIHsKKyAgICAgICAgLy8gU0FGRVRZOiBBcmNJbm5lciBoYXMgcmVmY291bnQgYXMgaXRz
IGZpcnN0IGZpZWxkLiBBcmMgcG9pbnRzIHRvIGRhdGEgYXQgREFUQV9PRkZTRVQuCisgICAgICAg
IHVuc2FmZSB7CisgICAgICAgICAgICBsZXQgcHRyID0gQXJjOjphc19wdHIoYXJjKTsKKyAgICAg
ICAgICAgIGxldCBpbm5lcl9wdHIgPSAocHRyIGFzICpjb25zdCB1OCkuc3ViKEFyYzo6PFQ+OjpE
QVRBX09GRlNFVCk7CisgICAgICAgICAgICBsZXQgcmVmY291bnRfcHRyID0gaW5uZXJfcHRyIGFz
ICpjb25zdCBpMzI7CisgICAgICAgICAgICBjb3JlOjpwdHI6OnJlYWRfdm9sYXRpbGUocmVmY291
bnRfcHRyKQorICAgICAgICB9CisgICAgfQorCisgICAgI1t0ZXN0XQorICAgIGZuIHRlc3Rfd29y
a19jYW5jZWxfcmVjbGFpbSgpIHsKKyAgICAgICAgbGV0IGl0ZW0gPSBBcmM6OnBpbl9pbml0KAor
ICAgICAgICAgICAgcGluX2luaXQhKFRlc3RJdGVtIHsKKyAgICAgICAgICAgICAgICB3b3JrIDwt
IG5ld193b3JrISgiVGVzdEl0ZW06OndvcmsiKSwKKyAgICAgICAgICAgICAgICB2YWx1ZTogNDIs
CisgICAgICAgICAgICB9KSwKKyAgICAgICAgICAgIEdGUF9LRVJORUwsCisgICAgICAgICkKKyAg
ICAgICAgLmV4cGVjdCgiRmFpbGVkIHRvIGFsbG9jYXRlIFRlc3RJdGVtIik7CisKKyAgICAgICAg
bGV0IGluaXRpYWxfY291bnQgPSBnZXRfYXJjX2NvdW50KCZpdGVtKTsKKworICAgICAgICAvLyBF
bnF1ZXVlCisgICAgICAgIGxldCBfID0gc3lzdGVtKCkuZW5xdWV1ZShpdGVtLmNsb25lKCkpOwor
CisgICAgICAgIC8vIENhbmNlbCBhbmQgUmVjbGFpbSAoaWYgaXQgd2FzIHBlbmRpbmcpCisgICAg
ICAgIGlmIGxldCBTb21lKHJlY2xhaW1lZCkgPSBpdGVtLndvcmsuY2FuY2VsKCkgeworICAgICAg
ICAgICAgYXNzZXJ0IShnZXRfYXJjX2NvdW50KCZpdGVtKSA9PSBpbml0aWFsX2NvdW50ICsgMSk7
CisgICAgICAgICAgICBkcm9wKHJlY2xhaW1lZCk7CisgICAgICAgICAgICBhc3NlcnQhKGdldF9h
cmNfY291bnQoJml0ZW0pID09IGluaXRpYWxfY291bnQpOworICAgICAgICB9CisgICAgfQorCisg
ICAgI1t0ZXN0XQorICAgIGZuIHRlc3Rfd29ya19jYW5jZWxfc3luY19yZWNsYWltKCkgeworICAg
ICAgICBsZXQgaXRlbSA9IEFyYzo6cGluX2luaXQoCisgICAgICAgICAgICBwaW5faW5pdCEoVGVz
dEl0ZW0geworICAgICAgICAgICAgICAgIHdvcmsgPC0gbmV3X3dvcmshKCJUZXN0SXRlbTo6d29y
ayIpLAorICAgICAgICAgICAgICAgIHZhbHVlOiA0MiwKKyAgICAgICAgICAgIH0pLAorICAgICAg
ICAgICAgR0ZQX0tFUk5FTCwKKyAgICAgICAgKQorICAgICAgICAuZXhwZWN0KCJGYWlsZWQgdG8g
YWxsb2NhdGUgVGVzdEl0ZW0iKTsKKworICAgICAgICBsZXQgaW5pdGlhbF9jb3VudCA9IGdldF9h
cmNfY291bnQoJml0ZW0pOworCisgICAgICAgIC8vIEVucXVldWUKKyAgICAgICAgbGV0IF8gPSBz
eXN0ZW0oKS5lbnF1ZXVlKGl0ZW0uY2xvbmUoKSk7CisKKyAgICAgICAgLy8gQ2FuY2VsIFN5bmMg
YW5kIFJlY2xhaW0KKyAgICAgICAgaWYgbGV0IFNvbWUocmVjbGFpbWVkKSA9IGl0ZW0ud29yay5j
YW5jZWxfc3luYygpIHsKKyAgICAgICAgICAgIGFzc2VydCEoZ2V0X2FyY19jb3VudCgmaXRlbSkg
PT0gaW5pdGlhbF9jb3VudCArIDEpOworICAgICAgICAgICAgZHJvcChyZWNsYWltZWQpOworICAg
ICAgICAgICAgYXNzZXJ0IShnZXRfYXJjX2NvdW50KCZpdGVtKSA9PSBpbml0aWFsX2NvdW50KTsK
KyAgICAgICAgfQorICAgIH0KKworICAgICNbdGVzdF0KKyAgICBmbiB0ZXN0X3dvcmtfc3RyZXNz
X2VucXVldWVfY2FuY2VsKCkgeworICAgICAgICBsZXQgaXRlbSA9IEFyYzo6cGluX2luaXQoCisg
ICAgICAgICAgICBwaW5faW5pdCEoVGVzdEl0ZW0geworICAgICAgICAgICAgICAgIHdvcmsgPC0g
bmV3X3dvcmshKCJUZXN0SXRlbTo6d29yayIpLAorICAgICAgICAgICAgICAgIHZhbHVlOiA0MiwK
KyAgICAgICAgICAgIH0pLAorICAgICAgICAgICAgR0ZQX0tFUk5FTCwKKyAgICAgICAgKQorICAg
ICAgICAuZXhwZWN0KCJGYWlsZWQgdG8gYWxsb2NhdGUgVGVzdEl0ZW0iKTsKKworICAgICAgICBm
b3IgXyBpbiAwLi4xMDAgeworICAgICAgICAgICAgbGV0IF8gPSBzeXN0ZW0oKS5lbnF1ZXVlKGl0
ZW0uY2xvbmUoKSk7CisgICAgICAgICAgICBsZXQgXyA9IGl0ZW0ud29yay5jYW5jZWxfc3luYygp
OworICAgICAgICB9CisKKyAgICAgICAgYXNzZXJ0X2VxIShnZXRfYXJjX2NvdW50KCZpdGVtKSwg
MSk7CisgICAgfQorfQpkaWZmIC0tZ2l0IGEvc2FtcGxlcy9ydXN0L01ha2VmaWxlIGIvc2FtcGxl
cy9ydXN0L01ha2VmaWxlCmluZGV4IDZjMGFhYTU4Y2NjYy4uMWMzM2NlMWMxNjZhIDEwMDY0NAot
LS0gYS9zYW1wbGVzL3J1c3QvTWFrZWZpbGUKKysrIGIvc2FtcGxlcy9ydXN0L01ha2VmaWxlCkBA
IC0yMCwzICsyMCw1IEBAIG9iai0kKENPTkZJR19TQU1QTEVfUlVTVF9TT0MpCQkJKz0gcnVzdF9z
b2MubwogcnVzdF9wcmludC15IDo9IHJ1c3RfcHJpbnRfbWFpbi5vIHJ1c3RfcHJpbnRfZXZlbnRz
Lm8KIAogc3ViZGlyLSQoQ09ORklHX1NBTVBMRV9SVVNUX0hPU1RQUk9HUykJCSs9IGhvc3Rwcm9n
cworCitvYmotbSArPSBydXN0X3dvcmtxdWV1ZV90ZXN0Lm8KZGlmZiAtLWdpdCBhL3NhbXBsZXMv
cnVzdC9ydXN0X3dvcmtxdWV1ZV90ZXN0LnJzIGIvc2FtcGxlcy9ydXN0L3J1c3Rfd29ya3F1ZXVl
X3Rlc3QucnMKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMDAwLi5mNzdhOGNi
OWY0YmYKLS0tIC9kZXYvbnVsbAorKysgYi9zYW1wbGVzL3J1c3QvcnVzdF93b3JrcXVldWVfdGVz
dC5ycwpAQCAtMCwwICsxLDIwMyBAQAorLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0y
LjAKKworLy8hIFJvYnVzdCBzdHJlc3MgdGVzdCBmb3IgUnVzdCB3b3JrcXVldWUgQVBJLgorCit1
c2Uga2VybmVsOjpwcmVsdWRlOjoqOwordXNlIGtlcm5lbDo6c3luYzo6QXJjOwordXNlIGtlcm5l
bDo6dGltZTo6bXNlY3NfdG9famlmZmllczsKK3VzZSBrZXJuZWw6OndvcmtxdWV1ZTo6e3NlbGYs
IG5ld193b3JrLCBXb3JrLCBXb3JrSXRlbX07CisKKyNbcGluX2RhdGFdCitzdHJ1Y3QgVGVzdEl0
ZW0geworICAgICNbcGluXQorICAgIHdvcms6IFdvcms8VGVzdEl0ZW0+LAorICAgIHZhbHVlOiBp
MzIsCisgICAgI1twaW5dCisgICAgZGVsYXllZF93b3JrOiB3b3JrcXVldWU6OkRlbGF5ZWRXb3Jr
PFRlc3RJdGVtPiwKK30KKwora2VybmVsOjppbXBsX2hhc193b3JrISB7CisgICAgaW1wbCBIYXNX
b3JrPFNlbGY+IGZvciBUZXN0SXRlbSB7IHNlbGYud29yayB9Cit9CisKKy8vIFNBRkVUWTogVGhl
IGBkZWxheWVkX3dvcmtgIGZpZWxkIGlzIGF0IGEgZml4ZWQgb2Zmc2V0IGFuZCBpcyB2YWxpZCBm
b3IgdGhlIGxpZmV0aW1lIG9mCisvLyBgVGVzdEl0ZW1gLgordW5zYWZlIGltcGwgd29ya3F1ZXVl
OjpIYXNEZWxheWVkV29yazxTZWxmPiBmb3IgVGVzdEl0ZW0ge30KKworaW1wbCBXb3JrSXRlbSBm
b3IgVGVzdEl0ZW0geworICAgIHR5cGUgUG9pbnRlciA9IEFyYzxUZXN0SXRlbT47CisKKyAgICBm
biBydW4odGhpczogQXJjPFRlc3RJdGVtPikgeworICAgICAgICBwcl9pbmZvISgKKyAgICAgICAg
ICAgICJSdXN0IHdvcmtxdWV1ZSB0ZXN0OiBXb3JrIGl0ZW0gcnVubmluZyAodmFsdWU6IHt9KVxu
IiwKKyAgICAgICAgICAgIHRoaXMudmFsdWUKKyAgICAgICAgKTsKKyAgICB9Cit9CisKKy8vLyBI
ZWxwZXIgdG8gZ2V0IEFyYyBzdHJvbmcgY291bnQgZm9yIHZlcmlmaWNhdGlvbiBpbiB0ZXN0cy4K
Ky8vLyBUaGlzIHVzZXMgaW50ZXJuYWwgbGF5b3V0IGtub3dsZWRnZSBvZiBBcmMuCitmbiBnZXRf
YXJjX2NvdW50PFQ6IFNpemVkPihhcmM6ICZBcmM8VD4pIC0+IGkzMiB7CisgICAgLy8gU0FGRVRZ
OiBBcmNJbm5lciBoYXMgcmVmY291bnQgYXMgaXRzIGZpcnN0IGZpZWxkLiBBcmMgcG9pbnRzIHRv
IGRhdGEgYXQgREFUQV9PRkZTRVQuCisgICAgdW5zYWZlIHsKKyAgICAgICAgbGV0IHB0ciA9IEFy
Yzo6YXNfcHRyKGFyYyk7CisgICAgICAgIGxldCBpbm5lcl9wdHIgPSAocHRyIGFzICpjb25zdCB1
OCkuc3ViKEFyYzo6PFQ+OjpEQVRBX09GRlNFVCk7CisgICAgICAgIC8vIFRoZSBmaXJzdCBmaWVs
ZCBvZiBBcmNJbm5lciBpcyBSZWZjb3VudCwgd2hpY2ggaXMgYSB0cmFuc3BhcmVudCB3cmFwcGVy
IGFyb3VuZAorICAgICAgICAvLyByZWZjb3VudF90LiBJbiB0aGUga2VybmVsLCByZWZjb3VudF90
IGlzIGFuIGF0b21pY190IChpMzIpLgorICAgICAgICBsZXQgcmVmY291bnRfcHRyID0gaW5uZXJf
cHRyIGFzICpjb25zdCBpMzI7CisgICAgICAgIC8vIFdlIHVzZSBhIHJlbGF4ZWQgbG9hZCB0byBn
ZXQgdGhlIGN1cnJlbnQgdmFsdWUuCisgICAgICAgIGNvcmU6OnB0cjo6cmVhZF92b2xhdGlsZShy
ZWZjb3VudF9wdHIpCisgICAgfQorfQorCitzdHJ1Y3QgUnVzdFdvcmtxdWV1ZVRlc3Q7CisKK2lt
cGwga2VybmVsOjpNb2R1bGUgZm9yIFJ1c3RXb3JrcXVldWVUZXN0IHsKKyAgICBmbiBpbml0KF9t
b2R1bGU6ICYnc3RhdGljIFRoaXNNb2R1bGUpIC0+IFJlc3VsdDxTZWxmPiB7CisgICAgICAgIHBy
X2luZm8hKCJSdXN0IHdvcmtxdWV1ZSB0ZXN0OiBzdGFydGluZyByb2J1c3QgdmVyaWZpY2F0aW9u
XG4iKTsKKworICAgICAgICAvLyAxLiBCYXNpYyBMaWZlY3ljbGUgd2l0aCBSZWZjb3VudCBWYWxp
ZGF0aW9uCisgICAgICAgIHsKKyAgICAgICAgICAgIGxldCB0ZXN0X2l0ZW0gPSBBcmM6OnBpbl9p
bml0KAorICAgICAgICAgICAgICAgIHBpbl9pbml0IShUZXN0SXRlbSB7CisgICAgICAgICAgICAg
ICAgICAgIHdvcmsgPC0gbmV3X3dvcmshKCJUZXN0SXRlbTo6d29yayIpLAorICAgICAgICAgICAg
ICAgICAgICB2YWx1ZTogNDIsCisgICAgICAgICAgICAgICAgICAgIGRlbGF5ZWRfd29yayA8LSB3
b3JrcXVldWU6Om5ld19kZWxheWVkX3dvcmshKCJUZXN0SXRlbTo6ZGVsYXllZF93b3JrIiksCisg
ICAgICAgICAgICAgICAgfSksCisgICAgICAgICAgICAgICAgR0ZQX0tFUk5FTCwKKyAgICAgICAg
ICAgICk/OworCisgICAgICAgICAgICBsZXQgaW5pdGlhbF9jb3VudCA9IGdldF9hcmNfY291bnQo
JnRlc3RfaXRlbSk7CisgICAgICAgICAgICBwcl9pbmZvISgiSW5pdGlhbCBBcmMgc3Ryb25nIGNv
dW50OiB7fVxuIiwgaW5pdGlhbF9jb3VudCk7CisKKyAgICAgICAgICAgIC8vIEVucXVldWUKKyAg
ICAgICAgICAgIGxldCBlbnF1ZXVlZF9pdGVtID0gdGVzdF9pdGVtLmNsb25lKCk7CisKKyAgICAg
ICAgICAgIGlmIGxldCBFcnIocmV0dXJuZWRfaXRlbSkgPSB3b3JrcXVldWU6OnN5c3RlbSgpLmVu
cXVldWUoZW5xdWV1ZWRfaXRlbSkgeworICAgICAgICAgICAgICAgIHByX3dhcm4hKCJXb3JrIGFs
cmVhZHkgcGVuZGluZywgdW5leHBlY3RlZCFcbiIpOworICAgICAgICAgICAgICAgIGxldCBfID0g
cmV0dXJuZWRfaXRlbTsKKyAgICAgICAgICAgIH0gZWxzZSB7CisgICAgICAgICAgICAgICAgcHJf
aW5mbyEoCisgICAgICAgICAgICAgICAgICAgICJXb3JrIGVucXVldWVkIHN1Y2Nlc3NmdWxseS4g
U3Ryb25nIGNvdW50OiB7fVxuIiwKKyAgICAgICAgICAgICAgICAgICAgZ2V0X2FyY19jb3VudCgm
dGVzdF9pdGVtKQorICAgICAgICAgICAgICAgICk7CisgICAgICAgICAgICB9CisKKyAgICAgICAg
ICAgIC8vIENhbmNlbCBpbW1lZGlhdGVseSAoYmVzdCBlZmZvcnQpCisgICAgICAgICAgICBpZiBs
ZXQgU29tZShyZWNsYWltZWQpID0gdGVzdF9pdGVtLndvcmsuY2FuY2VsKCkgeworICAgICAgICAg
ICAgICAgIGxldCBjb3VudF9hZnRlcl9jYW5jZWwgPSBnZXRfYXJjX2NvdW50KCZ0ZXN0X2l0ZW0p
OworICAgICAgICAgICAgICAgIHByX2luZm8hKAorICAgICAgICAgICAgICAgICAgICAiU3VjY2Vz
czogV29yayBjYW5jZWxsZWQgYW5kIEFyYyByZWNsYWltZWQuIFN0cm9uZyBjb3VudDoge31cbiIs
CisgICAgICAgICAgICAgICAgICAgIGNvdW50X2FmdGVyX2NhbmNlbAorICAgICAgICAgICAgICAg
ICk7CisKKyAgICAgICAgICAgICAgICAvLyBWQUxJREFUSU9OOiBSZWNsYW1hdGlvbiBtdXN0IHJl
c3RvcmUgdGhlIHJlZmNvdW50IChtaW51cyB0aGUgY2xvbmUgd2UganVzdAorICAgICAgICAgICAg
ICAgIC8vIHJlY2xhaW1lZCkKKyAgICAgICAgICAgICAgICBpZiBjb3VudF9hZnRlcl9jYW5jZWwg
IT0gaW5pdGlhbF9jb3VudCArIDEgeworICAgICAgICAgICAgICAgICAgICBwcl9lcnIhKAorICAg
ICAgICAgICAgICAgICAgICAgICAgIkVSUk9SOiBSZWZjb3VudCBtaXNtYXRjaCBhZnRlciBjYW5j
ZWwhIEV4cGVjdGVkIHt9LCBnb3Qge31cbiIsCisgICAgICAgICAgICAgICAgICAgICAgICBpbml0
aWFsX2NvdW50ICsgMSwKKyAgICAgICAgICAgICAgICAgICAgICAgIGNvdW50X2FmdGVyX2NhbmNl
bAorICAgICAgICAgICAgICAgICAgICApOworICAgICAgICAgICAgICAgICAgICByZXR1cm4gRXJy
KEVOWElPKTsKKyAgICAgICAgICAgICAgICB9CisgICAgICAgICAgICAgICAgZHJvcChyZWNsYWlt
ZWQpOworICAgICAgICAgICAgICAgIGlmIGdldF9hcmNfY291bnQoJnRlc3RfaXRlbSkgIT0gaW5p
dGlhbF9jb3VudCB7CisgICAgICAgICAgICAgICAgICAgIHByX2VyciEoCisgICAgICAgICAgICAg
ICAgICAgICAgICAiRVJST1I6IFJlZmNvdW50IG1pc21hdGNoIGFmdGVyIGRyb3AhIEV4cGVjdGVk
IHt9LCBnb3Qge31cbiIsCisgICAgICAgICAgICAgICAgICAgICAgICBpbml0aWFsX2NvdW50LAor
ICAgICAgICAgICAgICAgICAgICAgICAgZ2V0X2FyY19jb3VudCgmdGVzdF9pdGVtKQorICAgICAg
ICAgICAgICAgICAgICApOworICAgICAgICAgICAgICAgICAgICByZXR1cm4gRXJyKEVOWElPKTsK
KyAgICAgICAgICAgICAgICB9CisgICAgICAgICAgICB9IGVsc2UgeworICAgICAgICAgICAgICAg
IHByX2luZm8hKCJXb3JrIGFscmVhZHkgcnVubmluZyBvciBmaW5pc2hlZCwgY291bGQgbm90IHJl
Y2xhaW0gdmlhIGNhbmNlbCgpLlxuIik7CisgICAgICAgICAgICB9CisgICAgICAgIH0KKworICAg
ICAgICAvLyAyLiBTdHJlc3MgVGVzdGluZzogRW5xdWV1ZS9DYW5jZWwgU3luYyBMb29wCisgICAg
ICAgIHsKKyAgICAgICAgICAgIHByX2luZm8hKCJTdGFydGluZyBzdHJlc3MgdGVzdCAoMTAwMCBp
dGVyYXRpb25zKS4uLlxuIik7CisgICAgICAgICAgICBsZXQgdGVzdF9pdGVtID0gQXJjOjpwaW5f
aW5pdCgKKyAgICAgICAgICAgICAgICBwaW5faW5pdCEoVGVzdEl0ZW0geworICAgICAgICAgICAg
ICAgICAgICB3b3JrIDwtIG5ld193b3JrISgiVGVzdEl0ZW06OndvcmsiKSwKKyAgICAgICAgICAg
ICAgICAgICAgdmFsdWU6IDk5LAorICAgICAgICAgICAgICAgICAgICBkZWxheWVkX3dvcmsgPC0g
d29ya3F1ZXVlOjpuZXdfZGVsYXllZF93b3JrISgiVGVzdEl0ZW06OmRlbGF5ZWRfd29yayIpLAor
ICAgICAgICAgICAgICAgIH0pLAorICAgICAgICAgICAgICAgIEdGUF9LRVJORUwsCisgICAgICAg
ICAgICApPzsKKworICAgICAgICAgICAgZm9yIGkgaW4gMC4uMTAwMCB7CisgICAgICAgICAgICAg
ICAgbGV0IF8gPSB3b3JrcXVldWU6OnN5c3RlbSgpLmVucXVldWUodGVzdF9pdGVtLmNsb25lKCkp
OworICAgICAgICAgICAgICAgIC8vIFVzZSBjYW5jZWxfc3luYyB0byBlbnN1cmUgZGV0ZXJtaW5p
c20gZm9yIHRoZSBuZXh0IGl0ZXJhdGlvbgorICAgICAgICAgICAgICAgIGxldCBfID0gdGVzdF9p
dGVtLndvcmsuY2FuY2VsX3N5bmMoKTsKKworICAgICAgICAgICAgICAgIGlmIGkgJSAyNTAgPT0g
MCB7CisgICAgICAgICAgICAgICAgICAgIHByX2luZm8hKCJTdHJlc3MgdGVzdCBwcm9ncmVzczog
e30vMTAwMFxuIiwgaSk7CisgICAgICAgICAgICAgICAgfQorICAgICAgICAgICAgfQorCisgICAg
ICAgICAgICBpZiBnZXRfYXJjX2NvdW50KCZ0ZXN0X2l0ZW0pICE9IDEgeworICAgICAgICAgICAg
ICAgIHByX2VyciEoCisgICAgICAgICAgICAgICAgICAgICJFUlJPUjogUmVmY291bnQgbGVhayBk
ZXRlY3RlZCBhZnRlciBzdHJlc3MgdGVzdCEgY291bnQ6IHt9XG4iLAorICAgICAgICAgICAgICAg
ICAgICBnZXRfYXJjX2NvdW50KCZ0ZXN0X2l0ZW0pCisgICAgICAgICAgICAgICAgKTsKKyAgICAg
ICAgICAgICAgICByZXR1cm4gRXJyKEVOWElPKTsKKyAgICAgICAgICAgIH0gZWxzZSB7CisgICAg
ICAgICAgICAgICAgcHJfaW5mbyEoIlN0cmVzcyB0ZXN0IGNvbXBsZXRlZCBzdWNjZXNzZnVsbHku
IE5vIHJlZmNvdW50IGxlYWtzLlxuIik7CisgICAgICAgICAgICB9CisgICAgICAgIH0KKworICAg
ICAgICAvLyAzLiBEZWxheWVkIFdvcmsgQ2FuY2VsbGF0aW9uIFRlc3QKKyAgICAgICAgeworICAg
ICAgICAgICAgbGV0IHRlc3RfaXRlbSA9IEFyYzo6cGluX2luaXQoCisgICAgICAgICAgICAgICAg
cGluX2luaXQhKFRlc3RJdGVtIHsKKyAgICAgICAgICAgICAgICAgICAgd29yayA8LSBuZXdfd29y
ayEoIlRlc3RJdGVtOjp3b3JrIiksCisgICAgICAgICAgICAgICAgICAgIHZhbHVlOiA3LAorICAg
ICAgICAgICAgICAgICAgICBkZWxheWVkX3dvcmsgPC0gd29ya3F1ZXVlOjpuZXdfZGVsYXllZF93
b3JrISgiVGVzdEl0ZW06OmRlbGF5ZWRfd29yayIpLAorICAgICAgICAgICAgICAgIH0pLAorICAg
ICAgICAgICAgICAgIEdGUF9LRVJORUwsCisgICAgICAgICAgICApPzsKKworICAgICAgICAgICAg
Ly8gU2NoZWR1bGUgd2l0aCBhIGxvbmcgZGVsYXkKKyAgICAgICAgICAgIGxldCBfID0gd29ya3F1
ZXVlOjpzeXN0ZW0oKS5lbnF1ZXVlX2RlbGF5ZWQodGVzdF9pdGVtLmNsb25lKCksIG1zZWNzX3Rv
X2ppZmZpZXMoNTAwMCkpOworCisgICAgICAgICAgICBpZiB0ZXN0X2l0ZW0uZGVsYXllZF93b3Jr
LmlzX3BlbmRpbmcoKSB7CisgICAgICAgICAgICAgICAgcHJfaW5mbyEoIkRlbGF5ZWQgd29yayBp
cyBwZW5kaW5nIGFzIGV4cGVjdGVkLlxuIik7CisgICAgICAgICAgICB9CisKKyAgICAgICAgICAg
IGlmIGxldCBTb21lKHJlY2xhaW1lZCkgPSB0ZXN0X2l0ZW0uZGVsYXllZF93b3JrLmNhbmNlbCgp
IHsKKyAgICAgICAgICAgICAgICBwcl9pbmZvISgiU3VjY2VzczogRGVsYXllZCB3b3JrIHJlY2xh
aW1lZC4gTm8gbGVhay5cbiIpOworICAgICAgICAgICAgICAgIGRyb3AocmVjbGFpbWVkKTsKKyAg
ICAgICAgICAgIH0gZWxzZSB7CisgICAgICAgICAgICAgICAgcHJfZXJyISgiRXJyb3I6IENvdWxk
IG5vdCBjYW5jZWwgZGVsYXllZCB3b3JrIHdpdGggNXMgZGVsYXkhXG4iKTsKKyAgICAgICAgICAg
ICAgICByZXR1cm4gRXJyKEVOWElPKTsKKyAgICAgICAgICAgIH0KKworICAgICAgICAgICAgaWYg
Z2V0X2FyY19jb3VudCgmdGVzdF9pdGVtKSAhPSAxIHsKKyAgICAgICAgICAgICAgICBwcl9lcnIh
KAorICAgICAgICAgICAgICAgICAgICAiRVJST1I6IFJlZmNvdW50IGxlYWsgYWZ0ZXIgZGVsYXll
ZCBjYW5jZWwhIGNvdW50OiB7fVxuIiwKKyAgICAgICAgICAgICAgICAgICAgZ2V0X2FyY19jb3Vu
dCgmdGVzdF9pdGVtKQorICAgICAgICAgICAgICAgICk7CisgICAgICAgICAgICAgICAgcmV0dXJu
IEVycihFTlhJTyk7CisgICAgICAgICAgICB9CisgICAgICAgIH0KKworICAgICAgICBwcl9pbmZv
ISgiUnVzdCB3b3JrcXVldWUgdGVzdDogYWxsIHJvYnVzdCBjaGVja3MgcGFzc2VkXG4iKTsKKyAg
ICAgICAgT2soUnVzdFdvcmtxdWV1ZVRlc3QpCisgICAgfQorfQorCitpbXBsIERyb3AgZm9yIFJ1
c3RXb3JrcXVldWVUZXN0IHsKKyAgICBmbiBkcm9wKCZtdXQgc2VsZikgeworICAgICAgICBwcl9p
bmZvISgiUnVzdCB3b3JrcXVldWUgdGVzdDogZXhpdFxuIik7CisgICAgfQorfQorCittb2R1bGUh
IHsKKyAgICB0eXBlOiBSdXN0V29ya3F1ZXVlVGVzdCwKKyAgICBuYW1lOiAicnVzdF93b3JrcXVl
dWVfdGVzdCIsCisgICAgYXV0aG9yczogWyJBYWthc2ggQm9sbGluZW5pIl0sCisgICAgZGVzY3Jp
cHRpb246ICJSb2J1c3Qgc3RyZXNzIHRlc3QgZm9yIFJ1c3Qgd29ya3F1ZXVlIEFQSSIsCisgICAg
bGljZW5zZTogIkdQTCIsCit9Ci0tIAoyLjQzLjAKCg==

--_004_PN2P287MB2978F92A42E4EA8B8A0C37DDF550APN2P287MB2978INDP_--

Received: from outbound.pv.icloud.com (p-west1-cluster6-host12-snip4-5.eps.apple.com [57.103.67.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA73B378D9D
	for <rust-for-linux@vger.kernel.org>; Fri, 30 Jan 2026 12:35:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.67.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769776506; cv=none; b=GmlWB74R1kEOXmwl1LTxPjqPdSjcDIRCBv3zxjocpEwvvIVSlzmj1dEVIXSxtaQ2rZae6qjbrFXFELUvL9t+3LfCdKgDg2JJe7Q277LqvkKJ6G9QU61SzgYTsCkHoaFBW+CJeTvRUAz//SOd9dYq5EdCf6wxMeifBDaLbxXD3Rs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769776506; c=relaxed/simple;
	bh=cevHoQfwyuJWbwR+TNBR/26Wh04ew/K+L7WGC8DzJP0=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=oj4Vk37FbE4aDHWa/lfCO279YBGI0WD791y9hkKxgWcnGTj1qO5/koOyeqaFJix3ukV8WHvNKVukoJts39OP9FTEA9AbwMZLAZLh7yQh2FyV0KhSLquJF9dfYkVHkJQipg6e6nu3LKMs037L5i+pM57zyN+CIklDdVvnzinneTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aliasing.net; spf=pass smtp.mailfrom=aliasing.net; dkim=pass (2048-bit key) header.d=aliasing.net header.i=@aliasing.net header.b=yJ0ycLvb; arc=none smtp.client-ip=57.103.67.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aliasing.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aliasing.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aliasing.net header.i=@aliasing.net header.b="yJ0ycLvb"
Received: from outbound.pv.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-1a-60-percent-11 (Postfix) with ESMTPS id 7CDBF18002A8;
	Fri, 30 Jan 2026 12:35:01 +0000 (UTC)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aliasing.net; s=sig1; t=1769776504; x=1772368504; bh=cevHoQfwyuJWbwR+TNBR/26Wh04ew/K+L7WGC8DzJP0=; h=Date:Message-Id:To:Subject:From:Mime-Version:Content-Type:x-icloud-hme; b=yJ0ycLvbq8FdNbNR2uXONsc3mLyOGGOIDZqfIylqxePrKhbIxpK2HFmppndafKu5X2Y2PiJZNz/ORf3GrW1zXtYydfUSgyhZNoGSqSs84iWqDlsQYycd5JbMEq/PT1jAepwfcHGzLSaqNB/uk9xE7ocecneG7WEEWAAkmv+9ldgv7QIO3qch7TLMU5q0T0O0y/0mmlYfWK4l0WN+uC+sUTbVtwOY3CgVISIN6xgUUyqasdnxelNYozRfksgGAGk6MDx1Z5LZY4bXt29hyqBE0MkSkq89cgu0DCflhrccnsiOOkTZU5BEEz6gHVBkMDepBkC5a4jKs0Ca1oogEm3GQQ==
mail-alias-created-date: 1769500909675
Received: from localhost (unknown [17.56.9.36])
	by p00-icloudmta-asmtp-us-west-1a-60-percent-11 (Postfix) with ESMTPSA id 577261801218;
	Fri, 30 Jan 2026 12:34:59 +0000 (UTC)
Date: Fri, 30 Jan 2026 21:34:57 +0900 (JST)
Message-Id: <20260130.213457.682218231145284582.fujita@bee>
To: miguel.ojeda.sandonis@gmail.com
Cc: fujita.tomonori@gmail.com, alex.gaynor@gmail.com, ojeda@kernel.org,
 a.hindborg@kernel.org, aliceryhl@google.com, boqun.feng@gmail.com,
 bjorn3_gh@protonmail.com, dakr@kernel.org, gary@garyguo.net,
 lossin@kernel.org, rust-for-linux@vger.kernel.org, tmgross@umich.edu
Subject: Re: [PATCH v3 0/2] Add support for print exactly once
From: FUJITA Tomonori <tomo@aliasing.net>
In-Reply-To: <CANiq72k7qXoz3wcHqjNK29ZZ9gTdkmpwX7oqxgV9Rq6uGRwugw@mail.gmail.com>
References: <20251117002452.4068692-1-fujita.tomonori@gmail.com>
	<CANiq72k7qXoz3wcHqjNK29ZZ9gTdkmpwX7oqxgV9Rq6uGRwugw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=utf-8
Content-Transfer-Encoding: base64
X-Authority-Info-Out: v=2.4 cv=DsJbOW/+ c=1 sm=1 tr=0 ts=697ca577
 cx=c_apl:c_apl_out:c_pps a=azHRBMxVc17uSn+fyuI/eg==:117
 a=azHRBMxVc17uSn+fyuI/eg==:17 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8
 a=zV1oc8Cxy4iWas2m4qAA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: CiFctLcaPfxxzd2Snv0ivM4OeOyNFYDR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMwMDEwMyBTYWx0ZWRfX0AbrFZIqFjVo
 oyrdVYUN6tvlZ79Ih2Th0pdh6GkNetAbGmmv8wzBX3JjD/08f3mEBuYd518MAflCcLIamogohC1
 AuDAlQHegmpLP0JxO788JxnrRR+22HR0f4OoI55Qt5DtfDjTbJ67f4ktpET0+osQSpdCHgRDrsG
 eCbJgGxkV3bupLgvPsfgxFmdSNjA5gGf3n0VUVxNqH3U+FLgHyvgqKk8Er9nffXfFxTr5eb1BMA
 o8bBnI6O9mdPly+yjNNF4lc0dsM1HQ53ds1hdtJfsYZA5hz0Je3YSpnKAbe3FJXUOTDxim6KRW4
 96Jxf+RW4bFbLgF8bcK4ppK7+tR6M2B3J2HgWPiqs0lLTXRX0RTBUzrmUTzV8Y=
X-Proofpoint-GUID: CiFctLcaPfxxzd2Snv0ivM4OeOyNFYDR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-30_01,2026-01-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxscore=0 mlxlogscore=874 bulkscore=0 adultscore=0 suspectscore=0
 phishscore=0 malwarescore=0 clxscore=1030 lowpriorityscore=0 classifier=spam
 authscore=0 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601300103
X-JNJ: AAAAAAABVLnpyqbsjMjtsE7fOKk1LTkgRys6aYBGoUWCz3vok7B963XPyHEurj7w0rev/hau0C+q+vzfM77Lw1Gdvr5ZHxCO8ZXC2VB9hq0Q4GKB0QNeHju7iq8RqRdvdaWrKhl3FkvYdZVkidicujIzr/9Qib/bsEoI8ZU1+PSfqu0EjHH1sBYX/HAkiDAkX29gdjYj2FvKbs8Y1odEIa4ydq5XK9EFv0YBXnRmFMHvuuWIhJKmmqeYpsqsSz2fx4WSbJIp4mjykl6USaWY82UNSYWp7Q5w6HSsf0vXUpcDgx2eLun2ihELWkt/db2bF4bIrpkYGm5J4tEkiEVi7Lo0vCOr40E5T9hknTgsH9hpJPNul4EqsSjr5K2ZMEdOLjIpxu/P8BeO5srJDfIMivWRjJEh1i8vwVX/yQyNVillIpczH67P/gaLzLPjc5X9WbhD8dKlA65nlXk9q3XEYUcud+rTHbfCkbL3o8lWL+zDOaxfGzvakkjwk1zRTI82hfea1Uc9vNIlc0Kkk1CvY+dbM8ZrIBdJNKQBAoJ2Mn2eGsn+tC9JNkQos6nk9IwtBvGEPMzx43G3ysYsigPOtqSuMGSFGqb1xwhGGfsll2S1ppzwcpcBl2yXTRmLyzdX1McY0fU/IGy7olrXmg3EEfktchH2Kyvlt217naEzAtcWk1SMCpUp7+wdu60kSeSoWhR288rhYJ46iFGbg3kGLKIV/axOjFgy9km84AxEOjzLmtmN6Vwr84cyG+LTw+7O5SHL9Gsi2OHr/mevfJVbKwzTWg==

T24gRnJpLCAzMCBKYW4gMjAyNiAwNTo1MTo0MiArMDEwMA0KTWlndWVsIE9qZWRhIDxtaWd1ZWwu
b2plZGEuc2FuZG9uaXNAZ21haWwuY29tPiB3cm90ZToNCg0KPiBPbiBNb24sIE5vdiAxNywgMjAy
NSBhdCAxOjI14oCvQU0gRlVKSVRBIFRvbW9ub3JpDQo+IDxmdWppdGEudG9tb25vcmlAZ21haWwu
Y29tPiB3cm90ZToNCj4+DQo+PiBUaGlzIGFkZHMgdGhlIFJ1c3QgZXF1aXZhbGVudCBvZiB0aGUg
QydzIERPX09OQ0VfTElURSBhbmQgcHJfKl9vbmNlDQo+PiBtYWNyb3MuDQo+Pg0KPj4gQSBwcm9w
b3NhbCBmb3IgdGhpcyBmZWF0dXJlIHdhcyBtYWRlIGluIHRoZSBwYXN0IFsxXSwgYnV0IGl0IGRp
ZG4ndA0KPj4gcmVhY2ggY29uc2Vuc3VzIG9uIHRoZSBpbXBsZW1lbnRhdGlvbiBhbmQgd2Fzbid0
IG1lcmdlZC4NCj4+DQo+PiBVbmxpa2UgdGhlIHByZXZpb3VzIHByb3Bvc2FsLCB0aGlzIGltcGxl
bWVudHMgdGhlIEMncyBET19PTkNFX0xJVEUNCj4+IG1lY2hhbmlzbSB1c2luZyBhIHNpbmdsZSBh
dG9taWMgdmFyaWFibGUuIFdoaWxlIGl0IHdvdWxkIGJlIHBvc3NpYmxlDQo+PiB0byBpbXBsZW1l
bnQgdGhlIGZlYXR1cmUgZW50aXJlbHkgYXMgYSBSdXN0IG1hY3JvLCB0aGUgZnVuY3Rpb25hbGl0
eQ0KPj4gdGhhdCBjYW4gYmUgaW1wbGVtZW50ZWQgYXMgcmVndWxhciBmdW5jdGlvbnMgaGFzIGJl
ZW4gZXh0cmFjdGVkIGFuZA0KPj4gaW1wbGVtZW50ZWQgYXMgdGhlIE9uY2VMaXRlIHN0cnVjdCBm
b3IgYmV0dGVyIGNvZGUgcmVhZGFiaWxpdHkuDQo+Pg0KPj4gVG8gbWFrZSBpdCBjbGVhciB0aGF0
IHRoaXMgZmVhdHVyZSBpcyBpbnRlbmRlZCBzb2xlbHkgZm9yDQo+PiBwcmludC1yZWxhdGVkIGZ1
bmN0aW9uYWxpdHkgKGp1c3QgbGlrZSBpbiBDKSwgdGhlIGltcGxlbWVudGF0aW9uIGlzDQo+PiBw
bGFjZWQgaW4gcHJpbnQucnMuIElmIGFuIGVxdWl2YWxlbnQgb2Ygc3RkOjpzeW5jOjpPbmNlIGlz
IG5lZWRlZCBpbg0KPj4gdGhlIGZ1dHVyZSwgaXQgc2hvdWxkIGJlIGJhc2VkIG9uIFNldE9uY2Ug
cmF0aGVyIHRoYW4gT25jZUxpdGUuIFVubGlrZQ0KPj4gc3RkOjpzeW5jOjpPbmNlIGFuZCBTZXRP
bmNlLCBPbmNlTGl0ZSBvbmx5IG1hbmFnZXMgdHdvIHN0YXRlczoNCj4+IGluY29tcGxldGUgYW5k
IGNvbXBsZXRlLg0KPj4NCj4+IFRoZSBkb19vbmNlX2xpdGUgbWFjcm8gcGxhY2VzIHRoZSBPbmNl
TGl0ZSBvYmplY3QgaW4gdGhlIC5kYXRhLi5vbmNlDQo+PiBzZWN0aW9uLCB3aGljaCBtYXkgYmUg
emVyb2VkIGJ5IG1lbXNldCBhdCBhbnkgdGltZS4gV2hpbGUgdGhpcyBtZWFucw0KPj4gdGVhciBy
ZWFkcyBtaWdodCBoYXBwZW4sIE9uY2VMaXRlIG9ubHkgbWFuYWdlcyB0d28gc3RhdGVzICh6ZXJv
IGFuZA0KPj4gbm9uLXplcm8pLCBzbyBubyBhY3R1YWwgcHJvYmxlbSBvY2N1cnMgaW4gcHJhY3Rp
Y2UuDQo+Pg0KPj4gT25jZUxpdGUgY3VycmVudGx5IHVzZXMgQXRvbWljPGkzMj4sIGJ1dCBtYXkg
YmUgY2hhbmdlZCB0byB1c2UNCj4+IEF0b21pYzxpOD4gWzJdIHdoZW4gaXQgYmVjb21lcyBhdmFp
bGFibGUuDQo+Pg0KPj4gWzFdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3J1c3QtZm9yLWxpbnV4
LzIwMjQxMTI2LXByX29uY2VfbWFjcm9zLXY0LTAtNDEwYjhjYTk2NDNlQHR1dGEuaW8vDQo+PiBb
Ml0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvcnVzdC1mb3ItbGludXgvMjAyNTExMTUwNTAzMDUu
Mzg3MjQxMi0xLWZ1aml0YS50b21vbm9yaUBnbWFpbC5jb20vDQo+IA0KPiBBcHBsaWVkIHRvIGBy
dXN0LW5leHRgIC0tIHRoYW5rcyBldmVyeW9uZSENCj4gDQo+IEkgaGF2ZSB1c2VkIHRoaXMgbmlj
ZSBjb3ZlciBsZXR0ZXIgYXMgdGhlIGJhc2lzIGZvciBhIG1lcmdlIGNvbW1pdC4NCj4gV2hpbGUg
dGhleSB3ZXJlIGp1c3QgdHdvIGNvbW1pdHMsIEkgdGhpbmsgdGhlIGNvdmVyIGxldHRlciBhZGRz
IHNvbWUNCj4gY29udGV4dCB0aGF0IHRob3NlIG90aGVyIGNvbW1pdCBtZXNzYWdlcyBkbyBub3Qu
DQo+IA0KPiBUb21vbm9yaSwgcGxlYXNlIGRvdWJsZSBjaGVjayB0aGUgbWVyZ2UgY29tbWl0IG1l
c3NhZ2UhIEFuZCBpZiB5b3UgZGlkDQo+IG5vdCBpbnRlbmQgZm9yIHRoaXMgdG8gbGFuZCBpbiB0
aGUgR2l0IGxvZywgcGxlYXNlIGxldCBtZSBrbm93IChJIGFtDQo+IHN0YXJ0aW5nIHRvIHRha2Ug
bW9yZSBjb3ZlciBsZXR0ZXJzIGludG8gdGhlIEdpdCBsb2cpLg0KPiANCj4gICAgIFsgQWRkZWQg
cHJlZml4IHRvIHRpdGxlLiAtIE1pZ3VlbCBdDQo+IA0KPiAgICAgWyBBZGRlZCBwcmVmaXggdG8g
dGl0bGUuIEZpeGVkIHR5cG8uIC0gTWlndWVsIF0NCg0KVGhhdCBzb3VuZHMgbGlrZSBhIGdvb2Qg
aWRlYS4gTG9va3MgZ29vZC4NCg0KSSd2ZSBqdXN0IHRyaWVkIHRoZSBydXN0LW5leHQgYnJhbmNo
IGFuZCBkb19vbmNlX2xpdGUoKSB3b3JrcyBhcw0KZXhwZWN0ZWQuDQoNClRoYW5rcyENCg0K

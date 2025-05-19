Received: from sonic310-24.consmr.mail.ne1.yahoo.com (sonic310-24.consmr.mail.ne1.yahoo.com [66.163.186.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08D2328641D
	for <rust-for-linux@vger.kernel.org>; Mon, 19 May 2025 16:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=66.163.186.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747673420; cv=none; b=SuvzJrQzyFuXZRxAhreOwcf+7kY7JMrWueDN444wK4v61dnknL78OIc3/Hu0OTQinJ88HqU0QXFUElQlqp+GLFjHMbV09VZy8plGaL/h0qkV7/5mXCz2zVG8iz6oEfjWe+YDZMBmdpEBgMbMovrIQBb67f0F1xDYD24U6zg2ESc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747673420; c=relaxed/simple;
	bh=eZJzkH667zh1ChamBMr0LgP/JUZb45fhQUCtTbzR044=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uYyQIIkeRXqg1y51niMyme6JLR5g5JiieLhbDHJLshiE79B0uyNCBOank+G5egPhGKyjb6Wy9PF3zAk64pOwCW7CURHfnciPswNEnCqGYqlglH6Xwjzt3jAPaWwkuzKFUp+uWwSAdaW8t+PvfvyxokfosmfBjSDWYlyA988ytxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com; spf=pass smtp.mailfrom=yahoo.com; dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b=cnj6HRSu; arc=none smtp.client-ip=66.163.186.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b="cnj6HRSu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1747673418; bh=TOGMbztvtGWk2jwI3gxqi6b0/RKexmZ9/Evi1cSAg18=; h=Date:Subject:To:Cc:References:From:In-Reply-To:From:Subject:Reply-To; b=cnj6HRSumehTWgXSc0x0RbqlgxeOjcboI5RaHPN00rbaRHOzr3zRHe+0DjjGg8aueqnakzkdX2ygVQuA7+Tn6zFJQK0JkiXCxhGz2TcGQHA5M/6jU9Y2kdimUKh2OdjZPwgw4+pE4U7Gmm9IU98/t3DOAcq4GdHHLRrPSTNU06xvSjSVdnXit0TC7XecGFT+nC/4GhMlBV+P2rDm2p/IEPZvvUrRZe1/NzgLE/A2pSXZERkEs1xTFaOuLfEZhXcSwX6U4hW7ETPpQr8EYXHTg6UNS5KGUTHBpOmWZWA922OZ4rIWhNt7wf0bL5HMNLZKYvumIfjZgBhaEDKZMdAxHg==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1747673418; bh=8YEKAGdjp+ibY0a5eNq+L1GF8gouKmSd1NlPgSdEGnf=; h=X-Sonic-MF:Date:Subject:To:From:From:Subject; b=LFL7oo/XoPj1NhyttusdyUJMOZxfQBI+RDfV60+TL4Kc+TRJ9ZoAi9YLVsVOfEpKICrNnzpoivUfxivBzUz89gHU4JTM8ziMw/Zg5DihOHC40q2CYPPB0YGkFEjb3/xRayUwiscPT9Z5774cYOWaWzKqfYKOahaCtzkTlXdqDGWQgcLQUQvS7HyfOGL8kPFe9MqOcOdek12hnTe6Bs5/mfhQAZa2riHVbDdR+xa2W2uHvRhWnGBPlqOpCuqyuG2zO0kgTPJCo90u+RjtKCHZKOz6c9O5UUp47q45uLasUtHR088HhlXdAPNUyUrigbTigaW4KQXrga3AHnpxQlyW0g==
X-YMail-OSG: .Ad8BRQVM1mIuD2rwcCQALuvyYdlSokonNWcJYLXZsCWko7dhktz7gC4bM.RoJn
 .K86Nyklbx6zE0VNqbpSGeU9VA8.NUpigd_.bKT752TgdzpRe2vgff4GSXMrauyFPOVdqU2yWK68
 n0ZS1_tnkrPJFb6SqVIjeM8mph7J73n_0hRBwB7zFYiL7JO3HTFuCFzHAj5Tzhlxbd58NLJa.QYU
 ikzfmGLBs4ibZwFDNDr5HCBIr3nU_CGH_qq6ZgOZiSC53bTyD8iUquNNJWFNR9C2gGGcj.ZAnwKl
 VB.PUo2nVlf91o2OJgaeCJ6dKMh3GEhm0oi2sBAHR7UXoagmleE4Nhyt962OfsZpPg1cuUivSWsS
 2faOjoSDJWYaNKcqvIB_b14245RELabzC7XFXy._f01SI5S0NU0G9iRTytaMp1nCjc.HWXsT.wSF
 CUM0eg3_qo3WpAGt1Ur2x7G8hpHIkjdATLOAUNsibNimHZblC4XrZ6HiHbtXqsw1QVH7aFXYFw4B
 .Jc7m9ghE5oBWDN3NKDlJJG7oSd2fdyvG0gD_mG3jCigR9jqUP3UDbGZ67djijfL8obC3.DAj_mw
 J9tYFVDlZpCU0SCemM6obECi4MsDJFKGQYdRNTPE4n92h8rDMSO8phi3e8Cs.VrDeZZ9phLE0257
 rGelGq4NiVYn5Jilb10CaeGPkq33.ZNBwUekc6GqD9RiCpEwtPy9HtejA9EKQU7BZvzzT.o9Khr_
 16B36boc6BLm9k74w4Sp2.NOf.9vi7DRvAe8_LEoietv.YPBtsMrGxWJ3_4ri_mT9Aq9.LlrVLuY
 bRBCeNyzt2DKVBY0TDp2MVrZE3rgG2DpuxBtb_Yo6r1TBM4uxYvRRyiKtMeU1mIA93UYia6qKDu.
 z0bCh93WzuxqbbrEe2.UVNYRANclmBxVFvpEmXb2jUcPaWi7Ksjyn6bVaZCvH6_HwV2mdg_XJboq
 szvmQNS.pZcFXbw1uPIdOrLc2E97U87Ux0.VAngIGhx0IVukybLnwK_BOQzt6gUug0gazgFO8M7O
 VvqO_yaoUSy0SgK1OcYCxVL6hbBa51Lut3rJi3L0ZhOj4mWybpnhLyfVJqgOfxEs_UJ6YG0J2NVV
 J9BizWWnB4plB8vF4aw2TbLDkb9dQuBXCCs7MDuM7H7NQtztqohprsi4hffluI7cIw8VZKhClyaN
 DJHqTS8o4aLq03Ekl5PXXwyM9VLPVB5jCShbLFd_hRRlD9.EJBOvA8n_MXdPGGlxJSJy9ICHL9Ou
 Gnfy5V819On.ynwXsvaSp.83PQCdKaA7e0b_Z5MFeP9qkCrU_VjErexN2e2zVuDKqfotA_SDC.s4
 nYHCAi4wPZYpy.ZfQXZZiJXbSOlNoqznyrDrYYn_.H7bmmQTOsr46mFi1lfSwEIzdzI9ppjO_Msl
 JD4IHWwXj_Wl8KIZepwJB1.9QT7g1rnjp3qC8MbpGDeLgwxj_z2vK7akKgl48cl6fxGxr7J4cTXh
 KU5JeSzVWzzdGKBLUjSYKC6Itep5OJSiDuGNVl0qKjAx313upx3.9BpVNhT6nByJJ_wmjr3tNXIA
 U96P7rglQh2QUGwLbULztaYPWZHo3S_8YpSEpXw8ujXh7.VJ9bzDvcAQuniXJylJ5S18vQcq5YeK
 B5OBN.V0cXJUexTdkoSGs47cBesfBf9E8EbqydCjJoeO.kx8bAFKUBW4R99kWvJet_xcE1fYPkyR
 xFOXO.UvR51Y9Nvnszj5YS.2SWOe.sKMHvpKDvNWnhJWGMVrRRwvMwirtQ1b9HPp78v5BupytiCJ
 DSts7xMPQrdvMC.oBW8.e9FdDna85jFEUZb7Rp7ttMcM4qKi7SS3XdG4Nu3glAO7DKw.sjdpznj5
 HNn_kKKHQg6roMEqqmLkXN0w06D3vR8OEjQoLoXxrO_k36_GurhTdxnV0X6Oe97EqUolGoTu7F7e
 BQTaKG1VSQi7LBzJFeucN.q7exE0wR3r7Vz96yIK_tLkPA4tWKGsef7YdB4e7E2RcDse_xFjVAbX
 9oyFABplVBaO.B9HaNaa3QO2_tdEZpjfaw3Cg0gfNVkz5Q1oWD0.gbK5OHCh6LsIp_xW2MAb2Skt
 eKDsM2zmr92n40HajGfHQeY6v048FlGE.ToWl5x.F.q7FuLJs8EQO9HKpGjy0MjZeeR1Lj4hJhlw
 H1iI_vUw_2v5UcQ1VkHpEpKDJF5I_T4REgN8WXK2ktQ9SQs4YFg--
X-Sonic-MF: <igor.korotin@yahoo.com>
X-Sonic-ID: caf1578b-099a-4bc9-8fb7-bc6f516ac697
Received: from sonic.gate.mail.ne1.yahoo.com by sonic310.consmr.mail.ne1.yahoo.com with HTTP; Mon, 19 May 2025 16:50:18 +0000
Received: by hermes--production-ir2-858bd4ff7b-c77nt (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID c6d6e1428892ee9078a6a007d60c832d;
          Mon, 19 May 2025 16:09:44 +0000 (UTC)
Message-ID: <54a0b100-a860-4c73-84aa-e5377bbd692c@yahoo.com>
Date: Mon, 19 May 2025 17:09:41 +0100
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] rust: macros: Fix macro referencing core and kernel
 crates
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 rust-for-linux@vger.kernel.org, Benno Lossin <benno.lossin@proton.me>
References: <20250516122349.1944895-1-igor.korotin.ref@yahoo.com>
 <20250516122349.1944895-1-igor.korotin@yahoo.com>
 <CANiq72=ErVyyszgnH0W56Bjvakvdcprh-Z0pXt+Pc25q4z_Afg@mail.gmail.com>
Content-Language: en-US
From: Igor Korotin <igor.korotin@yahoo.com>
In-Reply-To: <CANiq72=ErVyyszgnH0W56Bjvakvdcprh-Z0pXt+Pc25q4z_Afg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Mailer: WebService/1.1.23840 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.yahoo



On 5/19/25 15:20, Miguel Ojeda wrote:
> On Fri, May 16, 2025 at 2:35 PM Igor Korotin <igor.korotin@yahoo.com> wrote:
>>
>> diff --git a/rust/kernel/static_assert.rs b/rust/kernel/static_assert.rs
>> index d8120f838260..5e5a0bee9888 100644
>> --- a/rust/kernel/static_assert.rs
>> +++ b/rust/kernel/static_assert.rs
>> @@ -20,7 +20,7 @@
>>   ///
>>   /// ```
>>   /// static_assert!(42 > 24);
>> -/// static_assert!(core::mem::size_of::<u8>() == 1);
>> +/// static_assert!(::core::mem::size_of::<u8>() == 1);
> 
> Hmm... Why are we changing this one?
> 
> Thanks!
> 
> Cheers,
> Miguel

This is a mistake. I'll drop this change in v5. Thanks for the review.

I didn't receive Benno's reply in my mailbox for some reason, but I saw 
it on lore.kernel.org. Thanks to him as well for pointing it out.

Best Regards
Igor

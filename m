Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83F043C1F41
	for <rust-for-linux@vger.kernel.org>; Thu,  4 Jun 2026 19:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780601468; cv=none; b=UoQbcRf7kmjDeOXVPngKCHsKdDRUOsexYqtB5MeAIJFSBctbi7GIXAN3VQhJ1PXbY+NkiTUdsTWn5QVcK1wGd6SG5dXAheLxJlea4oRy/YgVLFlqqJTTFtnnUJVUsmgGzUm8hUEm4HiisPY/5Cfn/hjVvWTMfM366sjg5l2JzaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780601468; c=relaxed/simple;
	bh=HFYdEAs+JH3albeAFxDWqcgwOkU7UXOP/pCADtCn1fU=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=sHbXEpo9F12uE9cidmUdUjzmyKG79rWoE9ksK8NN5yaz5XmR9Y/+Bm0c3bCK3CjXUkOtHGy5ji8ClSD+Cisgkons7p9Avp3I6sYz5tUpRyMOzeZxhSHX1kXQN+Sjgrhg4YHsLvIVmPXKnrmJsT3CzZ59pt7tdyeadHNpP2CVHRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cDz1O6OL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cDz1O6OL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACC6A1F00899;
	Thu,  4 Jun 2026 19:31:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780601466;
	bh=HFYdEAs+JH3albeAFxDWqcgwOkU7UXOP/pCADtCn1fU=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject;
	b=cDz1O6OL4CTZzNv9JHA1/QlPDvXJ3vNTP5vO8SUMhMU+LLmdu3XaH6O/FbhI/kVTZ
	 XBrvFxf4rMqLBJVahuLIKHB95B7E28gqpvEceghKXyyPIdPE2Zzrqvb7Anl3vAXzQW
	 GuGXsV9tcCZi4cFAfvhwymPqooedwqyKcS49wlgIQD9WK8+o0FbBL2061hL77CcyDU
	 wz+PZH1kucNlHHsHbgtltxF8X2DTGINlw2iLwlM0dw3+s/hjJ5prXOPuNCCuqnxSIh
	 rfaOCYOcwCdaPnGsl36jGByb7cDdulsvkA0wCoNyNd4mdaC4G7nbHbVb6TOAk9wmYS
	 ILTASytcLamdQ==
Received: from phl-compute-10.internal (phl-compute-10.internal [10.202.2.50])
	by mailfauth.phl.internal (Postfix) with ESMTP id 90793F40084;
	Thu,  4 Jun 2026 15:31:04 -0400 (EDT)
Received: from phl-imap-16 ([10.202.2.88])
  by phl-compute-10.internal (MEProxy); Thu, 04 Jun 2026 15:31:04 -0400
X-ME-Sender: <xms:eNIhankz_6Tq2ePA2j7C1Zc_sQOR8CA0ynA-P8iwQDfFy7yQwcf9Zw>
    <xme:eNIhalp0AsbUIxzt70AAizngChYuYJ-v9v48I-TJpUIjN2Ew9sHSG1AtNX__I-RuY
    7cc7JSi7hxk04dOHBrU9yny7JIvLzlyjGsFZqsSEyzbmW1IemQfFw>
X-ME-Proxy-Cause: dmFkZTFI0hAjNyp3c6LtVjJMFoMG5hahGlho6D+/MU4SEN/s40Z7x8ZaJoiOHJae1daTHN
    drHbwW48fs4Bc/4uj/2IzwzlUjUl0IUqQxWU9c03vmViumPpBPdv55AK6a6CTVntWrLJd7
    77OjScC02I+DAfKHyYL9w3yxLc1SqNEG48iiCnjH6rQLYfd7L7nhKzxs4wEVi0zTd2/JHU
    3hWJUlrGanLe4AhBp3SsBEAo/flaQd7laDdYpE33oz2XEI3uzhLOROb6OTvXnuIUugTxhA
    rqObKF5RIjOGGsj4ItNNoaftdpcY8Wm1F1JuYYDim/HjrdecIAWx22wBkr3O6+ppAXVMZX
    oGFncD0qulxG0k6ox1aoTDMDYTCwJxz0ZAlsOV1IJ2lKSjN5b8E7BjVpFCl3m2cHB672Zk
    MTS2cPFAVZFsjEErI7aOeZeMyQP0P2k7A6k0ETqJFHpRuW7TcNfcjJ08lI/26RbMS9w7En
    2dny5OEY7WfHg+eoYCosi/tXev+WBUNPcshJ76OqrJi1svxCi0jcP0nPCj9DqzlMu4SFe1
    UUMhluMAgHSE9SAVA+Ek7XxO5cMBYXCClOJYOqWLGBupcboYJUKdBo9Hl9ma6Y2+UZBNil
    WJxA3evwan4GCiheAfFIVc5HEXf/MmAkFeoJnUDnu4JnxyA0nQbqRwm3D4aw
X-ME-Proxy: <xmx:eNIhatIZEmMP2RZ-yebEB0C_c9tH3mJJGa-0UxLb8-AT_mBNagTILg>
    <xmx:eNIhausJMw9SHazi-7eHUXbJHZhQCKff1wDF6VgqMvP02-ujmWapRA>
    <xmx:eNIhavTimVbJ_qARYtwpbbAnZgd84F7CwQIsiE0VA8PoAOpLjIq5aQ>
    <xmx:eNIhavQX49EDQIEMAPggMVlR_S0OmEcdwdu48K8V6i6VvFyTBrdSbQ>
    <xmx:eNIharqGIogbfm2-8FmnxaQ8DkF77I2rsvjfBmNCOIv_2YkZ8U1G8Oiv>
Feedback-ID: i8dbe485b:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 659462CC0083; Thu,  4 Jun 2026 15:31:04 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 04 Jun 2026 12:30:44 -0700
From: "Boqun Feng" <boqun@kernel.org>
To: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>,
 "Ashutosh Desai" <ashutoshdesai993@gmail.com>
Cc: "Miguel Ojeda" <ojeda@kernel.org>,
 "Peter Zijlstra" <peterz@infradead.org>, "Ingo Molnar" <mingo@redhat.com>,
 "Will Deacon" <will@kernel.org>, wl@lyx.org, "Gary Guo" <gary@garyguo.net>,
 bjorn3_gh@protonmail.com, "Benno Lossin" <lossin@kernel.org>,
 "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 "Danilo Krummrich" <dakr@kernel.org>, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org
Message-Id: <9a605dbf-91b7-47e2-b25a-28671abcc38a@app.fastmail.com>
In-Reply-To: 
 <CANiq72kJBH-4ENoLRLrezbcRovYGvx-TLODs_khOJwtr7dMz3A@mail.gmail.com>
References: <20260502160057.3402896-1-ashutoshdesai993@gmail.com>
 <CANiq72kJBH-4ENoLRLrezbcRovYGvx-TLODs_khOJwtr7dMz3A@mail.gmail.com>
Subject: Re: [PATCH v2] rust: sync: add #[must_use] to GlobalGuard and
 GlobalLock::try_lock
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



On Thu, Jun 4, 2026, at 11:44 AM, Miguel Ojeda wrote:
> On Sat, May 2, 2026 at 6:02=E2=80=AFPM Ashutosh Desai
> <ashutoshdesai993@gmail.com> wrote:
>>
>> Guard is marked #[must_use] since dropping it releases the lock. Glob=
alGuard
>> wraps Guard with identical semantics but was missing the annotation, =
so
>> discarding it would silently compile without warning.
>>
>> Similarly, GlobalLock::try_lock was missing #[must_use]. Option<T> do=
es not
>> propagate #[must_use] from T, so the attribute needs to be on the fun=
ction
>> directly - same reason Lock::try_lock has it.
>>
>> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
>> Signed-off-by: Ashutosh Desai <ashutoshdesai993@gmail.com>
>
> I could pick this one -- do you want me to, Boqun?
>

Yes, please! Thank you!

Regards,
Boqun

> Cheers,
> Miguel

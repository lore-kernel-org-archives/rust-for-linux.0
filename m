Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06E273FB14
	for <rust-for-linux@vger.kernel.org>; Wed, 21 Feb 2024 11:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708514873; cv=none; b=G6WKNnuxIwL5svr4qzew0qkaKAM5+wbsuYJbMBm5yTHl45D1viiauoH8ZUE0XvNCSqWV+UIkzbDZZrQXetHcTW6UxtrnI6HciPA8ytDtCDYgwvyCgXROTSWkbWVj0XZfWcarYiv2kJ+t9qcrTfweI6mPhXGatuXcfgeWOoiQjCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708514873; c=relaxed/simple;
	bh=lLkaJjhjgtCxb3/e9SmG1RbcPZm7bCnDCxeewfvPKJ0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XKLsDH5AlJFXVMLlMOxG29+ep97OMs1KOz3kNGHd6jZhyGxh41d/er8qnBt4qd97qqEEqOUJIw0Yu0bOOzaTY008PjCnvAuFNML0gIlCrN2f4oCWUebjFxn1ylbvfJnk/axBmFWegyRiEozVVTpthKLdS/OjQ13c92bkMhsmeEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=bEcuAq3E; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="bEcuAq3E"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=m29BcooUf7/G0cVVIuw6MKvrhHkkAogHCDoETXWEDpU=; b=bEcuAq3EJqCL0tu5EOUdCoW2a4
	WzktW/jwXkD+pFGVn8UL1vxhVEvaA8WHJI6cgINt0hOllygw31SnurOFgM2jYnCI5+a9ZuGI2aam+
	kA+bideqB9Sc08VzAragMzoQ7MRF8uDfoboojxqIm3s7hAP1qaJ/cSBsbbiQNy8ckoLvRDRtLF7rb
	r5IZn22PdZCYdu8FsyeEkwSGskdunnlgLhF5T8lgNsfGcCq7trcx70KoPppdXJVDau97KNC/pcBQn
	p8ZYUponGtKQiZAvzxW1yeBnVK82QdRNjdiLp4i80DcfTjCKdMncijunBKVDCuApS2rnQDbjhGgk9
	YLnVNdwA==;
Received: from [191.57.26.211] (helo=[192.168.151.5])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1rckkn-001wkJ-VR; Wed, 21 Feb 2024 12:27:10 +0100
Message-ID: <0477f3cb-84e0-4ce7-8196-cddb7dbd1448@igalia.com>
Date: Wed, 21 Feb 2024 08:27:02 -0300
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] rust: Add `container_of` and `offset_of` macros
Content-Language: en-US
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Asahi Lina <lina@asahilina.net>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng
 <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@samsung.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Matt Gilbride <mattgilbride@google.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@redhat.com>, rust-for-linux@vger.kernel.org,
 kernel-dev@igalia.com, =?UTF-8?Q?L=C3=A9o_Lanteri_Thauvin?=
 <leseulartichaut@gmail.com>, Wedson Almeida Filho <wedsonaf@google.com>
References: <20240217153315.56128-1-mcanal@igalia.com>
 <CAH5fLggPRcPc-5C8JY5FR7jQMbdNoc89EU0_QAqhG=6HiySZ=w@mail.gmail.com>
 <83571d1e-5710-47d6-9a6c-2a0bb5ab5e5a@igalia.com>
 <CANiq72mvqfu2akoMGOj-N0tUOAnvTMOBN1dYA7CZxcJqpd6Fog@mail.gmail.com>
From: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Autocrypt: addr=mcanal@igalia.com; keydata=
 xjMEZIsaeRYJKwYBBAHaRw8BAQdAGU6aY8oojw61KS5rGGMrlcilFqR6p6ID45IZ6ovX0h3N
 H01haXJhIENhbmFsIDxtY2FuYWxAaWdhbGlhLmNvbT7CjwQTFggANxYhBDMCqFtIvFKVRJZQ
 hDSPnHLaGFVuBQJkixp5BQkFo5qAAhsDBAsJCAcFFQgJCgsFFgIDAQAACgkQNI+cctoYVW5u
 GAEAwpaC5rI3wD8zqETKwGVoXd6+AbmGfZuVD40xepy7z/8BAM5w95/oyPsHUqOsg/xUTlNp
 rlbhA+WWoaOXA3XgR+wCzjgEZIsaeRIKKwYBBAGXVQEFAQEHQGoOK0jgh0IorMAacx6WUUWb
 s3RLiJYWUU6iNrk5wWUbAwEIB8J+BBgWCAAmFiEEMwKoW0i8UpVEllCENI+cctoYVW4FAmSL
 GnkFCQWjmoACGwwACgkQNI+cctoYVW6cqwD/Q9R98msvkhgRvi18fzUPFDwwogn+F+gQJJ6o
 pwpgFkAA/R2zOfla3IT6G3SBoV5ucdpdCpnIXFpQLbmfHK7dXsAC
In-Reply-To: <CANiq72mvqfu2akoMGOj-N0tUOAnvTMOBN1dYA7CZxcJqpd6Fog@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Miguel,

On 2/20/24 12:54, Miguel Ojeda wrote:
> On Mon, Feb 19, 2024 at 10:57 PM Maíra Canal <mcanal@igalia.com> wrote:
>>
>> Thanks for your explanation, I haven't thought through this point of
>> view. Anyway, any chance we could land the `container_of!` patch as soon
>> as possible? It would be nice to have a common understanding of this
>> fundamental macro. I would like to send some patches with the DMA fences
>> abstraction, but I would need `container_of!`.
> 
> Would you be OK with their version? If so, I could take that one; and
> if not, we can discuss what to do.

Considering Alice's points, I'm OK with their version.

Best Regards,
- Maíra

> 
> But, in any case, as Alice mentioned, please feel free to send your
> series even before that. It is anyway a very small dependency that
> will soon go in.
> 
> Cheers,
> Miguel

Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 615964B8DCC
	for <rust-for-linux@vger.kernel.org>; Fri,  5 Jun 2026 11:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780657395; cv=pass; b=XMNOuya6KJh5p2PHpqp2cid5Sjd7ohdpQ8LCy9OQ5SW99h+c9nKY2AZkCLljF2zvk4Ed/e5RitiutsGFHkG5zBdNo32tZxPNB6G+QGyri5zaiXkRqEtIILJTeqFbkCqwfhyYth+va0mR/Lfi7LRZGdxhK4O2l5apd2G6/ER5hF8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780657395; c=relaxed/simple;
	bh=f1MUM6D03lZH8m9sJMdZV49CHTFZPYYABFO8u2/04d0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jTT8s/ggidr2lRm4xtZxNcytlC0ydPXnE/QEfwr0Y1PfhtyjOn/JmAHYzSSJxyJAjfDOq+Fogj+979gveghb9zcC8Qe3hR7Y2KTfnaZu72okWcAzHTM8oqeTA4r2RIvW1XwVkrxiScaYGKGzQInDo9lyiuntydBpDhbpR2du628=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JdT7gPSd; arc=pass smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JdT7gPSd"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-304eb0fc233so153565eec.3
        for <rust-for-linux@vger.kernel.org>; Fri, 05 Jun 2026 04:03:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780657393; cv=none;
        d=google.com; s=arc-20240605;
        b=OJsQONg57jEJwF2EImCIq+Ny2WqJRGr7+UbMash+H4NNKu/NxokVBGpe/QyZ0w7eZp
         sYkpFk3866oHrjYv8LPW06P1oaFHwrqnEIaRKUTc6ow48hwXyT7fLktkNb//m688/nRf
         3uZ3HEe0qjOKzP7OkN+xriyt6QjCLbqm1/7LnF9speKAJhjHahw6mJxzGoOtePkerTpm
         ezFnphQZSdQFX6fWFlvKjk0UvG1svDb+hQE5E395I+NZXdkSy3xUWAyBsMi3KejSlkSA
         uxYfpEV5/I8olcckoOyHUOgqhf5471l8D82DMfk+B7GR7qUcLdD/O0gijHXHwdQWcpgj
         rppQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=f1MUM6D03lZH8m9sJMdZV49CHTFZPYYABFO8u2/04d0=;
        fh=6LGoPepNRq37YZuJ+TN3NogU3Er1Uq6dMjFeZn+moVk=;
        b=KcvvwF0lEb9H/FejkHYrtAwpMTZr0IOIg5cYat0jP/pdyyBwvlwNKvBlN3Ux+Wh5fH
         W5EpNJgfBb5RwV1UJRb9jbjZJIh2oHyTfCIPiIR2yeWwgMZNOLEDqz/YPiqJdfFFb4Pt
         4PcHW1mr5YumuJy5NFcdQQFnDOQ5Fe0bj0G7Z1keFd4UnUjVUCpsxGnCbhUpK0VlRtJR
         pzYIuC3qI5sp+NktEcY27DEndzBNvSBgr/0AHedzl2uENarinfWHDCAaKH723i1ORiF1
         uPQYAkWChtIf9KRzmB7zFVgus1C+nG/gxqcNMYMfrtquVxgUTK9NOGEId3SqkWMVatFx
         Uuvg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780657393; x=1781262193; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f1MUM6D03lZH8m9sJMdZV49CHTFZPYYABFO8u2/04d0=;
        b=JdT7gPSdXdxzb8+YuwFowHuC/lI1Sm3/kGh9Xj8BdBRBWSJHgplpb1IlCqMeHXbMx3
         8hf9C29D6on+4K98IIe9PUfMYYY5lJ+fO98lUNVu0YcDsBICMvhken6eSgFpqzIjvjzx
         Geud/Fu9jWWrpoCtWYAtRC9NrQJUtuMAxB1Ientqi+acYVHnPK9DDcuX0hi1Q8zsUtlh
         H2coFNgFwhM7EPiyO3IDpKYX4wJM8UMzeYT0fSkMcuf8y+T57Yv30olxxiuIsGB178b1
         iP8WxWhGyGYgTq/kKaB74/rFlY1Bx2LlEyOeDus+dnNcduTpfS7tjamnqiViGrZFcCMw
         xYOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780657393; x=1781262193;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=f1MUM6D03lZH8m9sJMdZV49CHTFZPYYABFO8u2/04d0=;
        b=o7XLp3G9DlAfqzhU5jFrBSSG1WwNAspVM4g2spEvCYDTqPGsADmQoBqp+xIpCGp2QY
         GbK4xlcadr5Vel1TZsQSicxIKDiwelEnFnbFBuDmuVxYNO0ImkFlKh7we9xhjkNbriO1
         40NubYYOaVYMmkyUedvrv2LCB8+5N7m59dsrQxNvDPw7fNhfjPcdjCj4vyVovfZ/q/T3
         FK3PpqsTg1w66ZxZoMOWj7mWpIT84rWh5z2L/cAo/0uz8xSq4PpVQjzxdR+kY8JS2g9Z
         Z8KHiNvx+Y/1+LNYNobSfiHJygc03zkMmwKFDOL+WCiiGhxr7WspxhmQyk4hxSya0DLz
         ZzMQ==
X-Forwarded-Encrypted: i=1; AFNElJ/ymCtLrg2qRBfDe/WBSSBuE9bT/ZUfT2U9RvdxXEK6l0nOEvHd0GgRH4hy9zydV7SMCJnOMsueYzlJ1JP3Vw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzzf5NRp9jFxXm9lWdhRcZHHzXgADl8/PyN15sYa/AxSe9OiP4S
	oNDxLxfTqMV2tJ+OXTKUjVs7T4CKlCb86vyNvBa7TNfyXGI9EEX4zq9Jr5d9cLM1P/KTIX2rJZS
	LpFmPvBbpaPhIjOZCXCx+/B5sFRix+4M=
X-Gm-Gg: Acq92OHvvMY7EbrR62r8MH6OR61J7O9FPI1o5tjXjeAFeS4lFI2mDYJd7RkES+NGsvM
	VqtqvOIvQ8/ZRCO80mPTc2tvV5uXTgK7eowq33ITn9eNHEww+o4niA+3+sxS1KebmB3uQdMclJV
	rELi/HrVs5IEMXCzbqUwppe2FWx562OigKkWWldJwxh4x7K6BJnZWgaZ94/DxNkTuX/yJ7+mJ0J
	tLixC+PAq/MJt6C+6C+7VcdkhzWRtsLALOqxGksjGQ5oY4kuWW75MWay5KbKPEZLqk8JsSvStfF
	6CpMMlCbsSyqxxxgnBNNj/kk2WKLd3jMbOIZCWNBQ5E6Wsx3RE/uT3dWbNUp6U4sOjAL4cQ9jd7
	Ix5dh5hwuG7rPP3DELlt3i9cGmFooJvFVVw==
X-Received: by 2002:a05:7300:bc0c:b0:304:8860:74dd with SMTP id
 5a478bee46e88-3077b57ff09mr582723eec.8.1780657393363; Fri, 05 Jun 2026
 04:03:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <226152a3-1e4c-4eec-9a17-1d40426a7b18@I-love.SAKURA.ne.jp>
 <20260604210704.41751-1-ojeda@kernel.org> <89f0f308-2ee7-4c68-b811-8132e5d88530@I-love.SAKURA.ne.jp>
In-Reply-To: <89f0f308-2ee7-4c68-b811-8132e5d88530@I-love.SAKURA.ne.jp>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 5 Jun 2026 13:02:59 +0200
X-Gm-Features: AVVi8CdqkuEhPtbDH0s4twQIZkrvVriRAJrVBmrFnoy9Lj0_mQmQbpOfQv8yYl4
Message-ID: <CANiq72nGo=F5D7b7Hx8A1jfAJw_72Np+UpRWBRQoPLAE+RAPpA@mail.gmail.com>
Subject: Re: [PATCH v3] block: assign caller-specific lockdep class to disk->open_mutex
To: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Cc: Miguel Ojeda <ojeda@kernel.org>, akpm@linux-foundation.org, axboe@kernel.dk, 
	bvanassche@acm.org, dlemoal@kernel.org, hch@lst.de, hdanton@sina.com, 
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
	tom.leiming@gmail.com, wqu@suse.com, Andreas Hindborg <a.hindborg@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, rust-for-linux@vger.kernel.org, 
	Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 5, 2026 at 12:15=E2=80=AFPM Tetsuo Handa
<penguin-kernel@i-love.sakura.ne.jp> wrote:
>
> Oops, it seems that I overlooked the rust-for-linux@vger.kernel.org line.

I am not sure what you mean -- it is not just the mailing list, the
maintainers and the reviewers of both entries were not Cc'd either.

So like 9 Ccs are missing...

> I am using my tree for allowing syzbot to test debug/experimental patches=
 in linux-next tree

linux-next is only meant for patches that are already reviewed, tested
and destined for the merge window.

It is not meant for experimental patches, and adding those, especially
this late in the kernel cycle, can break other people's CIs and
systems at the worst possible time. If every maintainers put random
patches in linux-next, then it would be unusable...

(There are exceptions, of course, but only if people is aware and in
agreement...)

> Do you see any technical problems except comment style problem?

The above errors are already a technical problem -- they break the
Clippy and docs build!

I assume Andreas or Boqun will eventually take a look at the patch now
that they know about its existence (is there a particular reason to
rush?).

> Nothing bad is going on. The final patch will be sent to linux-next tree =
via
> appropriate tree after getting acks from maintainers, and the current pat=
ch
> in my tree will be dropped when maintainers accepted the final patch.

No, please drop it now -- the patch shouldn't have been applied to
linux-next yet, since the maintainers didn't ack it (they just
realized it exists...), it is not reviewed (apart from Sashiko), it is
not tested enough (given the errors above) and not destined for the
next merge window (for all the reasons before).

Thanks!

Cheers,
Miguel

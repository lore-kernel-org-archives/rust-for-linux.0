Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A58E364051
	for <rust-for-linux@vger.kernel.org>; Tue, 31 Mar 2026 19:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774985367; cv=pass; b=JJc95XkzsWj8TSuPMIQMlG9z/qh2ZE5yn8DN28dk2m6lkXQOv9RGPM1THjUOLGZ4s+zzGU5nHr4zbwgmZzXXhogWOCQRRvNyRxHS8NmIXJAlJSanCve2onA16QBhYpp2Mf7jeeimjSM1rJGOcdhvCPjn8iZGlJPLUvr92n/xaGU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774985367; c=relaxed/simple;
	bh=xpqmZ9h9RQK15J306s7zWBOySPu8iNA3KSFwOZhoTgg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f+ZCdXQGW9LJRk6qvIpvHs372m2ehW1/Yx4SnF8k5bahaBBg8RNntL8AEmHcrHny6mwEjDNPE0KV7pTh1zWrH3pQ9qNYCtkfoGyGDOD3/g1F4ZKfKfp+h1Qqnc7WcLow/ppnneFpoutjVloAMK6eu6tTWqnxMM/OCp0e58rZ9jU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J6Nd8486; arc=pass smtp.client-ip=74.125.82.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J6Nd8486"
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-12714f01940so385325c88.0
        for <rust-for-linux@vger.kernel.org>; Tue, 31 Mar 2026 12:29:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774985364; cv=none;
        d=google.com; s=arc-20240605;
        b=dYBMDHoiM8LrX/8OyQUEPSszNz02pz1VzrZz+11pdlywV23g/TQNIq3v27eFkFdWb5
         7sVLsQ332SFt9juG4vzVP2dtLNjJHbAwNi4sVG0aBzF+qWhxELFO8C7VGWMygdbr9z5u
         zL4NMO1wKuRHQ4Ej2y5ZOBnaq1TeOuq2tley/HHY2shwo9dv1UoUqeLTgWdKELPemfVu
         umRVLA7fbloUnPB8Qev872GEoHWw5ceE93AmqE+a2Ixb9YbDF3gvWKtWipcOkEWsfdbq
         Ng2+Nbmbpx6gNlckCAjX6ytNf05+EtuxgSOxUZ6SQynyR87kwPqIFi8RHng6mWV7gTD3
         1gug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/rfgZQxJYxwEpP1vVpWT80yXlNK+hjiwYrl3WqiPsMU=;
        fh=nx3zVayqzpFmMebo1OeRAyZrpW3P5gBR8Q2taYgXIBg=;
        b=Mahmoo52XF0zacOPh3B4CP90O83/ahovqbCcfb29NVkDyUN16iScy17yAXqiTicxAL
         p/7qjr/4Z7yYg7s2MXK1VCuzNTKlz0TBiR3sc8asdhxUEClX23cWsq9h2B+t+0lgolQi
         whyX3o6Yf1/8FCxnZqyqVwjE0eCpGfcBmyHoyUvcCmon2KbH7GXYkwhd1VbM8FO4950f
         WGfCTWw+3q6oq/q/SH4yh2AHbL1Ri4fX0vZZKjJB4cTV23aOCEsmZvzU7AfAlcIsXoOl
         6ElT7VMe+y2DSAaFkItt2f/Kuont2kkeeidit42auZJKAMvOTCMPzkFsXw4O1DKC0+vQ
         y/kg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774985364; x=1775590164; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/rfgZQxJYxwEpP1vVpWT80yXlNK+hjiwYrl3WqiPsMU=;
        b=J6Nd8486192BCqrKNXlLPFmBUajEd4UGRrKGoknAtWPnsxnehrIx6/MKG84BPUB3Ax
         rINw6+w4WWsQ4smM7Za4f3ZuutkwWUaOH9L9fsQfrF1SnjI+dkNDquI+gb/CE+wnfe98
         d0bzth2vyEljS/BJYt/p41u89+NF6sePtP3SEIavK4W3eb4eA1XfqDxSWhWakU1NLUv9
         qzJPSPcLsaIMQY/PFv3qh5NePZ37+SWtZ4Hi9l9keqkieQu80RRfdzwdlXE7wwvNgxuu
         Vi/z0SnVBA69litOItRS+rY/xx1XdGLmqoxhRR9t0rD4WGpJ7QIIFLLH6VsQqC65+qam
         PLAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774985364; x=1775590164;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/rfgZQxJYxwEpP1vVpWT80yXlNK+hjiwYrl3WqiPsMU=;
        b=choSjSVQjHxyOdaeRcgpfaljSJuCiYeyZRuQb+DdwnHtmvFBO0UtyEBQOVHbQVGv/0
         7jpuXSQSJiDkXdf56GMR5RVBZxaeZ5k2joxbPVKRkWwSZKLgbeGSaNSDWZCoEXagjmJ0
         noIkbw2nNx1MmC+2fuawRiJhiYVuA35/fhxP+HnGMqgxqXVOxSRd4eFOwZyRwWjLBQIK
         kYxD49iGJIUehc/UqgL3DLiOhqBe4yquZBBUwfhb2MyMiPuCR7hHVI+c6jbS97POw2EP
         EHeoBovQDZHBAefe+rVfwZ1M6nwqT6j+hJ/k9UXwmWGRAGOJe64ICT9dX9HfQFP4STkF
         sZfQ==
X-Gm-Message-State: AOJu0YzMbzMJz4pxhhMIErsJDV+eKnmdNkQ1Is+YWc5paCadmd8UVjA+
	ky3sTchm0NLirak/l3VMVLduDMGcZ20312l7ffDdFtxP23kA8Wq5vf3wUVD1UMXAaIogSMuFeln
	nduVlk8r1b04LQNdhnDRDXZGYE1lh/Ig=
X-Gm-Gg: ATEYQzyOVQClFtytGM42WAlDSfo22dGV6+HD29+367uvOKfsymUNSwHGp5NVvq2SOqH
	8T7BbB6yNqNcH6ydsnaTaQc2lNVtRPbGDOnbzjr1XNlcX/vGMqjtKEm2KMu3V2c3R937R0KPVn+
	PORElmrAWs+t4+U6nTtMLyowRhouX4eTT5k2+6Obxs2xai4bgR68uGS8jbikpv9dwd03mzQrZ34
	TutODbecOSYAK10hAu77SyAAOAJmajgecQoTvcDUYxAYXpv/GlV2tjVd9cVZoU6tT5K4XdFPMu7
	zX0sgsR9CnD9UZeJwywh/72U6XzvCReXWR51QHdajq4egggze4zf9lheaGkU53nJNY74PizGK5L
	p2v6n5f+mxACy/EtS3z85snlbzbfooSRm9w==
X-Received: by 2002:a05:7300:6428:b0:2c7:3c4f:7eb7 with SMTP id
 5a478bee46e88-2c92de47697mr146974eec.0.1774985364102; Tue, 31 Mar 2026
 12:29:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260331190308.141622-1-david@readahead.eu> <20260331190308.141622-2-david@readahead.eu>
In-Reply-To: <20260331190308.141622-2-david@readahead.eu>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 31 Mar 2026 21:29:12 +0200
X-Gm-Features: AQROBzBmPLWkmJ1xK4KRsl2Fki6_LU3G42YxjAzfsTn8PgQGKdEZEx43kUoY3ZA
Message-ID: <CANiq72=AiBdKY0autf9wW=wLFNS+c7q9GUDryM2OKEO0uLwTBA@mail.gmail.com>
Subject: Re: [RFC 01/16] rust/sync: add LockedBy::access_mut_unchecked()
To: David Rheinsberg <david@readahead.eu>, Boqun Feng <boqun@kernel.org>
Cc: rust-for-linux@vger.kernel.org, teg@jklm.no, 
	Miguel Ojeda <ojeda@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>, 
	linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 31, 2026 at 9:05=E2=80=AFPM David Rheinsberg <david@readahead.e=
u> wrote:
>
>  rust/kernel/sync/locked_by.rs | 30 ++++++++++++++++++++++++++++++

Cc'ing "RUST" and "LOCKING PRIMITIVES" (Boqun).

Cheers,
Miguel

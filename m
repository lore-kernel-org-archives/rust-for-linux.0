Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E732C64EC4
	for <rust-for-linux@archiver.kernel.org>; Wed,  8 Mar 2023 15:20:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229667AbjCHPUk (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Wed, 8 Mar 2023 10:20:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229605AbjCHPUV (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Wed, 8 Mar 2023 10:20:21 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24F6297FEA
        for <rust-for-linux@vger.kernel.org>; Wed,  8 Mar 2023 07:19:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1678288773;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ZgwktT8M+kuZL3ds+rvp4biP/Gs8JikDQD7POfmJAag=;
        b=LsH8oHbTjbl/dySPw47O1YZA0is5cbgVo/hiu6LRn54DathUgLjgTJgeYj/JpbSIZB46tF
        FxFMsWx4uCJezZ0jFKWzHx/o72jDJEqxhK5aUtWfNhpszBW13Z0FvVMzYTYWT4N9bmSQG4
        SLad5rsN54+GZMvDBwozWWNPnhEfDaE=
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com
 [209.85.222.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-569-QfDODZ5mOHudcZqMytoVjQ-1; Wed, 08 Mar 2023 10:19:33 -0500
X-MC-Unique: QfDODZ5mOHudcZqMytoVjQ-1
Received: by mail-ua1-f71.google.com with SMTP id j21-20020a9f3095000000b006901584fb3aso8094687uab.7
        for <rust-for-linux@vger.kernel.org>; Wed, 08 Mar 2023 07:19:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678288770;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZgwktT8M+kuZL3ds+rvp4biP/Gs8JikDQD7POfmJAag=;
        b=DCSwY1EA9uTtVIpW7zgmvRN5L6GbU13AGW3WsT1XdjGhVDjxcV/ILnv05Dma4OMsbg
         5k1AgF+EXGtAOCopQapLcBmggMWgvZqmsTmkLxCldlabq6Ie/5PGwY1AFWEa8YG+FPKb
         p2jaEG6zC51okOxDhIM22kH0OX95t1nkQGSgLnSisDTZv9m12dMXnbVMAWsLq0OjU/hW
         2pEsaDVPe1ypv2sLeqnouc2TJBMeMYBlV6yIc/DTO3T8ZA3CogMsPFA4x9pibWzHsWrN
         9MfRGWsfrX+1HTw6CpCLoH27lnNWTPs/wRlgUYUGRnqEhryxOxTm4lX7avaIECG5VzXl
         syGA==
X-Gm-Message-State: AO0yUKVl0mplR9Ff6b791778kVNLWrdUZmuw1Y10qSzy2B0o1XwLHpbC
        HsbdW369NRyzKV7KF5KOwdyE4nm9qdDLiw3vebZlDlfxrNxxcGqXm3EVlHW/MfBLOxkXRq8B+7x
        +7kUpW5HXiSAdXHumm7H6/N/On7YoZSq2DtYwJF+OS3g=
X-Received: by 2002:a67:e94c:0:b0:421:c4a7:872b with SMTP id p12-20020a67e94c000000b00421c4a7872bmr9893519vso.6.1678288770287;
        Wed, 08 Mar 2023 07:19:30 -0800 (PST)
X-Google-Smtp-Source: AK7set+LFkvKeeVI3ttwm6kpFUQRkNGkfJ8qbDCG4jHcdwVIQ4SiuFcDQxKvoIfsyVYsxcEJcY4MnTcZLVjC63cvuTo=
X-Received: by 2002:a67:e94c:0:b0:421:c4a7:872b with SMTP id
 p12-20020a67e94c000000b00421c4a7872bmr9893505vso.6.1678288769989; Wed, 08 Mar
 2023 07:19:29 -0800 (PST)
MIME-Version: 1.0
References: <20230307-rust-drm-v1-0-917ff5bc80a8@asahilina.net>
 <20230307-rust-drm-v1-10-917ff5bc80a8@asahilina.net> <cd788ccf-0cf1-85d5-1bf8-efc259bd7e11@amd.com>
 <CACO55tsnCMQt8UW5_UCY139kpZOdNXbMkBkFfUiB12jW5UgVmA@mail.gmail.com>
 <0d6cd23b-8c9e-067d-97ff-aa35dbbcf9bf@amd.com> <CACO55tumNMYrcJ0LhnLfTK4DmGLHD-bt3xpXyoPe98V2wmgXQg@mail.gmail.com>
 <269c4fb7-60f6-6778-444d-15703febea58@amd.com>
In-Reply-To: <269c4fb7-60f6-6778-444d-15703febea58@amd.com>
From:   Karol Herbst <kherbst@redhat.com>
Date:   Wed, 8 Mar 2023 16:19:17 +0100
Message-ID: <CACO55tuVVnC-_iVmX=SGGVF=0t6kqqr0Cy0pGe3YoppBgUbiXw@mail.gmail.com>
Subject: Re: [PATCH RFC 10/18] drm/scheduler: Add can_run_job callback
To:     =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc:     Asahi Lina <lina@asahilina.net>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Miguel Ojeda <ojeda@kernel.org>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Wedson Almeida Filho <wedsonaf@gmail.com>,
        Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
        =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Luben Tuikov <luben.tuikov@amd.com>,
        Jarkko Sakkinen <jarkko@kernel.org>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        Ella Stanforth <ella@iglunix.org>,
        Faith Ekstrand <faith.ekstrand@collabora.com>,
        Mary <mary@mary.zone>, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        linux-sgx@vger.kernel.org, asahi@lists.linux.dev
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Wed, Mar 8, 2023 at 4:09=E2=80=AFPM Christian K=C3=B6nig <christian.koen=
ig@amd.com> wrote:
>
> Am 08.03.23 um 15:43 schrieb Karol Herbst:
> > [SNIP]
> > "further"? There was no discussion at all,
>
> Yeah, well that is exactly what I wanted to archive.
>
> >   you just started off like
> > that. If you think somebody misses that connection, you can point out
> > to documentation/videos whatever so the contributor can understand
> > what's wrong with an approach. You did that, so that's fine. It's just
> > starting off _any_ discussion with a "Well complete NAK" is terrible
> > style. I'd feel uncomfortable if that happened to me and I'm sure
> > there are enough people like that that we should be more reasonable
> > with our replies. Just.. don't.
> >
> > We are all humans here and people react negatively to such things. And
> > if people do it on purpose it just makes it worse.
>
> I completely see your point, I just don't know how to improve it.
>
> I don't stop people like this because I want to make them uncomfortable
> but because I want to prevent further discussions on that topic.
>
> In other words how can I make people notice that this is something
> fundamental while still being polite?
>

I think a little improvement over this would be to at least wait a few
replies before resorting to those strong statements. Just before it
becomes a risk in just wasting time.

> >>>> This is clearly going against the idea of having jobs only depend on
> >>>> fences and nothing else which is mandatory for correct memory manage=
ment.
> >>>>
> >>> I'm sure it's all documented and there is a design document on how
> >>> things have to look like you can point out? Might help to get a bette=
r
> >>> understanding on how things should be.
> >> Yeah, that's the problematic part. We have documented this very
> >> extensively:
> >> https://www.kernel.org/doc/html/v5.9/driver-api/dma-buf.html#indefinit=
e-dma-fences
> >>
> >> And both Jason and Daniel gave talks about the underlying problem and
> > fyi:
> > s/Jason/Faith/g
>
> +1. I wasn't aware of that.
>
> >> try to come up with patches to raise warnings when that happens, but
> >> people still keep coming up with the same idea over and over again.
> >>
> > Yes, and we'll have to tell them over and over again. Nothing wrong
> > with that. That's just part of maintaining such a big subsystem. And
> > that's definitely not a valid reason to phrase things like above.
> >
> >> It's just that the technical relationship between preventing jobs from
> >> running and with that preventing dma_fences from signaling and the cor=
e
> >> memory management with page faults and shrinkers waiting for those
> >> fences is absolutely not obvious.
> >>
> >> We had at least 10 different teams from different companies falling in=
to
> >> the same trap already and either the patches were rejected of hand or
> >> had to painfully reverted or mitigated later on.
> >>
> > Sure, but that's just part of the job. And pointing out fundamental
> > mistakes early on is important, but the situation won't get any better
> > by being like that. Yes, we'll have to repeat the same words over and
> > over again, and yes that might be annoying, but that's just how it is.
>
> Well I have no problem explaining people why a solution doesn't work.
>
> But what usually happens is that people don't realize that they need to
> back of from a design and completely start over.
>
> Regards,
> Christian.
>
> >
> >> Regards,
> >> Christian.
> >>
> >>>> If the hw is busy with something you need to return the fence for th=
is
> >>>> from the prepare_job callback so that the scheduler can be notified =
when
> >>>> the hw is available again.
> >>>>
> >>>> Regards,
> >>>> Christian.
> >>>>
> >>>>> Signed-off-by: Asahi Lina <lina@asahilina.net>
> >>>>> ---
> >>>>>     drivers/gpu/drm/scheduler/sched_main.c | 10 ++++++++++
> >>>>>     include/drm/gpu_scheduler.h            |  8 ++++++++
> >>>>>     2 files changed, 18 insertions(+)
> >>>>>
> >>>>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/d=
rm/scheduler/sched_main.c
> >>>>> index 4e6ad6e122bc..5c0add2c7546 100644
> >>>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
> >>>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> >>>>> @@ -1001,6 +1001,16 @@ static int drm_sched_main(void *param)
> >>>>>                 if (!entity)
> >>>>>                         continue;
> >>>>>
> >>>>> +             if (sched->ops->can_run_job) {
> >>>>> +                     sched_job =3D to_drm_sched_job(spsc_queue_pee=
k(&entity->job_queue));
> >>>>> +                     if (!sched_job) {
> >>>>> +                             complete_all(&entity->entity_idle);
> >>>>> +                             continue;
> >>>>> +                     }
> >>>>> +                     if (!sched->ops->can_run_job(sched_job))
> >>>>> +                             continue;
> >>>>> +             }
> >>>>> +
> >>>>>                 sched_job =3D drm_sched_entity_pop_job(entity);
> >>>>>
> >>>>>                 if (!sched_job) {
> >>>>> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_schedule=
r.h
> >>>>> index 9db9e5e504ee..bd89ea9507b9 100644
> >>>>> --- a/include/drm/gpu_scheduler.h
> >>>>> +++ b/include/drm/gpu_scheduler.h
> >>>>> @@ -396,6 +396,14 @@ struct drm_sched_backend_ops {
> >>>>>         struct dma_fence *(*prepare_job)(struct drm_sched_job *sche=
d_job,
> >>>>>                                          struct drm_sched_entity *s=
_entity);
> >>>>>
> >>>>> +     /**
> >>>>> +      * @can_run_job: Called before job execution to check whether=
 the
> >>>>> +      * hardware is free enough to run the job.  This can be used =
to
> >>>>> +      * implement more complex hardware resource policies than the
> >>>>> +      * hw_submission limit.
> >>>>> +      */
> >>>>> +     bool (*can_run_job)(struct drm_sched_job *sched_job);
> >>>>> +
> >>>>>         /**
> >>>>>              * @run_job: Called to execute the job once all of the =
dependencies
> >>>>>              * have been resolved.  This may be called multiple tim=
es, if
> >>>>>
>

